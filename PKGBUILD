# Maintainer: David Arroyo <droyo@aqwari.us>
pkgname=s6-linux-utils-musl
pkgver=1.0.0
pkgrel=1
pkgdesc="Tiny Linux-specific utilities"
arch=('i686' 'x86_64')
url="http://www.skarnet.org/software/s6-linux-utils"
license=('custom:ISC')
changelog=CHANGELOG
makedepends=(skalibs libnl musl)
provides=(s6-linux-utils)
source=(${url}/s6-linux-utils-$pkgver.tar.gz)
md5sums=('89efa44c5582a7d18d12baf0c3d26074')

# Usually we can use musl-gcc here. However, s6-devd
# builds against libs and header files in /usr/{lib,include}.
# Adding these to the search path of musl-gcc overrides
# the default paths of /usr/musl/* for standard libraries.
build() {
  cd "$srcdir/admin/s6-linux-utils-$pkgver"
  echo gcc                      > conf-compile/conf-cc
  echo gcc -static              > conf-compile/conf-ld
  echo gcc                      > conf-compile/conf-dynld
  echo /usr/bin                 > conf-compile/conf-install-command
  echo /usr/lib/skalibs/sysdeps > conf-compile/import
  echo /usr/include/skalibs     > conf-compile/path-include
  echo /usr/musl/include        >>conf-compile/path-include
  echo /usr/lib/skalibs         > conf-compile/path-library
  echo /usr/musl/lib            >>conf-compile/path-library
  rm -f conf-compile/flag-slashpackage
  package/compile
}

package() {
  cd "$srcdir/admin/s6-linux-utils-$pkgver"
  for i in package/*.exported 
  do 
    case `basename $i` in
    command.exported)    d=/usr/bin                ;;
    esac
    f=`basename $i|sed 's/.exported//'`
    mkdir -p "$pkgdir/$d"
    install -D `sed s,^,$f/, $i` "$pkgdir/$d"
  done
  install -D -m755 command/s6-devd "$pkgdir/usr/bin/s6-devd"
  install -D -m644 package/COPYING "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
