# Maintainer: Campbell Jones <serebit at archlinux dot org>

pkgname=magothy-git
pkgver=r256.d77b20f
pkgrel=1
pkgdesc="Hardware profiling tool"
arch=('x86_64' 'armv7h' 'aarch64')
url='https://codeberg.org/serebit/magothy'
license=('Apache-2.0')
depends=(
    'hicolor-icon-theme'
    'hwdata'
)
makedepends=(
    'cargo'
    'git'
)
optdepends=(
    'libdrm: Better AMD GPU model name reporting'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname"::'git+https://codeberg.org/serebit/magothy.git')
b2sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$pkgname"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --profile samply
}

package() {
    cd "$srcdir/$pkgname"

    install -Dm 0755 -t "$pkgdir/usr/bin/" "target/samply/${pkgname%-git}"
    install -Dm 0644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" "resources/dev.serebit.Magothy.svg"
}

check() {
    cd "$srcdir/$pkgname"

    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}
