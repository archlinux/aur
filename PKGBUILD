# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="Premake"
_name="${_Name,,}"
pkgver=4.4beta5
pkgname="${_name}${pkgver%%.*}"
pkgrel=3
pkgdesc="A simple build configuration and project generation tool"
arch=('i686' 'x86_64')
url="https://premake.github.io"
license=('BSD-3-Clause')
depends=('glibc' 'lua51')
_pkgsrc="${_name}-${pkgver//beta/-beta}"
source=("${_pkgsrc}.zip::https://downloads.sourceforge.net/project/${_name}/${_Name}/${pkgver%%beta*}/${_pkgsrc}-src.zip"
        "${pkgname}_build_flags.patch"
        "${pkgname}_lua.patch"
        "${pkgname}_manpage.patch")
sha256sums=('0fa1ed02c5229d931e87995123cdb11d44fcc8bd99bba8e8bb1bbc0aaa798161'
            '62b44ad425c7af970214b21e54c78948c8042bf5b13edd899c5c7dd00835022a'
            'bd1dd0b292fe197f748acd2262f1137522af88659c734bc573107fee4883a929'
            'f3c8b20fa231a496f41781ad449f75ec36555d216166cd77c2b709acf62693f6')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgname}_build_flags.patch"
  patch -Np1 -i "${srcdir}/${pkgname}_lua.patch"
  patch -Np0 -i "${srcdir}/${pkgname}_manpage.patch"
}

build() {
  cd "${srcdir}/${_pkgsrc}/build/gmake.unix"
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "bin/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "CHANGES.txt"  "${pkgdir}/usr/share/doc/${pkgname}/CHANGES.txt"
  install -vDm644 "README.txt"   "${pkgdir}/usr/share/doc/${pkgname}/README.txt"
  install -vDm644 "LICENSE.txt"  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  install -vDm644 "${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}
