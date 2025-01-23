# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
#
# Taken from the AUR package: f2c https://aur.archlinux.org/packages/f2c
# See above for proper credits
_pkgname=f2c
pkgname=lib32-f2c
pkgver=20240504
pkgrel=1
pkgdesc="Fortran to C code translator"
pkgdesc+=" (32-bit)"
url="https://www.netlib.org/${_pkgname}"
license=(LicenseRef-custom)
arch=(x86_64 aarch64)
depends=(
  lib32-glibc
  $_pkgname
)
makedepends=(unzip)
source=(${url}/lib${_pkgname}.zip)
noextract=("lib${_pkgname}.zip")
b2sums=('3e8b989064e677d9725a703870b14531ea045b8ef167b11218687def75068c2b59997726acf4c3e5c0b20e024754f9207ffc9354b6feeb46414b59d99e7ec896')

_srcdir="${pkgname}-${pkgver}"
prepare() {
  unzip -q "lib${_pkgname}" -d "${_srcdir}"

  cd "${_srcdir}"
  # Add CFLAGS (-ansi -fPIC -m32)
  sed -i 's@CFLAGS = .*@CFLAGS = -O -ansi -fPIC -m32@g' makefile.u
  # Append elf_i386
  sed -i 's@ld -r -x -o@ld -r -x -m elf_i386 -o@g' makefile.u
  # Cleanup main
  sed -i '/MAIN__/d' main.c
}

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS=+" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  export LIBDIR="/usr/lib32"

  cd "${_srcdir}"  
  make hadd -f makefile.u
  make -f makefile.u
  make -f makefile.u libf2c.so
}

package() {
  cd "${_srcdir}"

  install -m755 -Dt "${pkgdir}/usr/lib32/" libf2c.so
  install -DTm544 Notice "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
