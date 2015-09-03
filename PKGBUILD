# Maintainer: Tyler Langlois <ty |at| tjll |dot| net>
# Contributor: Christof "chdorner" Dorner <https://github.com/chdorner>

pkgname=riemann
pkgver=0.2.10
pkgrel=1
pkgdesc="Monitors distributed systems"
arch=('any')
url="http://riemann.io/"
license=('EPL')
depends=('java-runtime' 'bash')
install='riemann.install'
source=("https://aphyr.com/riemann/$pkgname-$pkgver.tar.bz2"
        'logging.patch'
        'riemann.install'
        'riemann.sysusers'
        'riemann.service')
backup=('etc/riemann/riemann.config')
sha256sums=('ec697519e80781dc478983de04204760f2790da1715acfd233b35da071be5455'
            '0e1a10f59cc95f9cef3eb54cc9764366a714eec2ed6c08750ac13c5d456d69c5'
            'c62dfdd9c723e0717d5da33dc85def9a9a8f623f671aafa9505df3790bb4d2ae'
            '18e21c05c351a8bcbd55b3a454bceb67b7dcfe1385e7cca6936fe63640c44303'
            '94181e635ae9774a76bf4169064f253b626fb09806694d34774ed06d54df35b8')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  for patch in $srcdir/*.patch; do
    msg2 "Applying $(basename $patch)"
    patch -Np1 -i $patch
  done
}

# No build() function; riemann provides .jar artifacts

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -dm755 "$pkgdir/var/log/riemann"

  install -Dm644 etc/riemann.config "$pkgdir/etc/riemann/riemann.config"
  install -Dm755 bin/riemann        "$pkgdir/usr/bin/riemann"
  install -Dm644 lib/riemann.jar    "$pkgdir/usr/lib/riemann.jar"

  install -Dm644 "$srcdir/riemann.service" \
                 "$pkgdir/usr/lib/systemd/system/riemann.service"

  install -Dm644 "$srcdir"/riemann.sysusers \
                 "$pkgdir"/usr/lib/sysusers.d/riemann.conf
}
