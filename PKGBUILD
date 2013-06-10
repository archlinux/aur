# Contributor: Johannes Dewender  arch at JonnyJD dot net
pkgname=python2-ethtool
_pkgname=python-ethtool
pkgver=0.7
pkgrel=3
pkgdesc="python bindings for the ethtool kernel interface"
arch=('i686' 'x86_64')
url="http://fedorapeople.org/gitweb?p=dsommers/public_git/python-ethtool.git;a=summary"
license=('GPL2')
groups=()
depends=('python2' 'libnl1')
makedepends=('asciidoc')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://dsommers.fedorapeople.org/$_pkgname/$_pkgname-$pkgver.tar.bz2)
md5sums=('2d13e2412948344b8375f5af4ced1c20')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py build

  a2x -d manpage -f manpage man/pethtool.8.asciidoc
  a2x -d manpage -f manpage man/pifconfig.8.asciidoc
  gzip --stdout man/pethtool.8 > "man/pethtool.8.gz"
  gzip --stdout man/pifconfig.8 > "man/pifconfig.8.gz"
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --skip-build --root="$pkgdir/" --optimize=1

  install -d "$pkgdir/usr/bin"
  install -m 0755 pethtool.py "$pkgdir/usr/bin/pethtool"
  sed -i '1s/python/python2/' "$pkgdir/usr/bin/pethtool"
  install -m 0755 pifconfig.py "$pkgdir/usr/bin/pifconfig"
  sed -i '1s/python/python2/' "$pkgdir/usr/bin/pifconfig"

  install -d "$pkgdir/usr/share/man/man8"
  install -m 644 man/pethtool.8.gz "$pkgdir/usr/share/man/man8/"
  install -m 644 man/pifconfig.8.gz "$pkgdir/usr/share/man/man8/"
}

# vim:set ts=2 sw=2 et:
