# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com> 

pkgname=spf-engine
pkgver=2.9.2
_pkgver=2.9
pkgrel=1
pkgdesc="SPF (Sender Policy Framework) back-end for integration with Postfix and Sendmail"
arch=('any')
url="https://launchpad.net/spf-engine"
license=('Apache' 'GPL2')
depends=('python>=3.3' 'python-pyspf>=2.0.9' 'python-authres' 'python-pymilter')
optdepends=('postfix: Postfix integration'
	    'sendmail: Sendmail integration') 
conflicts=('python2-postfix-policyd-spf' 'python-postfix-policyd-spf')
backup=(etc/python-policyd-spf/policyd-spf.conf
	etc/pyspf-milter/pyspf-milter.conf)
source=("https://launchpad.net/$pkgname/$_pkgver/$pkgver/+download/$pkgname-$pkgver.tar.gz"
	pyspf-milter.sysusers
	pyspf-milter.conf
	pyspf-milter.service
	own_socketfile-bug-1856391.patch)
sha256sums=('188a8bc78f1ddb40f1b87a0b6fe2fa78efa0b4cc5d984ff19a53724bb5c28131'
            '1a66a9d8315d95e910f3177123a81a4320ff0c216b286571dcc0a204e6eac0a4'
            '00f29931c8d4e76d026982cba22a7c2d0823cb82052438ec1b71df373e95a485'
            'b9346555aa14e9beff00b522127b08b212bc4535d40591fb3d002a8c9a3f4f68'
            '6108b155534b024b692387c73a17eae5ddf7d261cea126932049a969012f4aca')

prepare() {
  cd "$pkgname-$pkgver"
  # Patch to fix Bug 1856391 - remove once fixed upstream
  # https://bugs.launchpad.net/spf-engine/+bug/1856391
  patch --strip=1 --input="${srcdir}/own_socketfile-bug-1856391.patch"
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --single-version-externally-managed --skip-build
  
  # Fix and remove incorrect files and directory structure
  mv "$pkgdir"/usr/etc "$pkgdir"/etc
  rm "$pkgdir"/etc/init.d/pyspf-milter
  rmdir "$pkgdir"/etc/init.d
  rm "$pkgdir"/usr/lib/systemd/system/pyspf-milter.service

  install -Dm644 "$srcdir/pyspf-milter.sysusers" "$pkgdir/usr/lib/sysusers.d/pyspf-milter.conf"
  install -Dm644 "$srcdir/pyspf-milter.conf" "$pkgdir/etc/pyspf-milter/pyspf-milter.conf"
  install -m644 "$srcdir/pyspf-milter.service" "$pkgdir"/usr/lib/systemd/system
  install -m644 policyd-spf.conf.commented "$pkgdir"/etc/python-policyd-spf
}
