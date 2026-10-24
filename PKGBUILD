# Maintainer: Oskar Gerlicz-Kowalczuk <oskar@gerlicz.space>
# Contributor: HyperPuppy

pkgname=octr-nitrofueled-pc-bin
_pkgname=OCTR-NitroFueled-PC
pkgver=0.6.4
pkgrel=1
pkgdesc="Crash Team Racing: Nitro-Fueled (PS4) running natively on PC (SacredFire fork)"
arch=('x86_64')
url="https://github.com/Ryu7w7/OCTR-NitroFueled-PC"
license=('GPL-2.0-only')
depends=('fuse2' 'zlib' 'hicolor-icon-theme')
provides=('octr-nitrofueled-pc')
conflicts=('octr-nitrofueled-pc')
options=('!strip')

source=("${pkgname}-${pkgver}.AppImage::https://github.com/Ryu7w7/${_pkgname}/releases/download/v${pkgver}/SacredFire-v${pkgver}-x86_64.AppImage")
sha256sums=('9af6d88b52735367029910472571b300561cd7e1617da1d3674249536f158f2e')

prepare() {
  chmod +x "${pkgname}-${pkgver}.AppImage"
  ./"${pkgname}-${pkgver}.AppImage" --appimage-extract
}

package() {
  install -d "${pkgdir}/opt/${pkgname}"
  cp -a squashfs-root/* "${pkgdir}/opt/${pkgname}/"

  install -d "${pkgdir}/usr/bin"
  cat << 'EOFWRAP' > "${pkgdir}/usr/bin/sacredfire"
#!/bin/sh
exec /opt/octr-nitrofueled-pc-bin/AppRun "$@"
EOFWRAP
  chmod 755 "${pkgdir}/usr/bin/sacredfire"
  ln -s sacredfire "${pkgdir}/usr/bin/octr-nitrofueled-pc"

  install -d "${pkgdir}/usr/share/applications"
  install -Dm644 squashfs-root/io.github.sacredfire.Launcher.desktop \
    "${pkgdir}/usr/share/applications/io.github.sacredfire.Launcher.desktop"
  sed -i 's|^Exec=.*|Exec=/usr/bin/sacredfire|' \
    "${pkgdir}/usr/share/applications/io.github.sacredfire.Launcher.desktop"

  if [ -f squashfs-root/io.github.sacredfire.Launcher.png ]; then
    install -Dm644 squashfs-root/io.github.sacredfire.Launcher.png \
      "${pkgdir}/usr/share/icons/hicolor/256x256/apps/io.github.sacredfire.Launcher.png"
  fi
}
