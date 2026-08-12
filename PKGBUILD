# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: amgsk <y.amgsk@gmail.com>

pkgname=meguri
pkgver=0.3.0
pkgrel=1
pkgdesc="Local video and image browser with thumbnails, search, and playback"
arch=(x86_64)
url="https://github.com/zabuton-app/meguri"
license=(MIT)
_electron=electron42
depends=("$_electron" nodejs)
makedepends=(npm asar)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        meguri.sh)
sha256sums=('495a1c0329814b5e26f0a3036dbfeec60bf54bbf01720638221f8e4ee7e14914'
            '0c2e669b166935140ae542a53aa2b56c71a902e145555848bda5a88605e843c7')

prepare() {
    cd "$pkgname-$pkgver"
    npm install --cache "$srcdir/npm-cache"
}

build() {
    cd "$pkgname-$pkgver"
    local x86_64=x64
    npx electron-vite build
    npx electron-builder --linux --"${!CARCH}" --dir \
        -c.electronDist="/usr/lib/$_electron" \
        -c.electronVersion="$(</usr/lib/$_electron/version)"
}

package() {
    cd "$pkgname-$pkgver"
    local x86_64=linux-unpacked
    install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
    install -d "$pkgdir/usr/lib/$pkgname/"
    asar e "release/${!CARCH}/resources/app.asar" "$pkgdir/usr/lib/$pkgname/"
    rm -rf "$pkgdir/usr/lib/$pkgname/node_modules/ffprobe-static/bin/"{darwin,linux/ia32}
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

