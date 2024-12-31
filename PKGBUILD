# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="ogw"
_commit="ebb12498e9e5a3f1e53dc93ded233afd683b07b4" # r34
pkgver="r34+g${_commit::7}"
pkgrel=1
pkgdesc="Compiler for CNoEvil, a C superset using macros to simulate higher-level features"
arch=('x86_64')
url="https://git.sr.ht/~shakna/${pkgname}"
license=('custom:BSD-3-Clause-like')
depends=('glibc' 'tcc')
makedepends=('klib' 'xxd')
_pkgsrc="${pkgname}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz")
b2sums=('739ed75aff25e311ba8cd9ff0860ed0b6d1c1b14d94ae4e73613dc1942991cd5110d631e14e534dd0a53433e82109c95a18e658f61ea72eb765c8abcf339013a')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  rm -rf "klib"
  ln -sf "/usr/include/klib" "klib"

  sed -i 's/tcc_relocate(s, TCC_RELOCATE_AUTO)/tcc_relocate(s)/g' ogw.c
  sed -e 's/$(CFLAGS)/'"${CFLAGS} ${LDFLAGS}/g" \
      -e 's/$(COPTIM) //g' \
      -i Makefile
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.md"  "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

# vim:set ts=2 sw=2 et:
