# Maintainer: coffee <coffee@coffeecat.top>
# Contributor: coffee

pkgname=camofox-browser-bin
pkgver=1.12.0
pkgrel=1
pkgdesc="Anti-detection browser server for AI agents — REST API wrapping Camoufox stealth browser engine (Firefox fork with C++-level fingerprint spoofing)"
arch=('x86_64' 'aarch64')
url="https://github.com/jo-inc/camofox-browser"
license=('MIT')
depends=('nodejs>=22')
optdepends=(
  'yt-dlp: YouTube transcript extraction plugin'
)
makedepends=('nodejs>=22')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/@askjo/camofox-browser/-/camofox-browser-${pkgver}.tgz")
sha256sums=('SKIP')
_options=('strip' '!emptydirs')

prepare() {
  cd "${srcdir}"
  tar xzf "${pkgname}-${pkgver}.tgz"
}

build() {
  cd "${srcdir}/package"
  # Install production deps (camoufox-js, express, etc.)
  npm install --production --no-audit --no-fund --ignore-scripts 2>&1

  # Download Camoufox browser binary (~730MB) to ~/.cache/camoufox/
  # NOTE: camoufox-js fetch ignores XDG_CACHE_HOME and always uses ~/.cache/camoufox/
  echo ":: Downloading Camoufox browser binary (~730MB) ..."
  npx camoufox-js fetch 2>&1 || echo "Warning: camoufox fetch had issues"

  # Copy from global cache to build tree for packaging
  mkdir -p "${srcdir}/cache/camoufox"
  if [ -d "${HOME}/.cache/camoufox" ]; then
    cp -a "${HOME}/.cache/camoufox/"* "${srcdir}/cache/camoufox/"
    echo ":: Camoufox binary copied from global cache"
    ls -la "${srcdir}/cache/camoufox/" | head -5
  else
    echo "Warning: global camoufox cache not found — binary not bundled"
  fi

  # Apply upstream bugfix: missing `await` on virtualDisplay.get()
  # (v1.11.2 server.js:950). Without it, Xvfb display number is a Promise
  # that serializes to `{}` and the browser gets `cannot open display: [object Promise]`
  sed -i 's/vdDisplay = localVirtualDisplay.get();/vdDisplay = await localVirtualDisplay.get();/' \
    "${srcdir}/package/server.js"

  # Repack with node_modules included, so npm install won't create symlinks.
  cd "${srcdir}"
  rm -rf "camofox-browser-${pkgver}"  # clean stale from failed builds
  mv package "camofox-browser-${pkgver}"
  tar czf "camofox-browser-${pkgver}-bundle.tgz" "camofox-browser-${pkgver}"
}

package() {
  cd "${srcdir}"

  # Install from the repacked tarball (no symlinks)
  npm install -g --prefix "${pkgdir}/usr" \
    "camofox-browser-${pkgver}-bundle.tgz" 2>&1

  # Remove npm cache artifacts
  find "${pkgdir}/usr" -name ".cache" -type d -exec rm -rf {} + 2>/dev/null || true
  rm -rf "${pkgdir}/usr/etc" 2>/dev/null || true
  # npm installs by package name, fix the directory name
  if [ -d "${pkgdir}/usr/lib/node_modules/camofox-browser" ]; then
    : OK
  elif [ -d "${pkgdir}/usr/lib/node_modules/@askjo" ]; then
    # Symlink cleaner name
    mkdir -p "${pkgdir}/usr/lib/node_modules"
    ln -sf "@askjo/camofox-browser" "${pkgdir}/usr/lib/node_modules/camofox-browser" 2>/dev/null || true
  fi

  # Bundle the pre-downloaded Camoufox browser binary (~730MB)
  # The cache lives at /usr/share/camofox-browser/cache/camoufox/
  local pkg_cache="${pkgdir}/usr/share/camofox-browser/cache/camoufox"
  mkdir -p "${pkg_cache}"
  if [ -d "${srcdir}/cache/camoufox" ]; then
    cp -a "${srcdir}/cache/camoufox/"* "${pkg_cache}/"
    echo ":: Camoufox binary bundled (${srcdir}/cache/camoufox/)"
    # Remove empty addon dirs (UBO download often fails from addons.mozilla.org)
    # An empty addon dir causes:
    #   "manifest.json is missing. Addon path must be a path to an extracted addon."
    find "${pkg_cache}/addons" -type d -empty -delete 2>/dev/null || true
  else
    echo "Warning: camoufox cache not found in build tree — binary not bundled"
  fi

  # Replace npm's symlinked bin with a wrapper that sets up the cache on first run
  rm -f "${pkgdir}/usr/bin/camofox-browser"
  cat > "${pkgdir}/usr/bin/camofox-browser" << 'WRAPPER'
#!/bin/bash
# Camofox Browser launcher — ensures Camoufox browser binary cache is set up
set -euo pipefail

PKG_CACHE="/usr/share/camofox-browser/cache/camoufox"
USER_CACHE="${XDG_CACHE_HOME:-$HOME/.cache}/camoufox"

# First launch: symlink the packaged cache into the user's cache directory
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

  # License
  install -Dm644 "camofox-browser-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}
