# Maintainer: Tyler Langlois <ty |at| tjll |dot| net>
# Contributor: Christof "chdorner" Dorner <https://github.com/chdorner>

pkgname=riemann
pkgver=0.3.5
pkgrel=1
pkgdesc="Monitors distributed systems"
arch=('any')
url="http://$pkgname.io/"
license=('EPL')
depends=('java-runtime-headless>=8' 'bash')
makedepends=('leiningen')
provides=('riemann')
conflicts=('riemann-bin')
install="$pkgname.install"
source=("https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz"
        'logging.patch'
        "$pkgname.install"
        "$pkgname.sysusers"
        "$pkgname.service")
backup=("etc/$pkgname/$pkgname.config")
sha256sums=('c13aae3f969189496baa2b51c3f863dce171733d66881722e2c8b26f97bef66f'
            '30c09cf2432f5cc49cbd77576c6fc3251495b2862e51d81af2ab71109c2706f8'
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

build() {
    cd "$srcdir/$pkgname-$pkgver"

    lein uberjar
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -dm755 "$pkgdir/var/log/riemann"

  install -Dm644 pkg/tar/riemann.config "$pkgdir/etc/riemann/riemann.config"
  install -Dm755 pkg/tar/riemann        "$pkgdir/usr/bin/riemann"
  install -Dm644 target/riemann-$pkgver-standalone.jar \
                 "$pkgdir/usr/lib/riemann.jar"

  install -Dm644 "$srcdir/riemann.service" \
                 "$pkgdir/usr/lib/systemd/system/riemann.service"

  install -Dm644 "$srcdir"/riemann.sysusers \
                 "$pkgdir"/usr/lib/sysusers.d/riemann.conf
}
