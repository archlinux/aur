# Maintainer: Tyler Langlois <ty |at| tjll |dot| net>
# Contributor: Christof "chdorner" Dorner <https://github.com/chdorner>

pkgname=riemann
pkgver=0.2.8
pkgrel=2
pkgdesc="Monitors distributed systems"
arch=('any')
url="http://riemann.io/"
license=('EPL')
depends=('java-runtime' 'bash')
install='riemann.install'
source=("http://aphyr.com/riemann/$pkgname-$pkgver.tar.bz2"
        'logging.patch'
        'riemann.install'
        'riemann.sysusers'
        'riemann.service')
backup=('etc/riemann/riemann.config')
sha256sums=('f5bb666acb878e144471f8c6d7f622193840d127aea96924fd8575e1fb6c57dc'
            '0e1a10f59cc95f9cef3eb54cc9764366a714eec2ed6c08750ac13c5d456d69c5'
            '4e7164386c91a3edf746ae0bba3d5e4e7ee24fa2093fe16d1da3d2b049cd2485'
            '54489dda6703afcfeb2e209f4a5abdbddbad66f3ad78c5bae905706f346aca5d'
            '58d35d4f6a488bbcf495f77449199dc7a498a67aacf8c789329bea69f532ad21')

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

  install -dm755 "$pkgdir/var/{lib,log}/riemann"

  install -Dm644 etc/riemann.config "$pkgdir/etc/riemann/riemann.config"
  install -Dm755 bin/riemann        "$pkgdir/usr/bin/riemann"
  install -Dm644 lib/riemann.jar    "$pkgdir/usr/lib/riemann.jar"

  install -Dm644 "$srcdir/riemann.service" \
                 "$pkgdir/usr/lib/systemd/system/riemann.service"

  install -Dm644 "$srcdir"/riemann.sysusers \
                 "$pkgdir"/usr/lib/sysusers.d/riemann.conf
}
