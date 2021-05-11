# Maintainer: redtide <redtid3 at gmail dot com>
# Maintainer: Antonio O. <antonio.mx.9605 at gmail dot com>

# TODO: replace git checkout with a tarball when available, see
# https://github.com/wxFormBuilder/wxFormBuilder/issues/676

_gitname=wxFormBuilder
pkgname=wxformbuilder
pkgver=3.9.0
pkgrel=2
pkgdesc="RAD tool for wxWidgets GUI design"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/wxFormBuilder/wxFormBuilder"
license=('GPL2')
provides=('wxformbuilder')
conflicts=('wxformbuilder' 'wxformbuilder-svn' 'wxformbuilder-git')
depends=('wxgtk3')
makedepends=('git' 'ninja' 'meson')
source=(
  "git://github.com/wxFormBuilder/wxFormBuilder.git#tag=v3.9.0"
  "nativefile.ini"
)
sha512sums=(
  "SKIP"
  "c44a263897bc22e46bbe8d106cb0e4ee4c331fec0d271b4140055c59a891360c251fa7f33ce7b83fa8a3515c954c6cbf9b06eddaff2e3b671709d652fd603836"
)
prepare() {
  cd "${srcdir}/${_gitname}"
  git submodule update --init
}
build() {
  cd "${srcdir}/${_gitname}"
  meson _build --native-file "${srcdir}/nativefile.ini" --prefix /usr
  ninja -C _build
}
package() {
  cd "${srcdir}/${_gitname}"
  DESTDIR="${pkgdir}" ninja -C _build install
  mkdir -p "${pkgdir}/usr/share/mime/packages/"
  cp -r "install/linux/data/gnome/usr/share" "${pkgdir}/usr"
  install -m644 "install/linux/debian/wxformbuilder.sharedmimeinfo" "${pkgdir}/usr/share/mime/packages/wxformbuilder.xml"
}
