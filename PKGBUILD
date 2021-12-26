# Maintainer: uttarayan21 <uttarayan21@disroot.org>

pkgname=macchina-git
_pkgname=macchina
pkgver=6.0.1.4dc463d
pkgrel=1
pkgdesc="Basic system information fetcher, written in Rust"

arch=('x86_64')
url="https://github.com/macchina-cli/macchina"
license=('MIT')

depends=('gcc-libs' 'glibc')
optdepends=('wmctrl: window manager support')
provides=("macchina=${pkgver}")
conflicts=("macchina")
makedepends=('rust' 'cargo' 'git')
source=("$pkgname::git+${url}.git")
md5sums=('SKIP')


pkgver() {
    cd "$pkgname"
    echo "$(grep ^version Cargo.toml | cut -d= -f2 | tr -d ' "').$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"
}

build() {
    cd "$pkgname"
    cargo build --release
}


package() {
    cd "$pkgname"
    targetdir=${CARGO_TARGET_DIR:-target}

    install -Dm755 "$targetdir/release/macchina" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

    install -Dm 644 "doc/man/${_pkgname}.1" -t "${pkgdir}/usr/share/man/man1"
    install -Dm 644 "doc/man/${_pkgname}.7" -t "${pkgdir}/usr/share/man/man7"

    install -d "${pkgdir}/usr/share/${_pkgname}/themes"
    install -m 644 contrib/themes/* "${pkgdir}/usr/share/${_pkgname}/themes"
}
