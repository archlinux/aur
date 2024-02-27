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
provides=()
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
pkgver=0.1.0.r42.g9defb5b

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"
    git submodule update --init --recursive
}

build() {
    cd "$pkgname"
    env CARGO_INCREMENTAL=0 cargo build --release --locked
}

check() {
    cd "$pkgname"
    test -f target/release/surfer
    # Tests are currently broken.
    # env CARGO_INCREMENTAL=0 cargo test --release
}

package() {
    cd "$pkgname"

    mkdir -p "$pkgdir/usr"
    env CARGO_INCREMENTAL=0 cargo install --path . --root "$pkgdir/usr" --locked

    # desktop-file-install -m 644 --dir "$pkgdir/usr/share/applications/" "assets/Surfer.desktop"
    install -Dm644 "./LICENSE-EUPL-1.2.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
