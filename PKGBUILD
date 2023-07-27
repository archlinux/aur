# Maintainer: Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Fabien Dubosson <fabien.dubosson@gmail.com>
# Contributor: Konstantin Gizdov <arch@kge.com>

pkgname=mingw-w64-xxhash
pkgver=0.8.2
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
_tag=bbb27a5efb85b92a0486cf361a8635715a53f6ba
source=(git+https://github.com/Cyan4973/xxHash.git#tag=${_tag}
        mingw-Makefile.patch)
b2sums=('SKIP'
        '4021554a1261cb517a249173a5552a96a73f9261ecf5d7f59e1e449cff7e7ced81d6791d501bbb2d86f2406a993275500890ee00a6cf02e0e95f13b5fb283287')
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
    ${_arch}-make PREFIX=/usr/${_arch} DISPATCH=1
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/build-${_arch}
    ${_arch}-make PREFIX=/usr/${_arch} DISPATCH=1 DESTDIR="${pkgdir}" install
    install -Dm 644 LICENSE -t "${pkgdir}"/usr/${_arch}/share/licenses/xxhash
  done
}

# vim: ts=2 sw=2 et:
