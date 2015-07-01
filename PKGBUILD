# Maintainer: Alain Kalker <a.c.kalker@gmail.com>
_pkgname=EiC
pkgname=eic
pkgver=4.4.3
pkgrel=2
pkgdesc="Extensible Interactive C, Improved"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/eic/"
license=('custom:Artistic')
[ $CARCH = "x86_64" ] && depends=('lib32-glibc')
options=(!makeflags staticlibs) # not parallel build safe
source=(http://downloads.sourceforge.net/$pkgname/EiCsrc-$pkgver.tar.gz
        $pkgname.profile)
md5sums=('bf7f3873a4bff32cbcd86c246c90e359'
         '8639c10091c3576e803e8789b25a4819')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"

  # install to a local directory until the build system gets fixed
  sed -i -e '/^ *INSTALL_DIR = /s|\$(HOME)/local/bin$|'"$srcdir/$_pkgname-$pkgver/bin|" project.params

  # build multilib on x86_64
  if [ $CARCH = "x86_64" ]; then
      echo "CC = gcc -m32" >> override.params
  fi

  # getline function conflicts with the one in stdio.h
  sed -i -e 's/getline/getsplicestripline/g' src/preproc.c
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  # temporary install directory needed by build
  mkdir bin

  # configure and build
  config/makeconfig
  make install
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  # binaries
  install -Dm755 bin/eic "$pkgdir"/usr/bin/eic
  install -Dm755 bin/eim "$pkgdir"/usr/bin/eim

  # custom versions of system include files
  install -dm755 "$pkgdir"/usr/lib/$pkgname/include
  cp -r include/* "$pkgdir"/usr/lib/$pkgname/include

  # static libraries for embedding (needs option 'staticlibs')
  install -Dm644 lib/libeic.a "$pkgdir"/usr/lib/libeic.a
  install -Dm644 lib/libstdClib.a "$pkgdir"/usr/lib/libstdClib.a

  # man pages
  install -Dm644 eic.man "$pkgdir"/usr/share/man/man1/eic.1
  install -Dm644 eim.man "$pkgdir"/usr/share/man/man1/eim.1

  # license
  install -Dm644 LICENCE "$pkgdir"/usr/share/licenses/$pkgname/LICENCE

  # profile
  install -Dm755 "$srcdir"/$pkgname.profile "$pkgdir"/etc/profile.d/$pkgname.sh
}
