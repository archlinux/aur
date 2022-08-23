# Maintainer: Iván Gabaldón <contact [at] inetol.net>
# Contributor: Kim Brandt <myrveln@gmail.com>
# Contributor: Vinh Nguyen <kurei [at] axcoto.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=newrelic-php5
pkgver=10.0.0.312
_libver=20210902
pkgrel=2
pkgdesc='PHP Monitoring Agent'
arch=('x86_64' 'i686')
url='https://newrelic.com/php'
license=('Apache')
depends=('glibc' 'php')
backup=('etc/php/conf.d/newrelic.ini')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://download.newrelic.com/php_agent/archive/$pkgver/$pkgname-$pkgver-linux.tar.gz"
        'newrelic-daemon.service')
noextract=("$pkgname-$pkgver.tar.gz")
b2sums=('9f643ce5183249560ba13ab114c44a52f6b33bc0e0bde7a79d211877c8e4d5f4554de83a9ac8dc3e8fa399cea91265fa83e41485a6235d232b26a8750394908c'
        'c5f8acd4c94951f7761b98aa9965110f2128fb86b0fa0f5097f2a5ea537db5b58e62dcce57a23e458ca4906bcfe03aca687eb5e7239551726deee8a5d953abbd')

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
