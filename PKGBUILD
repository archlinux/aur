# Maintainer: Brett Cornwall <ainola@archlinux.org>

pkgname=lazy-ips-git
pkgver=r16.8a71de5
pkgrel=2
pkgdesc="IPS patcher for Linux"
arch=('any')
url="https://github.com/btimofeev/lazy_ips"
license=('GPL3')
depends=('python-gobject')
makedepends=('git' 'gendesk')
provides=('lazy-ips')
conflicts=('lazy-ips')
source=("git+https://github.com/btimofeev/lazy_ips.git")
sha256sums=('SKIP')

prepare() {
    gendesk -n \
            --name="Lazy IPS" \
            --pkgname="$pkgname" \
            --pkgdesc="$pkgdesc" \
            --exec=/usr/bin/lazy-ips \
            --categories='Utility;FileTools'
}

pkgver() {
    cd lazy_ips
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    for file in lazy_ips.py lazy_ips_cli.py patch_ips.py; do
        install -Dm755 "lazy_ips/$file" -t "$pkgdir/usr/share/lazy-ips/"
    done
    install -dm755 "$pkgdir/usr/bin/"
    ln -s /usr/share/lazy-ips/lazy_ips.py "$pkgdir/usr/bin/lazy-ips"
    ln -s /usr/share/lazy-ips/lazy_ips_cli.py "$pkgdir/usr/bin/lazy-ips-cli"

    install -Dm644 lazy-ips.desktop -t "$pkgdir/usr/share/applications/"
    install -Dm644 lazy_ips/README.md -t "$pkgdir/usr/share/doc/lazy-ips"
}
