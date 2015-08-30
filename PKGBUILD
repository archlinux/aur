# Maintainer: Tyler Langlois <ty |at| tjll |dot| net>
# Contributor: Christof "chdorner" Dorner <https://github.com/chdorner>

pkgname=riemann
pkgver=0.2.8
pkgrel=3
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
sha256sums=('f5bb666acb878e144471f8c6d7f622193840d127aea96924fd8575e1fb6c57dc'
            '0e1a10f59cc95f9cef3eb54cc9764366a714eec2ed6c08750ac13c5d456d69c5'
            'd8f7789e9166b5d2472a444dffe8ffb01eb43fac366544b0082ceead2f01f20c'
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
  install -dm755 "$pkgdir/var/lib/riemann"

  install -Dm644 etc/riemann.config "$pkgdir/etc/riemann/riemann.config"
  install -Dm755 bin/riemann        "$pkgdir/usr/bin/riemann"
  install -Dm644 lib/riemann.jar    "$pkgdir/usr/lib/riemann.jar"

  install -Dm644 "$srcdir/riemann.service" \
                 "$pkgdir/usr/lib/systemd/system/riemann.service"

  install -Dm644 "$srcdir"/riemann.sysusers \
                 "$pkgdir"/usr/lib/sysusers.d/riemann.conf
}
