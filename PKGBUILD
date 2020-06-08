# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contriubtor: David Arroyo <droyo@aqwari.us>

pkgname=s6-linux-utils-musl
pkgver=2.5.1.2
pkgrel=1
pkgdesc="s6-linux-utils is a set of minimalistic Linux-specific system utilities."
arch=('i686' 'x86_64')
url="https://www.skarnet.org/software/s6-linux-utils"
license=('custom:ISC')
makedepends=('skalibs' 'libnl' 'musl')
provides=('s6-linux-utils')
conflicts=('s6-linux-utils')
source=(${url}/s6-linux-utils-$pkgver.tar.gz)
sha256sums=('06f97b84e78abcc952d108c0bab28831676062fe6f34cf7eeab32c8f93ae9270')

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
