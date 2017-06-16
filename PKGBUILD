# Maintainer: DetMittens
pkgname=libaom-git
_gitname=aom
pkgver=r21126.1d1df182e
pkgrel=1
pkgdesc="Alliance for Open Media codec library with encoders and decoders for AV1"
arch=('i686' 'x86_64')
url="http://aomedia.org"
license=('custom:BSD-2-Clause' 'custom:AOM-Patent-1.0')
makedepends=( 'yasm' 'git')
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
  
  "${srcdir}"/"${_gitname}"/configure \
    --prefix=/usr \
    --target=generic-gnu \
    --as=yasm \
    --enable-av1 \
    --enable-shared \
    --disable-static \
    --enable-runtime-cpu-detect \
    --enable-webm-io \
    --enable-libyuv \
    --enable-postproc \
    --enable-highbitdepth \
    --enable-lowbitdepth \
    --enable-pic \
    --enable-examples

  cd "${srcdir}"/"${_gitname}"-build
  make
}

package() {
  cd "${srcdir}"/"${_gitname}"-build
  make DESTDIR="${pkgdir}/" install
  install -Dm 644 "${srcdir}"/"${_gitname}"/LICENSE -t "${pkgdir}"/usr/share/licenses/libaom-git/
  install -Dm 644 "${srcdir}"/"${_gitname}"/PATENTS -t "${pkgdir}"/usr/share/licenses/libaom-git/
}
