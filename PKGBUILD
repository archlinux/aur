# Maintainer: Tareque Md Hanif <tarequemd dot hanif at yahoo dot com>

pkgname=laravel-kit
pkgver=2.0.7
pkgrel=1
pkgdesc='Laravel Kit - A desktop Laravel admin panel app'
arch=('any')
url='https://github.com/tmdh/laravel-kit'
license=('GPL2')
depends=('electron')
makedepends=('yarn')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        laravel-kit
        laravel-kit.desktop)
sha256sums=('ea1dd81bb9cc42fb24399107f35f018479187d4ca1eaf7ecdb647c213c11d2b8'
            'e8520282f50069bb016fbc3f655acba09601719fe81ab093dcddea52ff64ac43'
            'e90daafe30277cf296083260c0df0f46e9fb162e5b38ac861aaa20e1ec115552')

prepare() {
    _ver="$(</usr/lib/electron/version)"
    cd "laravel-kit-$pkgver"
    yarn
    yarn upgrade "electron@$_ver"
}

build() {
    cd "laravel-kit-$pkgver"
    local i686=ia32 x86_64=x64
    yarn run prod
    yarn electron-builder --linux --"${!CARCH}" --dir \
         -c.electronDist=/usr/lib/electron \
         -c.electronVersion="$_ver"
}

package() {
    local i686=linux-ia32-unpacked x86_64=linux-unpacked aarch64=linux-arm64-unpacked
    install -Dm644 -t "${pkgdir}/usr/share/applications" "${pkgname}.desktop"
    install -D -t "${pkgdir}/usr/bin" "$pkgname"

    cd "laravel-kit-$pkgver"
    install -Dm644 "build/icons/512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" license.txt
    install -d "$pkgdir/usr/lib/$pkgname/"
    cp dist "$pkgdir/usr/lib/$pkgname/dist" -r
    cp package.json "$pkgdir/usr/lib/$pkgname/"
}
