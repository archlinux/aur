# Contributor: Johannes Dewender  arch at JonnyJD dot net
pkgname=python2-ethtool
_pkgname=python-ethtool
pkgver=0.8
pkgrel=1
pkgdesc="python bindings for the ethtool kernel interface"
arch=('i686' 'x86_64')
url="https://git.fedorahosted.org/cgit/python-ethtool.git/"
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
source=(https://git.fedorahosted.org/cgit/python-ethtool.git/snapshot/$_pkgname-$pkgver.tar.bz2)
sha256sums=('903e0896270cefa866fc3e177c14121476b70ba5aebcc3eb0280cc47d9df538f')

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
