# Maintainer: David Arroyo <droyo@aqwari.us>
pkgname=s6-portable-utils-musl
pkgver=1.0.0
pkgrel=1
pkgdesc="Tiny portable generic utilities"
arch=('i686' 'x86_64')
url="http://www.skarnet.org/software/s6-portable-utils"
license=('custom:ISC')
changelog=CHANGELOG
makedepends=(skalibs musl)
provides=(s6-portable-utils)
source=(${url}/s6-portable-utils-$pkgver.tar.gz)
md5sums=('64601d936aee7c88ed0e5a8f54e45fd6')

build() {
  cd "$srcdir/admin/s6-portable-utils-$pkgver"
  echo musl-gcc                 > conf-compile/conf-cc
  echo musl-gcc -static         > conf-compile/conf-ld
  echo musl-gcc                 > conf-compile/conf-dynld
  echo /usr/bin                 > conf-compile/conf-install-command
  echo /usr/lib/skalibs/sysdeps > conf-compile/import
  echo /usr/include/skalibs     > conf-compile/path-include
  echo /usr/include/execline    >>conf-compile/path-include
  echo /usr/musl/include        >>conf-compile/path-include
  echo /usr/lib/skalibs         > conf-compile/path-library
  echo /usr/lib/execline        >>conf-compile/path-library
  echo /usr/musl/lib            >>conf-compile/path-library
  rm -f conf-compile/flag-slashpackage
  package/compile
}

package() {
  cd "$srcdir/admin/s6-portable-utils-$pkgver"
  for i in package/*.exported 
  do 
    case `basename $i` in
    command.exported)    d=/usr/bin                ;;
    esac
    f=`basename $i|sed 's/.exported//'`
    mkdir -p "$pkgdir/$d"
    install -D `sed s,^,$f/, $i` "$pkgdir/$d"
  done
  install -D -m644 package/COPYING "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
