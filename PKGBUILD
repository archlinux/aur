# Maintainer: Okabe Zero-Link <okabezerolink@gmail.org>

_pkgname=emuera-tty
pkgname=${_pkgname}-git
pkgver=v0.1.0.r15.gf2b0c8f
pkgver() {
  cd "$pkgname"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgrel=1
pkgdesc='An Emuera (ERB engine) reimplementation in Rust for terminals'
url='https://github.com/astartes-gaming/emuera-tty'
license=(MIT)
makedepends=('cargo' 'git')
depends=()
conflicts=(emuera-tty)
arch=('any')
optdepends=('kitty: recommended terminal'
            'translate-shell: in-terminal MTL support')
source=("${pkgname}::git+${url}.git")
b2sums=('SKIP')

prepare() {
    cd $srcdir/$pkgname
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd $srcdir/$pkgname
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd $srcdir/$pkgname
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
