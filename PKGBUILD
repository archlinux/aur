# Maintainer: Valentin Batz <valentin.batz+archlinux@posteo.de>

pkgname=mdns-tui-browser
pkgver=1.23.5
pkgrel=1
pkgdesc="A terminal-based mDNS service browser"
arch=('x86_64')
url="https://github.com/hrzlgnm/mdns-tui-browser"
license=('MIT')
makedepends=('cargo' 'cargo-auditable' 'git' 'rust')
options=('!strip' '!emptydirs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hrzlgnm/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('838cc45c458818df08ee6f5cf252e94aeac5998859dca343f06dbe7b34e37006')
_builddir="$pkgname-$pkgver"
prepare() {
    cd "$srcdir/$_builddir" || exit 1
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}
build() {
    cd "$srcdir/$_builddir" || exit 1
    cargo --locked --frozen build --release
}
check() {
    cd "$srcdir/$_builddir" || exit 1
    cargo test --locked --frozen
}
package() {
    install -Dm755 "${srcdir}/${_builddir}/target/release/mdns-tui-browser" "$pkgdir"/usr/bin/mdns-tui-browser
    install -Dm644 "${srcdir}/${_builddir}"/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm644 "${srcdir}/${_builddir}"/README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
    install -Dm644 "${srcdir}/${_builddir}"/docs/mdns-tui-browser.1 "$pkgdir"/usr/share/man/man1/mdns-tui-browser.1
}
