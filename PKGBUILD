#Maintainer: archdevlab <https://github.com/archdevlab>

pkgname=vkd3d-proton-bin-git
pkgdesc='Direct3D 12 to Vulkan translation library (Windows DLL binary files) (git version)'
pkgver=2.11.1.r95.g85a0367
pkgrel=1
url='https://github.com/HansKristian-Work/vkd3d-proton'
license=(LGPL)
arch=(x86_64)
depends=(vulkan-icd-loader)
makedepends=(git meson glslang wine xcb-util-keysyms xorgproto mingw-w64-gcc)
provides=(vkd3d-proton-bin vkd3d-proton-bin-git)
source=(git+https://github.com/HansKristian-Work/vkd3d-proton)
install=${pkgname}.install
options=(!buildflags)

pkgver(){
  cd "${srcdir}"/vkd3d-proton
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  cd "${srcdir}"/vkd3d-proton
  git submodule update --init --recursive
}

build(){
  rm -rf "${srcdir}"/build

  pushd "${srcdir}"/vkd3d-proton
  ./package-release.sh master "${srcdir}"/build --no-package
  popd
}

package(){
  install -D "${srcdir}"/build/vkd3d-proton-master/x86/* -t "$pkgdir/usr/share/vkd3d-proton/x86"
  install -D "${srcdir}"/build/vkd3d-proton-master/x64/* -t "$pkgdir/usr/share/vkd3d-proton/x64"
  install "${srcdir}"/build/vkd3d-proton-master/setup_vkd3d_proton.sh -t "$pkgdir/usr/share/vkd3d-proton/"

  # install license
  install -dm755 "${pkgdir}"/usr/share/licenses/"${pkgname}"
  install -m644 "${srcdir}"/vkd3d-proton/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/
  install -m644 "${srcdir}"/vkd3d-proton/COPYING "${pkgdir}"/usr/share/licenses/"${pkgname}"/
  install -m644 "${srcdir}"/vkd3d-proton/AUTHORS "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}

sha256sums=('SKIP')

# vim:set ts=8 sts=2 sw=2 et:
