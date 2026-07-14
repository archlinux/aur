# Maintainer: Jose Andres Auyon <auyon.joseandres@gmail.com>
pkgname=git-profile-switcher-git
_appname=git-config-switcher
pkgver=1.0.0.r0.g44bfc24
pkgrel=1
pkgdesc="Cross-platform desktop tray app for managing multiple Git identities"
arch=('x86_64')
url="https://github.com/Kinau-Guatemala/git-profile-switcher"
license=('MIT')
depends=('gtk3' 'nss' 'alsa-lib' 'libcups' 'libdrm' 'libxcomposite'
         'libxdamage' 'libxrandr' 'libxfixes' 'libxkbcommon' 'at-spi2-core'
         'mesa' 'hicolor-icon-theme'
         # Directly linked by the bundled Electron binary (namcap-detected).
         # Listed explicitly so we don't rely on transitive pulls from the
         # runtime deps above. glibc/gcc-libs/bash are omitted as base members.
         'dbus' 'glib2' 'pango' 'cairo' 'expat' 'nspr'
         'libx11' 'libxext' 'libxcb')
makedepends=('git' 'nodejs' 'npm')
provides=('git-profile-switcher')
conflicts=('git-profile-switcher' 'git-profile-switcher-bin')
# !strip: binaries are prebuilt vendor blobs. !debug: no source to build a
# debug package from, so skip it (avoids an empty usr/src/debug dir).
options=('!strip' '!debug')
source=("git+https://github.com/Kinau-Guatemala/git-profile-switcher.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/git-profile-switcher"
  # Use the latest tag (e.g. v1.0.0) as the base when one exists, otherwise
  # fall back to a tagless revision count so the version is never garbage and
  # always increases monotonically.
  ( set -o pipefail
    git describe --long --tags 2>/dev/null \
      | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
      || printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/git-profile-switcher"
  # npm ci installs exactly what package-lock.json pins (reproducible build).
  npm ci
  npm run build:appimage

  # Extract the AppImage so we ship its contents (not an opaque blob). This
  # also means FUSE is not needed at install or run time.
  cd "$srcdir"
  local appimage=("$srcdir/git-profile-switcher/dist/"*.AppImage)
  chmod +x "${appimage[0]}"
  "${appimage[0]}" --appimage-extract >/dev/null
}

package() {
  cd "$srcdir/squashfs-root"

  # App payload (bundled Electron runtime + resources).
  install -dm755 "$pkgdir/opt/git-profile-switcher"
  cp -a --no-preserve=ownership \
    "$_appname" *.pak *.bin *.dat *.so *.so.* *.json locales resources \
    chrome_crashpad_handler chrome-sandbox \
    "$pkgdir/opt/git-profile-switcher/"

  # `cp -a` preserves the squashfs perms, which lack world read/exec on some
  # files (locales, resources) — normalize so non-root users can read them.
  chmod -R u=rwX,go=rX "$pkgdir/opt/git-profile-switcher"

  # chrome-sandbox must be setuid root for Electron's sandbox to work.
  chmod 4755 "$pkgdir/opt/git-profile-switcher/chrome-sandbox"

  # Launcher on PATH.
  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/git-profile-switcher" <<'EOF'
#!/usr/bin/env bash
exec /opt/git-profile-switcher/git-config-switcher "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/git-profile-switcher"

  # Desktop entry: reuse the one electron-builder generated (correct Name and
  # Icon) and only repoint Exec at our launcher.
  install -dm755 "$pkgdir/usr/share/applications"
  sed 's|^Exec=.*|Exec=git-profile-switcher %U|' \
    "${_appname}.desktop" > "$pkgdir/usr/share/applications/${_appname}.desktop"

  # Icons (full hicolor set ships inside the AppImage).
  cp -a --no-preserve=ownership usr/share/icons "$pkgdir/usr/share/"
  chmod -R u=rwX,go=rX "$pkgdir/usr/share/icons"

  # License (MIT is not a common license, so it must be installed).
  install -Dm644 "$srcdir/git-profile-switcher/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
