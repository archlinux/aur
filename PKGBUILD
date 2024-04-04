# Maintainer: Matt Taylor <64.delta@proton.me>
# https://github.com/64/aur-packages for pull requests and issues.
pkgname=surfer-waveform-git
pkgrel=1
pkgdesc="A waveform viewer with a focus on a snappy usable interface, and extensibility."
arch=('x86_64')
url="https://gitlab.com/surfer-project/surfer"
license=('EUPL')
groups=()
depends=('openssl')
makedepends=('rust' 'cargo' 'git' 'desktop-file-utils' 'gcc' 'binutils')
checkdepends=()
optdepends=()
provides=('surfer-waveform')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('surfer-waveform-git::git+https://gitlab.com/surfer-project/surfer#branch=main')
noextract=()
sha256sums=('SKIP')
validpgpkeys=()
pkgver=0.1.0.r88.g01c2486

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    git submodule update --init --recursive
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release --all-features
}

package() {
    cd "$pkgname"
    desktop-file-install -m 644 --dir "$pkgdir/usr/share/applications/" "assets/Surfer.desktop"
    install -Dm644 "./LICENSE-EUPL-1.2.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 "target/release/surfer" "$pkgdir/usr/bin/surfer"
}
