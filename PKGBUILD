# Maintainer: Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Fabien Dubosson <fabien.dubosson@gmail.com>
# Contributor: Konstantin Gizdov <arch@kge.com>

pkgname=mingw-w64-xxhash
pkgver=0.8.1
pkgrel=1
pkgdesc='Extremely fast non-cryptographic hash algorithm (mingw-w64)'
arch=('any')
url=https://cyan4973.github.io/xxHash/
license=(
  GPL2
  BSD
)
depends=('mingw-w64-crt')
options=(!strip !buildflags staticlibs)
makedepends=('mingw-w64-gcc' 'mingw-w64-make' 'git')
_tag=35b0373c697b5f160d3db26b1cbb45a0d5ba788c
source=(git+https://github.com/Cyan4973/xxHash.git#tag=${_tag}
        mingw-Makefile.patch)
b2sums=('SKIP'
        'dae60c9356e0f27575ef29da73c3c000ce48baeb4ec3dfab57264fe39559374128316729b4db933a97c0fe35da8024c5879c70ba6ecab0a36114d1c80552c98d')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd xxHash

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd ${srcdir}/xxHash
  patch -Np1 -i ${srcdir}/mingw-Makefile.patch
}

build() {
  for _arch in ${_architectures}; do
    cp -r "${srcdir}"/xxHash "${srcdir}"/build-${_arch} && cd "${srcdir}"/build-${_arch}
    ${_arch}-make PREFIX=/usr/${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/build-${_arch}
    ${_arch}-make PREFIX=/usr/${_arch} DESTDIR="${pkgdir}" install
    mv "${pkgdir}"/usr/${_arch}/bin/libxxhash.dll.a "${pkgdir}"/usr/${_arch}/lib/libxxhash.dll.a
    install -Dm 644 LICENSE -t "${pkgdir}"/usr/${_arch}/share/licenses/xxhash
  done
}

# vim: ts=2 sw=2 et:
