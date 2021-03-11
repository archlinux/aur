# Maintainer: Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Fabien Dubosson <fabien.dubosson@gmail.com>
# Contributor: Konstantin Gizdov <arch@kge.com>

pkgname=mingw-w64-xxhash
pkgver=0.8.0
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
makedepends=('mingw-w64-gcc' 'git')
_tag=94e5f23e736f2bb67ebdf90727353e65344f9fc0
source=(git+https://github.com/Cyan4973/xxHash.git#tag=${_tag}
        mingw-Makefile.patch)
sha256sums=('SKIP'
            'c40bd594773be56a44f709405d3623d8f0c0d15d3bb78e891577d33ca3d82c56')
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
    install -Dm 644 LICENSE -t "${pkgdir}"/usr/${_arch}/share/licenses/xxhash
  done
}

# vim: ts=2 sw=2 et:
