# Maintainer: Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Fabien Dubosson <fabien.dubosson@gmail.com>
# Contributor: Konstantin Gizdov <arch@kge.com>

pkgname=mingw-w64-xxhash
pkgver=0.8.4
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
b2sums=('cd0decd603803637cb4c1f0edaff8ad7ac22c1a08cba38d0139cf6ba36209881d2043c40b7fcad8f93a17daef13a82219f793d30ba63f4f573ee9b56ae06f70d'
        'd10bc77574fac4bee5494eabaea0525280322e6d4ccdc93132129fb84a6c56f18509b358ea757fae346a24feeeb349a95f4effdd7928bf29d4aa1751f5e8bf9f')
_architectures="${MINGW_W64_ARCHS:-x86_64-w64-mingw32}"

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
