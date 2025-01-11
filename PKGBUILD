# Maintainer: Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Fabien Dubosson <fabien.dubosson@gmail.com>
# Contributor: Konstantin Gizdov <arch@kge.com>

pkgname=mingw-w64-xxhash
pkgver=0.8.3
pkgrel=1
pkgdesc='Extremely fast non-cryptographic hash algorithm (mingw-w64)'
arch=('any')
url=https://cyan4973.github.io/xxHash/
license=(
  GPL2
  BSD
)
depends=('mingw-w64-crt')
options=(!strip !buildflags staticlibs !debug)
makedepends=('mingw-w64-gcc' 'mingw-w64-make' 'git')
_tag=bbb27a5efb85b92a0486cf361a8635715a53f6ba
source=(git+https://github.com/Cyan4973/xxHash.git#tag=v${pkgver}
        mingw-Makefile.patch)
b2sums=('e8c03ae30da955a0399bbbdee866dcc3f999bd1f780373d28119972a89a6ef3b266097024379c779d4c02ae3ca218728d4843c6085487ec76c5e7e1b393e1ea2'
        'fb52e7ddc217386fb27f5a95812ec1ace559721ac0e293ec3db2c4fb23434a193ee44ed695cff6ed94686d30e3d10e9fee5dcc2bb773bb828b46b435850af4ae')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

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
    rm -rf "${pkgdir}/usr/${_arch}/share/"
  done

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 "${srcdir}/xxHash/LICENSE"
}

# vim: ts=2 sw=2 et:
