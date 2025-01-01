pkgname=creality-print
pkgver=5.1.7.10514
pkgrel=1
pkgdesc='3D slicer for Creality printers'
arch=('x86_64')
url='https://github.com/CrealityOfficial/CrealityPrint'
license=('unknown')
depends=('fuse2')
provides=('creality-print')
options=(!strip)

_ver=$(echo ${pkgver} | cut -d'.' -f 1,2,3)
_file="Creality-Print-v${pkgver}-${arch[0]}.AppImage"

sha512sums_x86_64=(
  '35e9bdaa2b39de036f73b0135e8286ae0eef8e6fc4b147a59449587959def27396eb00afa328d40c5578d9f658169067028a92c563e27d0d4991572091b71e0a'
)
source_x86_64=(
  "${_file}::https://github.com/CrealityOfficial/CrealityPrint/releases/download/v${_ver}/Creality_Print-v${pkgver}-${arch[0]}-Release.AppImage"
)

prepare() {
  cd ${srcdir}
  chmod +x ${_file}
  ./${_file} --appimage-extract >&/dev/null
  cd squashfs-root
  rm AppRun
  sed -i 's/Exec=AppRun %F/Exec=\/opt\/creality-print\/CrealityPrint %F/g' default.desktop
  sed -i 's/Icon=default/Icon=\/opt\/creality-print\/default.png/g' default.desktop
  echo 'Path=/opt/creality-print' >> default.desktop
  mv default.desktop creality-print.desktop
}

package() {
  install -dm755 ${pkgdir}/usr/share/applications
  install -dm755 ${pkgdir}/opt/creality-print
  cp -R ${srcdir}/squashfs-root/* ${pkgdir}/opt/creality-print
  mv ${pkgdir}/opt/creality-print/creality-print.desktop ${pkgdir}/usr/share/applications
}
