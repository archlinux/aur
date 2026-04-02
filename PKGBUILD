# Maintainer: nemphorous <https://github.com/nemphorous>
pkgname=zpwa
pkgver=1.0.0
pkgrel=1
pkgdesc="Zen PWA Suite for Omarchy - Self-contained web apps via Zen Browser"
arch=('any')
url="https://github.com/nemphorous/zpwa"
license=('GPL3')
depends=('zen-browser' 'gum' 'curl' 'sed' 'grep' 'socat' 'jq')
provides=('zpwa')
conflicts=('zpwa-git')
install=zpwa.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('420dc88613e36efe6ff83bd07d5429d744639318e2ea663809bf3ea094787a0e')

prepare() {
    if [[ ! -d "$HOME/.config/omarchy" || ! -f "$HOME/.local/share/omarchy/bin/omarchy-menu" ]]; then
        echo -e "\n\e[31m[ERROR] Omarchy environment not detected.\e[0m"
        return 1
    fi
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -dm755 "$pkgdir/usr/share/zpwa"

    cp -r * "$pkgdir/usr/share/zpwa/"

    mv "$pkgdir/usr/share/zpwa/cli/zpwa" "$pkgdir/usr/share/zpwa/zpwa"
    rmdir "$pkgdir/usr/share/zpwa/cli"

    rm -rf "$pkgdir/usr/share/zpwa/docs"
    rm -f "$pkgdir/usr/share/zpwa/PKGBUILD"
    rm -f "$pkgdir/usr/share/zpwa/zpwa.install"
    rm -f "$pkgdir/usr/share/zpwa/README.md"
    rm -f "$pkgdir/usr/share/zpwa/.gitignore"

    install -dm755 "$pkgdir/usr/bin"
    ln -s "/usr/share/zpwa/zpwa" "$pkgdir/usr/bin/zpwa"

    chmod +x "$pkgdir/usr/share/zpwa/zpwa"
    find "$pkgdir/usr/share/zpwa" -name "*.sh" -exec chmod +x {} + 2>/dev/null
}
