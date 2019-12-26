# Maintainer: Tyler Langlois <ty |at| tjll |dot| net>
# Contributor: Christof "chdorner" Dorner <https://github.com/chdorner>

pkgname=riemann-bin
_pkgbase=${pkgname%%-bin}
pkgver=0.3.5
pkgrel=1
pkgdesc="Monitors distributed systems (precompiled)"
arch=('any')
url="http://$_pkgbase.io/"
license=('EPL')
depends=('java-runtime-headless>=8' 'bash')
provides=('riemann')
conflicts=('riemann')
install="$_pkgbase.install"
source=("https://github.com/$_pkgbase/$_pkgbase/releases/download/$pkgver/$_pkgbase-$pkgver.tar.bz2"
        'logging.patch'
        "$_pkgbase.install"
        "$_pkgbase.sysusers"
        "$_pkgbase.service")
backup=("etc/$_pkgbase/$_pkgbase.config")
sha256sums=('2c0f7de308417af890d33f2a9ac40649337cf1b7e0e0c930d8e69f151e15fbb4'
            '0e1a10f59cc95f9cef3eb54cc9764366a714eec2ed6c08750ac13c5d456d69c5'
            'c62dfdd9c723e0717d5da33dc85def9a9a8f623f671aafa9505df3790bb4d2ae'
            '18e21c05c351a8bcbd55b3a454bceb67b7dcfe1385e7cca6936fe63640c44303'
            '94181e635ae9774a76bf4169064f253b626fb09806694d34774ed06d54df35b8')

prepare() {
  cd "$srcdir/$_pkgbase-$pkgver"

  for patch in $srcdir/*.patch; do
    msg2 "Applying $(basename $patch)"
    patch -Np1 -i $patch
  done
}

# No build() function; riemann provides .jar artifacts

package() {
  cd "$srcdir/$_pkgbase-$pkgver"

  install -dm755 "$pkgdir/var/log/riemann"

  install -Dm644 etc/riemann.config "$pkgdir/etc/riemann/riemann.config"
  install -Dm755 bin/riemann        "$pkgdir/usr/bin/riemann"
  install -Dm644 lib/riemann.jar    "$pkgdir/usr/lib/riemann.jar"

  install -Dm644 "$srcdir/riemann.service" \
                 "$pkgdir/usr/lib/systemd/system/riemann.service"

  install -Dm644 "$srcdir"/riemann.sysusers \
                 "$pkgdir"/usr/lib/sysusers.d/riemann.conf
}
