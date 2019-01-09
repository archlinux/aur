# Maintainer: Dennis Stengele <d.stengele (at) derintendant (dot) de>
pkgname=tuptime
pkgver=3.4.2
pkgrel=2
pkgdesc="Report the historical and statistical running time of system"
arch=('any')
url="https://github.com/rfrail3/tuptime"
license=('GPL')
depends=(
          'python'
        )
install=tuptime.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/rfrail3/tuptime/archive/${pkgver}.tar.gz")
sha256sums=('784bfcd3026128cf7addaaf821f2f5a9c1d1626f5dd83b3b138090f6fb346e9e')

prepare() {
    cd "$srcdir/$pkgname-${pkgver}"
    sed -i '/Requires=tuptime.service/d' "src/systemd/tuptime-cron.service"
    sed -i '/User=tuptime/d' "src/systemd/tuptime-cron.service"
}

package() {
    cd "$srcdir/$pkgname-${pkgver}"
    install -D -m755 "src/tuptime" "$pkgdir/usr/bin/tuptime"
    install -D -m644 "src/systemd/tuptime-cron.service" "$pkgdir/usr/lib/systemd/system/tuptime.service"
    install -D -m644 "src/systemd/tuptime-cron.timer" "$pkgdir/usr/lib/systemd/system/tuptime.timer"
    install -d -m755 "$pkgdir/usr/lib/systemd/system/timers.target.wants"
    ln -s "../tuptime.timer" "$pkgdir/usr/lib/systemd/system/timers.target.wants/tuptime.timer"
}
