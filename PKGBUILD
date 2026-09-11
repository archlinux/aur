# Maintainer: Valentin Batz <valentin.batz+archlinux@posteo.de>

pkgname=mdns-tui-browser
pkgver=1.34.8
pkgrel=1
pkgdesc="A terminal-based mDNS service browser"
arch=('x86_64')
url="https://github.com/hrzlgnm/mdns-tui-browser"
license=('MIT')
makedepends=('cargo' 'cargo-auditable' 'cargo-edit' 'git' 'rust')
options=('!strip' '!emptydirs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hrzlgnm/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('65f4f214ea37173d70109c90b50b8a31d2688fec6a84a39be5038a75ca7d98c7')
_builddir="$pkgname-$pkgver"
prepare() {
    cd "$srcdir/$_builddir" || exit 1
    cargo set-version -p "$pkgname" "$pkgver"
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
    install -Dm644 "${srcdir}/${_builddir}"/CHANGELOG.md "$pkgdir"/usr/share/doc/$pkgname/CHANGELOG.md
    install -Dm644 "${srcdir}/${_builddir}"/docs/mdns-tui-browser.1 "$pkgdir"/usr/share/man/man1/mdns-tui-browser.1
}
