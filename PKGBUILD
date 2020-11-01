# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=todesk-bin
_pkgname=${pkgname%-bin}
pkgver=1.0.0
_pkgver_ext=20201010f
_pkg_file_name=${_pkgname}${_pkgver_ext}.deb
pkgrel=3
pkgdesc="Remote control and team work"
arch=('x86_64')
url="https://www.todesk.cn/"
license=('custom')
makedepends=('xdg-user-dirs')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("local://${_pkg_file_name}")
sha256sums=('367b9ea53fd79283612e95a899b2f18488aa14e14b0beee4c26132475df75ee3')

_DOWNLOADS_DIR=`xdg-user-dir DOWNLOAD`
if [ ! -f ${PWD}/${_pkg_file_name} ]; then
	if [ -f $_DOWNLOADS_DIR/${_pkg_file_name} ]; then
		ln -sfn $_DOWNLOADS_DIR/${_pkg_file_name} ${PWD}
	else
		echo ""
		echo "The package can be downloaded here: "
		echo "Please remember to put a downloaded package ${_pkg_file_name} into the build directory ${PWD} or $_DOWNLOADS_DIR"
		echo ""
	fi
fi

package() {
  install -dm 755 ${srcdir}/${_pkgname}
  tar --owner=root --group=root -xf ${srcdir}/data.tar.xz -C ${srcdir}/${_pkgname} 

  cd ${srcdir}/${_pkgname}/

  install -Dm 755 usr/local/bin/${_pkgname} -t ${pkgdir}/usr/bin/

  # dir and lib
  find opt/ -type d -exec install -dm 755 ${pkgdir}/{} \;
  find opt/ -type f -exec install -Dm 755 {} ${pkgdir}/{} \;

  # desktop entry 
  install -Dm 644 usr/share/applications/${_pkgname}.desktop -t ${pkgdir}/usr/share/applications
  sed -i "s|Emulator;||g" ${pkgdir}/usr/share/applications/${_pkgname}.desktop

  # icon
  install -Dm 644 usr/share/pixmaps/${_pkgname}.png -t ${pkgdir}/usr/share/pixmaps
}
# vim: set sw=2 ts=2 et:
