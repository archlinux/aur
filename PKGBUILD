# Maintainer: Ivan Gabaldon <ivan [d0t] gab [at] inetol [d0t] net>
# Contributor: Kim Brandt <myrveln@gmail.com>
# Contributor: Vinh Nguyen <kurei [at] axcoto.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=newrelic-php5
pkgver=10.3.0.315
_libver=20210902
pkgrel=1
pkgdesc='PHP Monitoring Agent'
arch=('x86_64' 'i686')
url='https://newrelic.com/php'
license=('Apache')
depends=('php')
backup=('etc/php/conf.d/newrelic.ini')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://download.newrelic.com/php_agent/archive/$pkgver/$pkgname-$pkgver-linux.tar.gz"
        'newrelic-daemon.service')
noextract=("$pkgname-$pkgver.tar.gz")
b2sums=('dec058af592704078f1cc3cb95312127fb786fb8fde9bfa31c98bbbb12b7f9ebf98639e31952b7aec0c2671d084d51e97d2bce9b957a6772df8f4f3e75de5f43'
        '02b3199ad7edf6ab14207b01f971c7fada8e69c351b04e74fd2d1847900b5ff48591c5f21e862afdf1cbfe3a10256238092a5535addbc554f4f26dd7cb19f5da')

prepare() {
    mkdir -p "$pkgname-$pkgver"
    bsdtar -xpf "$pkgname-$pkgver.tar.gz" --strip-components=1 -C "$pkgname-$pkgver"
}

package() {
    if [ "$CARCH" == 'x86_64' ]; then
        install -Dm755 "$srcdir/$pkgname-$pkgver/daemon/newrelic-daemon.x64" "$pkgdir/usr/bin/newrelic-daemon"

        install -Dm755 "$srcdir/$pkgname-$pkgver/agent/x64/newrelic-$_libver-zts.so" "$pkgdir/usr/lib/php/modules/newrelic-zts.so"
        install -Dm755 "$srcdir/$pkgname-$pkgver/agent/x64/newrelic-$_libver.so" "$pkgdir/usr/lib/php/modules/newrelic.so"
    elif [ "$CARCH" == 'i686' ]; then
        install -Dm755 "$srcdir/$pkgname-$pkgver/daemon/newrelic-daemon.x86" "$pkgdir/usr/bin/newrelic-daemon"

        install -Dm755 "$srcdir/$pkgname-$pkgver/agent/x86/newrelic-$_libver-zts.so" "$pkgdir/usr/lib/php/modules/newrelic-zts.so"
        install -Dm755 "$srcdir/$pkgname-$pkgver/agent/x86/newrelic-$_libver.so" "$pkgdir/usr/lib/php/modules/newrelic.so"
    fi

    install -Dm644 "$srcdir/$pkgname-$pkgver/scripts/newrelic.ini.template" "$pkgdir/etc/php/conf.d/newrelic.ini.template"
    install -Dm644 "$srcdir/$pkgname-$pkgver/scripts/newrelic.ini.template" "$pkgdir/etc/php/conf.d/newrelic.ini"

    install -Dm644 "$srcdir/newrelic-daemon.service" "$pkgdir/usr/lib/systemd/system/newrelic-daemon.service"

    install -Dm644 "$srcdir/$pkgname-$pkgver/README.txt" "$pkgdir/usr/share/doc/$pkgname/README"
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
