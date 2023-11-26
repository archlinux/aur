# Maintainer: Ivan Gabaldon <aur[at]inetol.net>
# Contributor: Kim Brandt <myrveln@gmail.com>
# Contributor: Vinh Nguyen <kurei [at] axcoto.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=newrelic-php5
pkgver=10.14.0.3
pkgrel=1
pkgdesc='PHP Monitoring Agent'
arch=('aarch64' 'x86_64')
url='https://newrelic.com/php'
license=('Apache')
depends=('php')
backup=('etc/php/conf.d/newrelic.ini')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://download.newrelic.com/php_agent/archive/$pkgver/$pkgname-$pkgver-linux.tar.gz")
noextract=("$pkgname-$pkgver.tar.gz")
b2sums=('b0d567306ad785afec272aa72fcc96ae8d5abdf58f59337a88a9d49fbd0c9ab18a653f5ac94ffe54332b9a48cf54ac7c864c5cecc1bcc0f952968907994e2444')

prepare() {
    mkdir -p "$pkgname-$pkgver"
    bsdtar -xpf "$pkgname-$pkgver.tar.gz" --strip-components=1 -C "$pkgname-$pkgver"
}

package() {
    if [ "$CARCH" == 'aarch64' ]; then
        install -Dm755 "$srcdir/$pkgname-$pkgver/daemon/newrelic-daemon.aarch64" "$pkgdir/usr/bin/newrelic-daemon"
        install -Dm755 "$srcdir/$pkgname-$pkgver/agent/aarch64/newrelic-20220829.so" "$pkgdir/usr/lib/php/modules/newrelic.so"
    else
        install -Dm755 "$srcdir/$pkgname-$pkgver/daemon/newrelic-daemon.x64" "$pkgdir/usr/bin/newrelic-daemon"
        install -Dm755 "$srcdir/$pkgname-$pkgver/agent/x64/newrelic-20220829.so" "$pkgdir/usr/lib/php/modules/newrelic.so"
    fi

    install -Dm644 "$srcdir/$pkgname-$pkgver/scripts/newrelic.cfg.template" "$pkgdir/etc/newrelic/newrelic.cfg"
    install -Dm644 "$srcdir/$pkgname-$pkgver/scripts/newrelic.ini.template" "$pkgdir/etc/php/conf.d/newrelic.ini"
    install -Dm644 "$srcdir/$pkgname-$pkgver/scripts/newrelic-daemon.service" "$pkgdir/usr/lib/systemd/system/newrelic-daemon.service"

    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/$pkgname-$pkgver/README.txt" "$pkgdir/usr/share/doc/$pkgname/README"
}
