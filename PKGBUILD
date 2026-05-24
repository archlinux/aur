# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="premake"
pkgver=4.4beta5
_pkgver="${pkgver//beta/-beta}"
pkgname="${_basename}${pkgver%%.*}"
pkgrel=3
pkgdesc="A simple build configuration and project generation tool"
arch=(
  'i686'
  'x86_64'
)
url="https://premake.github.io"
license=(
  'BSD-3-Clause'
)
depends=(
  'glibc'
  'lua51'
)
_pkgsrc="${_basename}-${_pkgver}"
source=(
  "https://downloads.sourceforge.net/project/${_basename}/Premake/${_pkgver%%-*}/${_pkgsrc}-src.zip"
  "${pkgname}_build_flags.patch"
  "${pkgname}_lua.patch"
  "${pkgname}_manpage.patch"
)
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
  install -vDm644 "CHANGES.txt" "README.txt" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm644 "LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm644 "${pkgname}.1" -t "${pkgdir}/usr/share/man/man1"

  cd "bin/release"
  install -vDm755 "${pkgname}" -t "${pkgdir}/usr/bin"
}
