# Maintainer: Anton Kudelin <kudelin at protonmail dot com>
# Contributor: xiretza <xiretza+aur@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jesin <jesin00@gmail.com>
# Contributor: Gabriele Lanaro <gabriele.lanaro@gmail.com>

pkgname=f2c
pkgver=20200916
pkgrel=1
pkgdesc='Fortran to C code translator'
url='https://www.netlib.org/f2c'
license=('custom')
arch=('x86_64')
depends=('glibc')
makedepends=('unzip')
source=("$url/src.tgz"
        "$url/libf2c.zip")
noextract=("libf2c.zip")
sha256sums=('d4847456aa91c74e5e61e2097780ca6ac3b20869fae8864bfa8dcc66f6721d35'
            'ca404070e9ce0a9aaa6a71fc7d5489d014ade952c5d6de7efb88de8e24f2e8e0')

prepare() {
  cd "$srcdir"
  mv src f2c
  mkdir libf2c
  unzip -q libf2c.zip -d libf2c
  sed -i "s@-O@-O -ansi -fPIC@g" libf2c/makefile.u
  sed -i "/MAIN__/d" libf2c/main.c
}

build() {
  cd "$srcdir/libf2c"
  make hadd -f makefile.u
  make -f makefile.u
  make -f makefile.u libf2c.so
  
  cd "$srcdir/f2c"
  make -f makefile.u
}

package() {
  cd "$pkgdir"
  install -dm755 usr/{bin,include,lib,share/{licenses/$pkgname,man/man1}}
  install -m755 "$srcdir/f2c/f2c" usr/bin
  install -m755 "$srcdir/libf2c/libf2c.so" usr/lib
  install -m755 "$srcdir/libf2c/f2c.h" usr/include
  install -m755 "$srcdir/f2c/f2c.1t" usr/share/man/man1/f2c.1
  cat <<EOF > usr/share/licenses/$pkgname/LICENSE
Copyright 1990-1996, 2000-2001 by AT&T, Lucent Technologies and Bellcore.

Permission to use, copy, modify, and distribute this software
and its documentation for any purpose and without fee is hereby
granted, provided that the above copyright notice appear in all
copies and that both that the copyright notice and this
permission notice and warranty disclaimer appear in supporting
documentation, and that the names of AT&T, Bell Laboratories,
Lucent or Bellcore or any of their entities not be used in
advertising or publicity pertaining to distribution of the
software without specific, written prior permission.

AT&T, Lucent and Bellcore disclaim all warranties with regard to
this software, including all implied warranties of
merchantability and fitness.  In no event shall AT&T, Lucent or
Bellcore be liable for any special, indirect or consequential
damages or any damages whatsoever resulting from loss of use,
data or profits, whether in an action of contract, negligence or
other tortious action, arising out of or in connection with the
use or performance of this software.
EOF
}
