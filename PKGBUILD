# Maintainer: Darren Ng  <$(base64 --decode <<<VW4xR2ZuQGdtYWlsLmNvbQo=)>
# Maintainer: Dan Bryant <$(base64 --decode <<<VanVzdGRhbjk2QGdtYWlsLmNvbQo=)>

# https://github.com/Terraspace/UASM
pkgname=uasm
url=http://www.terraspace.co.uk/uasm.html
# http://www.terraspace.co.uk/uasm.html#p1
pkgdesc="Continued evolution of JWasm"

pkgver=2.52
pkgrel=1

arch=($CARCH)
license=(
  'custom:JWasm License'
  'custom:Sybase Open Watcom Public License'
)

depends=('sh')
makedepends=('git')
# checkdepends=()
# optdepends=()
# provides=()
# conflicts=()
# replaces=()
# backup=()
# options=(!strip debug)

source=(
  # https://man.archlinux.org/man/PKGBUILD.5#USING_VCS_SOURCES
  $pkgname.git::git+https://github.com/Terraspace/UASM.git#branch=v$pkgver
  uasm-nocolor
  dbgcv.patch
)

sha1sums=('SKIP'
          '49f6a6ca16eba01fafce563e0f14cd145b512ff6'
          'f41bb76a34bde4a30ec8f17eda857e6d0951d070')

prepare() {

  cd "$srcdir/$pkgname.git"

  local HEAD_SHA1
  case "$pkgver" in
  2.50) HEAD_SHA1=16a853bd6de807fe2c42569f8375a029684c0f22;;
  2.51) HEAD_SHA1=c853dbdbd1d1a7a8f23eafec658e7e70f8e7a3c4;;
  2.52) HEAD_SHA1=c612f83d97a0cb192dfd983676743dabf662ed51;;
  2.53) HEAD_SHA1=8f8feb76a3fec91c5038bb09dfc304df804f5e16;;
      *) return 1;;
  esac
  [ "$(git rev-parse HEAD)" = "$HEAD_SHA1" ]
  
  # Since v2.51
  # dbgcv.c:*:*: fatal error: direct.h: No such file or directory
  #    * | #include <direct.h>  
  patch --input="${srcdir}/dbgcv.patch"
  
  # To fix #151
  sed -i 's!#ifndef _TYPES_H_INCLUDED!#ifndef _TYPES_H_INCLUDED_!g' ./H/types.h
  
  # Enforce full RELRO
  sed -i 's!-Wl,-Map,$(OUTD)/$(TARGET1).map$!-Wl,-Map,$(OUTD)/$(TARGET1).map -Wl,-z,now!g' gccLinux64.mak
  
  # https://gcc.gnu.org/gcc-10/porting_to.html#common
  sed -i "s!CC = gcc!CC = gcc -fcommon!g" gccLinux64.mak
}

build() {
  cd "$srcdir/$pkgname.git"
  make -f gccLinux64.mak -j$(nproc)
}

# make: *** No rule to make target 'check'.
# check() {
#   make -k check
# }

package() {

  cd "$srcdir/$pkgname.git"

  install -v -Dm755 {GccUnixR,"$pkgdir/usr/bin"}/uasm
  # install -v -Dm755 GccUnixR/uasm "$pkgdir/usr/bin/uasm-color"
  # cp -L "$srcdir/${source[1]}" "$pkgdir/usr/bin/uasm"
  # chmod -v +x "$_"

  install -v -Dm755 {"$srcdir","$pkgdir/usr/bin/"}/uasm-nocolor

  install -v -dDm755 "$pkgdir/usr/share/doc/uasm"
  install -v -m644 Readme.txt History.txt Doc/* "$_/"

  install -v -Dm644 {,"$pkgdir/usr/share/licenses/$pkgname/"}License.txt

}
