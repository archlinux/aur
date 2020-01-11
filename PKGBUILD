# Maintainer: Dennis Stengele <d.stengele (at) derintendant (dot) de>
pkgname=tuptime
pkgver=4.1.0
pkgrel=1
pkgdesc="Report the historical and statistical running time of system"
arch=('any')
url="https://github.com/rfrail3/tuptime"
license=('GPL')
depends=(
          'python'
        )
install=tuptime.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/rfrail3/tuptime/archive/${pkgver}.tar.gz")
sha256sums=('d8161cd56b627894fbfa4cdfa5a2f7414d0969d4486ec3c9d3e27cd091c6a86e')

prepare() {
    cd "$srcdir/$pkgname-${pkgver}"
    sed -i '/User=tuptime/d' "src/systemd/tuptime.service"
    sed -i '/User=tuptime/d' "src/systemd/tuptime-cron.service"
}

package() {
    cd "$srcdir/$pkgname-${pkgver}"
    install -D -m755 "src/tuptime" "$pkgdir/usr/bin/tuptime"
    install -D -m644 "src/systemd/tuptime.service" "$pkgdir/usr/lib/systemd/system/tuptime.service"
    install -D -m644 "src/systemd/tuptime-cron.service" "$pkgdir/usr/lib/systemd/system/tuptime-cron.service"
    install -D -m644 "src/systemd/tuptime-cron.timer" "$pkgdir/usr/lib/systemd/system/tuptime-cron.timer"
    install -d -m755 "$pkgdir/usr/lib/systemd/system/timers.target.wants"
    ln -s "../tuptime.timer" "$pkgdir/usr/lib/systemd/system/timers.target.wants/tuptime.timer"
    ln -s "../tuptime-cron.timer" "$pkgdir/usr/lib/systemd/system/timers.target.wants/tuptime-cron.timer"
}
