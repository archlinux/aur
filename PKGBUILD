# Maintainer: Valentin Batz <valentin.batz+archlinux@posteo.de>

pkgname=mex
pkgver=0.4.2
pkgrel=1
pkgdesc="Terminal UI to browse and debug mDNS/DNS-SD on the local link"
arch=('x86_64')
url="https://github.com/hrzlgnm/mex"
license=('MIT')
makedepends=('cargo' 'cargo-auditable' 'git' 'rust')
options=('!strip' '!emptydirs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hrzlgnm/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d3b6ea44d4d832669f63d862ce9344643659fae5d7b08c24cb98f084eeb1dbd8')
_builddir="$pkgname-$pkgver"
prepare() {
    cd "$srcdir/$_builddir" || exit 1
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}
build() {
    cd "$srcdir/$_builddir" || exit 1
    cargo --locked --frozen auditable build --release
}
check() {
    cd "$srcdir/$_builddir" || exit 1
    cargo test --locked --frozen
}
package() {
    install -Dm755 "${srcdir}/${_builddir}/target/release/mex" "$pkgdir"/usr/bin/mex
    install -Dm644 "${srcdir}/${_builddir}"/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm644 "${srcdir}/${_builddir}"/README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
    install -Dm644 "${srcdir}/${_builddir}"/CHANGELOG.md "$pkgdir"/usr/share/doc/$pkgname/CHANGELOG.md
    install -Dm644 "${srcdir}/${_builddir}"/docs/mex.1 "$pkgdir"/usr/share/man/man1/mex.1
    install -Dm644 "${srcdir}/${_builddir}"/packaging/linux/mex.desktop "$pkgdir"/usr/share/applications/mex.desktop
    install -Dm644 "${srcdir}/${_builddir}"/packaging/linux/mex.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/mex.svg
}
