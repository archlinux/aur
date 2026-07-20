# Maintainer: coffee <coffee@coffeecat.top>
# Contributor: coffee
#
# Camoufox browser binary (~633MB) is downloaded from GitHub releases at build
# time and bundled in the package, so pacman manages its lifecycle.
# The download URL is resolved from the API at build time — no hardcoded
# asset URL. npm handles Node.js deps.

pkgname=camofox-browser-bin
pkgver=1.12.1
pkgrel=2
pkgdesc="Anti-detection browser server for AI agents — REST API wrapping Camoufox stealth browser engine (Firefox fork with C++-level fingerprint spoofing)"
arch=('x86_64')
url="https://github.com/jo-inc/camofox-browser"
license=('MIT')
depends=('nodejs>=22')
optdepends=(
  'yt-dlp: YouTube transcript extraction plugin'
)
makedepends=('nodejs>=22')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/@askjo/camofox-browser/-/camofox-browser-${pkgver}.tgz")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}"
  tar xzf "${pkgname}-${pkgver}.tgz"
}

build() {
  cd "${srcdir}/package"

  # Install production deps
  npm install --production --no-audit --no-fund --ignore-scripts 2>&1

  # Apply upstream bugfix: missing `await` on virtualDisplay.get()
  sed -i 's/vdDisplay = localVirtualDisplay.get();/vdDisplay = await localVirtualDisplay.get();/' \
    "${srcdir}/package/server.js"

  # Repack with node_modules for clean install (avoids npm symlinks).
  # The tarball ensures npm treats it as a local file in package(), not
  # a registry package name.
  cd "${srcdir}"
  rm -rf "camofox-browser-${pkgver}"
  mv package "camofox-browser-${pkgver}"
  tar czf "camofox-browser-${pkgver}-bundle.tgz" "camofox-browser-${pkgver}"

  # Resolve the latest compatible Camoufox browser binary from GitHub releases
  # Same logic as camoufox-js's CamoufoxFetcher: queries
  # https://api.github.com/repos/daijro/camoufox/releases and picks the first
  # non-prerelease/non-draft asset matching camoufox-*-*-lin.x86_64.zip
  echo ":: Querying GitHub releases for Camoufox binary..."
  cat > "${srcdir}/resolve-camoufox.mjs" << 'NODESCRIPT'
let data = '';
process.stdin.on('data', c => data += c);
process.stdin.on('end', () => {
  const releases = JSON.parse(data);
  for (const rel of releases) {
    if (rel.prerelease || rel.draft) continue;
    for (const asset of rel.assets) {
      if (asset.name.includes('lin') && asset.name.includes('x86_64')) {
        process.stdout.write(asset.name + '\n');
        process.stdout.write(asset.browser_download_url + '\n');
        process.stdout.write(String(asset.size) + '\n');
        process.exit(0);
      }
    }
  }
  process.exit(1);
});
NODESCRIPT

  CAMOUFOX_INFO=$(curl -sf "https://api.github.com/repos/daijro/camoufox/releases?per_page=5" | \
    node "${srcdir}/resolve-camoufox.mjs")
  CAMOUFOX_FILENAME=$(echo "$CAMOUFOX_INFO" | sed -n '1p')
  CAMOUFOX_URL=$(echo "$CAMOUFOX_INFO" | sed -n '2p')
  CAMOUFOX_SIZE=$(echo "$CAMOUFOX_INFO" | sed -n '3p')

  if [ -z "$CAMOUFOX_FILENAME" ]; then
    echo "Error: could not find a compatible Camoufox release!"
    exit 1
  fi

  echo ":: Found: $CAMOUFOX_FILENAME ($((CAMOUFOX_SIZE / 1024 / 1024))MB)"
  echo ":: URL: $CAMOUFOX_URL"

  # Download with retries and progress
  curl -L --retry 3 --retry-delay 5 \
    -o "${srcdir}/${CAMOUFOX_FILENAME}" \
    "$CAMOUFOX_URL"

  echo ":: Download complete."

  # Record sha256 for verification
  sha256sum "${srcdir}/${CAMOUFOX_FILENAME}" \
    > "${srcdir}/${CAMOUFOX_FILENAME}.sha256"
}

