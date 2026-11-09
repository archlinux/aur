# Maintainer: Valentin Batz <valentin.batz+archlinux@posteo.de>

pkgname=mex
pkgver=0.2.0
pkgrel=1
pkgdesc="A terminal UI for browsing mDNS traffic"
arch=('x86_64')
url="https://github.com/hrzlgnm/mex"
license=('MIT')
makedepends=('cargo' 'cargo-auditable' 'git' 'rust')
options=('!strip' '!emptydirs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hrzlgnm/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0e9197e645d195a298657d15052a81074f52d81569024e69f0a101d1626a9eb1')
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
