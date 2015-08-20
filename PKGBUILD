# Maintainer: Jens Staal <staal1978@gmail.com>
# Contributor: Alessio Sergi <asergi at archlinux dot us>

pkgname=netbsd-rump-git
pkgver=1294.ad55254
pkgrel=1
pkgdesc="The NetBSD Rump kernel"
arch=('i686' 'x86_64')
url="http://rumpkernel.org/"
license=('BSD')
depends=('glibc')
makedepends=('git')
provides=('netbsd-rump')
conflicts=('netbsd-rump')
options=('!emptydirs')
#adding the sources checkout here to avoid repeated downloads
source=('buildrump-scripts'::'git://github.com/rumpkernel/buildrump.sh'
        'rump-src'::'git://github.com/rumpkernel/src-netbsd#branch=buildrump-src')
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd buildrump-scripts
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd buildrump-scripts
  rm -f src
  ln -s "$srcdir"/rump-src src
}

build() {
  cd buildrump-scripts
  unset CFLAGS
  unset LDFLAGS
  unset AFLAGS
  unset ACLFLAGS
  unset ACFLAGS
  ./buildrump.sh -r fullbuild
}

package() {
  cd buildrump-scripts

  # no namespace conficts with systems packages, so install stuff at the standard locations
  unset CFLAGS
  unset LDFLAGS
  unset AFLAGS
  unset ACLFLAGS
  unset ACFLAGS
  ./buildrump.sh -r -d "$pkgdir"/usr install

  # install headers
  install -m 644 rump/include/rump/*.h "$pkgdir"/usr/include/rump/

  # fix conflicting headers installed
  rm -rf "$pkgdir"/usr/include/sys

  # install license
  install -d -m 755 "$pkgdir/usr/share/licenses/$pkgname"
  install -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
