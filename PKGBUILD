# Contributor: Johannes Dewender  arch at JonnyJD dot net
pkgname=('python2-ethtool' 'python-ethtool')
_pkgname=python-ethtool
pkgver=0.12
pkgrel=1
pkgdesc="python bindings for the ethtool kernel interface"
arch=('i686' 'x86_64')
url="https://fedorahosted.org/python-ethtool/"
license=('GPL2')
groups=()
depends=('python2' 'libnl>=3.2.26')
makedepends=('asciidoc')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(https://fedorahosted.org/releases/p/y/$_pkgname/$_pkgname-$pkgver.tar.bz2 libnl3.2.26_net_if.patch)
sha256sums=('18ce7a7740a5c8341a7c836972ffc7b84dde84dd246d15be1ea2c5ef937a6998'
            '15a748723cd361112de59d843ee0b4e4230e495ba89dcafcfdb578d039083001')
prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  patch -p1 < ../libnl3.2.26_net_if.patch
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py build

  a2x -d manpage -f manpage man/pethtool.8.asciidoc
  a2x -d manpage -f manpage man/pifconfig.8.asciidoc
  gzip --stdout man/pethtool.8 > "man/pethtool.8.gz"
  gzip --stdout man/pifconfig.8 > "man/pifconfig.8.gz"
}

package_python-ethtool() {
  depends+=('python')
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --skip-build --root="$pkgdir/" --optimize=1

  install -d "$pkgdir/usr/bin"
  install -m 0755 pethtool.py "$pkgdir/usr/bin/pethtool"
  sed -i '1s/python/python2/' "$pkgdir/usr/bin/pethtool"
  install -m 0755 pifconfig.py "$pkgdir/usr/bin/pifconfig"
  sed -i '1s/python/python2/' "$pkgdir/usr/bin/pifconfig"

  install -d "$pkgdir/usr/share/man/man8"
  install -m 644 man/pethtool.8.gz "$pkgdir/usr/share/man/man8/"
  install -m 644 man/pifconfig.8.gz "$pkgdir/usr/share/man/man8/"
}

package_python2-ethtool() {
  depends+=('python2')
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --skip-build --root="$pkgdir/" --optimize=1

  install -d "$pkgdir/usr/bin"
  install -m 0755 pethtool.py "$pkgdir/usr/bin/pethtool"
  sed -i '1s/python/python2/' "$pkgdir/usr/bin/pethtool"
  install -m 0755 pifconfig.py "$pkgdir/usr/bin/pifconfig"
  sed -i '1s/python/python2/' "$pkgdir/usr/bin/pifconfig"
}

# vim:set ts=2 sw=2 et:
