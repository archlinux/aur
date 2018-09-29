# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>
# Maintainer: emersion <contact emersion.fr>

pkgname=browserpass
pkgver=2.0.21
pkgrel=2
pkgdesc="Chrome & Firefox browser extension for pass, a UNIX password manager"
arch=("x86_64")
url="https://github.com/browserpass/browserpass"
license=("MIT")
depends=("gnupg")
makedepends=("go")
source=("$pkgname-$pkgver.tar.gz::https://github.com/dannyvankooten/browserpass/releases/download/$pkgver/browserpass-src.tar.gz"
        "$pkgname-$pkgver.tar.gz.sig::https://github.com/dannyvankooten/browserpass/releases/download/$pkgver/browserpass-src.tar.gz.sig")
sha256sums=('629a920e8e501627d9f22359ff199c2bacdc8692acc65ed5464c0d64401f76d7'
            'SKIP')
validpgpkeys=("EB4F9E5A60D32232BB52150C12C87A28FEAC6B20")

prepare() {
    cd "$srcdir/$pkgname"

    _host_file="/usr/bin/browserpass"
    sed -i -e "s|%%replace%%|$_host_file|" chrome-host.json
    sed -i -e "s|%%replace%%|$_host_file|" firefox-host.json
}

build() {
    _GOPATH="$(pwd)/.go"

    _go_pkgname="github.com/dannyvankooten/browserpass"
    _go_pkgpath="$_GOPATH/src/$_go_pkgname"
    mkdir -p "$(dirname "$_go_pkgpath")"
    ln -sf "$srcdir/$pkgname" "$_go_pkgpath"

    cd "$srcdir/$pkgname"
    GOPATH="$_GOPATH" make browserpass
}

package() {
    cd "$srcdir/$pkgname"

    install -Dm755 browserpass "$pkgdir/usr/bin/browserpass"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    _app_name="com.dannyvankooten.browserpass"

    # Google Chrome
    install -Dm644 chrome-host.json "$pkgdir/etc/opt/chrome/native-messaging-hosts/$_app_name.json"
    install -Dm644 chrome-policy.json "$pkgdir/etc/opt/chrome/policies/managed/$_app_name.json"

    # Chromium
    install -Dm644 chrome-host.json "$pkgdir/etc/chromium/native-messaging-hosts/$_app_name.json"
    install -Dm644 chrome-policy.json "$pkgdir/etc/chromium/policies/managed/$_app_name.json"

    # Firefox
    install -Dm644 firefox-host.json "$pkgdir/usr/lib/mozilla/native-messaging-hosts/$_app_name.json"
}

# vim:set ts=4 sw=4 et:
