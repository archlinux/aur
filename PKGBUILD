# Contributor: Johannes Dewender  arch at JonnyJD dot net
pkgname=targetcli-fb
pkgver=2.1.fb27
pkgrel=1
epoch=
pkgdesc="free branch of the targetcli LIO administration shell (iSCSI + Co)"
arch=('any')
url="https://github.com/agrover/targetcli-fb"
license=('Apache')
groups=()
depends=('python2-rtslib-fb>=2.1.fb33' 'python2-configshell-fb')
optdepends=()
conflicts=('lio-utils')
provides=('targetcli')
replaces=('rtsadmin')
backup=()
options=()
install=
source=($pkgname-$pkgver.tar.gz::https://github.com/agrover/$pkgname/archive/v$pkgver.tar.gz
target.service
target)
md5sums=('3e930c79a1aff77e749e7783acfef13b'
         'f462e9a5852346c66b77793565ddbc67'
         'f23bd6d5d4021c29b4519e40b3b9e042')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
  gzip --stdout targetcli.8 > "targetcli.8.gz"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --skip-build --root="$pkgdir/" --optimize=1

  install -D -m 644 targetcli.8.gz "$pkgdir/usr/share/man/man8/targetcli.8.gz"

  # arch specific
  cd "$srcdir"
  install -d "$pkgdir/etc/target"
  # systemd
  mkdir -p "$pkgdir/usr/lib/systemd/system"
  cp target.service "$pkgdir/usr/lib/systemd/system/"
  # sysvinit (deprecated)
  install -D -m 755 target "$pkgdir/etc/rc.d/target"
}

# vim:set ts=2 sw=2 et:
