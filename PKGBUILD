# Maintainer: Leandro Cassa <leandro.cassa@gmail.com>
pkgname=chromium-cedilla-patch
pkgver=1.0.0
pkgrel=1
pkgdesc="Make ' + c produce ç in Chromium on native Wayland (no IME): byte-pattern patch of the hardcoded compose table + pacman hook to auto-reapply after upgrades"
arch=('any')
url="https://github.com/lcassa/chromium-wayland-cedilla-fix"
license=('MIT')
depends=('chromium' 'python')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('df5bca1bae2471652e33f957b5c23b34f300c37ea9234d5df17a8144ce8bf894')

package() {
    cd "$srcdir/chromium-wayland-cedilla-fix-$pkgver"

    # patch script -> /usr/bin (executable via its shebang)
    install -Dm755 chromium-cedilla-patch.py "$pkgdir/usr/bin/chromium-cedilla-patch"

    # packaged pacman hook -> /usr/share/libalpm/hooks, pointing at /usr/bin
    sed -e 's#^Exec = .*#Exec = /usr/bin/chromium-cedilla-patch /usr/lib/chromium/chromium#' \
        chromium-cedilla.hook > "$srcdir/packaged.hook"
    install -Dm644 "$srcdir/packaged.hook" \
        "$pkgdir/usr/share/libalpm/hooks/chromium-cedilla.hook"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
