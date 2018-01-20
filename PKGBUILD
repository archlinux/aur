# Maintainer: DetMittens
pkgname=libaom-git
_gitname=aom
pkgver=r23697.c1ba869b8
pkgrel=1
pkgdesc="Alliance for Open Media codec library with encoders and decoders for AV1"
arch=('x86_64')
url="http://aomedia.org"
license=('custom:BSD-2-Clause' 'custom:AOM-Patent-1.0')
makedepends=('yasm' 'git' 'cmake' 'doxygen' 'perl')
provides=('libaom.so')
source=('git+https://aomedia.googlesource.com/aom')
md5sums=(SKIP)

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p "${srcdir}"/"${_gitname}"-build
  cd "${srcdir}"/"${_gitname}"-build

  cmake -G "Unix Makefiles" "${srcdir}"/"${_gitname}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DARCH_X86_64=1 \
    -DBUILD_SHARED_LIBS=On \
    -DCONFIG_PIC=1 \
    -DCONIFG_SHARED=1 \
    -DCONFIG_RUNTIME_CPU_DETECT=1

  make
}

package() {
  cd "${srcdir}"/"${_gitname}"-build
  make DESTDIR="${pkgdir}/" install
  install -Dm 644 "${srcdir}"/"${_gitname}"/LICENSE -t "${pkgdir}"/usr/share/licenses/libaom-git/
  install -Dm 644 "${srcdir}"/"${_gitname}"/PATENTS -t "${pkgdir}"/usr/share/licenses/libaom-git/
}