package() {
  cd "${srcdir}"

  # Install npm package from the repacked tarball (avoids registry lookup)
  npm install -g --prefix "${pkgdir}/usr" \
    "camofox-browser-${pkgver}-bundle.tgz" 2>&1

  # Clean npm artifacts
  find "${pkgdir}/usr" -name ".cache" -type d -exec rm -rf {} + 2>/dev/null || true
  rm -rf "${pkgdir}/usr/etc" 2>/dev/null || true

  # Fix scoped package name
  if [ -d "${pkgdir}/usr/lib/node_modules/@askjo" ]; then
    mkdir -p "${pkgdir}/usr/lib/node_modules"
    ln -sf "@askjo/camofox-browser" \
      "${pkgdir}/usr/lib/node_modules/camofox-browser" 2>/dev/null || true
  fi

  # Extract Camoufox browser binary to package share dir
  CAMOUFOX_ZIP=$(ls "${srcdir}"/camoufox-*-lin.x86_64.zip 2>/dev/null | head -1)
  if [ -n "$CAMOUFOX_ZIP" ]; then
    PKG_CACHE="${pkgdir}/usr/share/${pkgname}/camoufox"
    mkdir -p "$PKG_CACHE"
    unzip -qo "$CAMOUFOX_ZIP" -d "$PKG_CACHE"

    # Write version.json from zip filename
    # Filename: camoufox-<VERSION>-<RELEASE>-lin.x86_64.zip
    BASENAME=$(basename "$CAMOUFOX_ZIP" .zip)
    # Strip prefix 'camoufox-' and suffix '-lin.x86_64'
    VERREL="${BASENAME#camoufox-}"
    VERREL="${VERREL%-lin.x86_64}"
    RELEASE="${VERREL##*-}"
    VERSION="${VERREL%-*}"
    echo "{\"version\":\"$VERSION\",\"release\":\"$RELEASE\"}" \
      > "$PKG_CACHE/version.json"

    # Remove empty addon dirs (UBO download fails from addons.mozilla.org)
    find "$PKG_CACHE/addons" -type d -empty -delete 2>/dev/null || true

    echo ":: Camoufox binary extracted ($(du -sh "$PKG_CACHE" | cut -f1))"
  else
    echo "Warning: Camoufox zip not found! Binary not bundled."
  fi

  # Launcher wrapper — symlink packaged cache on first run
  rm -f "${pkgdir}/usr/bin/camofox-browser"
  cat > "${pkgdir}/usr/bin/camofox-browser" << 'WRAPPER'
#!/bin/bash
# Camofox Browser launcher
# First run symlinks the packaged Camoufox binary cache into ~/.cache/camoufox/
set -euo pipefail

PKG_CACHE="/usr/share/camofox-browser-bin/camoufox"
USER_CACHE="${XDG_CACHE_HOME:-$HOME/.cache}/camoufox"

if [ ! -f "$USER_CACHE/version.json" ] && [ -f "$PKG_CACHE/version.json" ]; then
    mkdir -p "$(dirname "$USER_CACHE")"
    if [ -e "$USER_CACHE" ]; then
        rm -rf "$USER_CACHE"
    fi
    ln -s "$PKG_CACHE" "$USER_CACHE"
fi

exec /usr/lib/node_modules/@askjo/camofox-browser/bin/camofox-browser.js "$@"
WRAPPER
  chmod 755 "${pkgdir}/usr/bin/camofox-browser"

  # License (before cleanup)
  install -Dm644 "camofox-browser-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true

  # Clean leftover from build
  rm -rf "${srcdir}/camofox-browser-${pkgver}"
}
