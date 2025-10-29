# Maintainer: Jérôme Poulin <jeromepoulin@gmail.com>
pkgname=pwalinks-git
pkgver=0.r11.f85ff15
pkgrel=1
pkgdesc="Firefox native messaging host to open external links in default browser"
arch=('any')
url="https://github.com/Onred/pwalinks"
license=('GPL-3.0-only')
depends=('python')
makedepends=('git')
provides=('pwalinks')
conflicts=('pwalinks')
source=("git+https://github.com/Onred/pwalinks.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/pwalinks"
    printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/pwalinks"

    # Install native messaging host script
    install -Dm755 native-app/pwalinks.py "$pkgdir/usr/lib/mozilla/native-messaging-hosts/pwalinks.py"

    # Install native messaging manifest with correct path
    install -Dm644 native-app/pwalinks.json "$pkgdir/usr/lib/mozilla/native-messaging-hosts/pwalinks.json"
    sed -i 's|%APPDIR%|/usr/lib/mozilla/native-messaging-hosts/pwalinks.py|' \
        "$pkgdir/usr/lib/mozilla/native-messaging-hosts/pwalinks.json"

    # Install documentation
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
