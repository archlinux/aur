# Maintainer: Blaadick <null>

pkgname='bp-test123'
_realpkgname='blaadpapers'
pkgdesc='Why is it so hard to automate AUR package updates?'
pkgver='0.0.1'
pkgrel=1
arch=('any')
url='https://github.com/Blaadick/BlaadPapers'
license=('MIT')
depends=('qt6-base' 'hyprpaper')
makedepends=('cmake' 'ninja' 'librsvg')
options=('!debug')
source=("$_realpkgname=-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('84e87805f8c10a2dd2af3118b3aa86a2f2c0f2bed6d88eaf71ea44d4009b05e0')

build() {
    cd "BlaadPapers-$pkgver"
    cmake -B build -G Ninja -Wno-dev
    cmake --build build
}

package() {
    cd "BlaadPapers-$pkgver"

    install -Dm755 "./build/$_realpkgname" "$pkgdir/usr/bin/$_realpkgname"
    install -Dm644 "./res/$_realpkgname.desktop" "$pkgdir/usr/share/applications/$_realpkgname.desktop"
    install -Dm644 "./res/$_realpkgname.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$_realpkgname.fish"
    install -Dm644 "./res/$_realpkgname.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_realpkgname.svg"

    for size in 16 22 24 32 36 48 64 72 96 128 192 256 384 512; do
        install -d "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
        rsvg-convert -w $size -h $size -o "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$_realpkgname.png" "./res/$_realpkgname.svg"
    done
}
