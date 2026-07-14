# Maintainer: Jose Andres Auyon <auyon.joseandres@gmail.com>
pkgname=git-profile-switcher-bin
_appname=git-config-switcher
pkgver=1.0.0
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
provides=('git-profile-switcher')
conflicts=('git-profile-switcher' 'git-profile-switcher-git')
# !strip: binaries are prebuilt vendor blobs. !debug: no source to build a
# debug package from, so skip it (avoids an empty usr/src/debug dir).
options=('!strip' '!debug')
# electron-builder names the artifact from productName ("Git Config Switcher");
# GitHub replaces the spaces with dots when it stores the release asset.
_asset="Git.Config.Switcher-${pkgver}.AppImage"
source=("${pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_asset}"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/Kinau-Guatemala/git-profile-switcher/v${pkgver}/LICENSE")
# Checksums produced by `updpkgsums`; regenerate whenever pkgver changes.
sha256sums=('e7c5c39f3282bc3abb09f6494f6ba5d93b006c37a682d562b99a40c10ca70c5e'
            'a75d1cbb2e90e3438c93ec0977d445e2c7c9fb35b9ba858d1a5407d72e516b6c')

build() {
  cd "$srcdir"
  chmod +x "${pkgname}-${pkgver}.AppImage"
  # --appimage-extract works without FUSE, so fuse2 is not a dependency.
  "./${pkgname}-${pkgver}.AppImage" --appimage-extract >/dev/null
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

  # Desktop entry: reuse the shipped one but point Exec at the launcher.
  install -dm755 "$pkgdir/usr/share/applications"
  sed 's|^Exec=.*|Exec=git-profile-switcher %U|' \
    "${_appname}.desktop" > "$pkgdir/usr/share/applications/${_appname}.desktop"

  # Icons (full hicolor set ships inside the AppImage).
  cp -a --no-preserve=ownership usr/share/icons "$pkgdir/usr/share/"
  chmod -R u=rwX,go=rX "$pkgdir/usr/share/icons"

  # License (MIT is not a common license, so it must be installed).
  install -Dm644 "$srcdir/LICENSE-${pkgver}" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
