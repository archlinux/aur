# Maintainer: Berke Oruc <berke3oruc@gmail.com>
# Contributor: Berke Oruc <berke3oruc@gmail.com>
# Arch: x86_64 aarch64

pkgname=fileminal-git
pkgver=0.1.0
pkgrel=2
pkgdesc="A brutally fast, visually stunning TUI file explorer for Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/berkeoruc/fileminal"
license=('MIT')
depends=(
    'glibc'
    'gcc-libs'
    'zlib'
    'oniguruma'
)
makedepends=('cargo' 'git')
optdepends=(
    'xdg-utils: open files with default applications'
    'sixel-support: image preview with sixel terminals'
)
provides=('fileminal')
conflicts=('fileminal')
source=("$pkgname::git+https://github.com/berkeoruc/fileminal.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags --always 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || echo "$pkgver"
}

prepare() {
    cd "$srcdir/$pkgname"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname"
    export RUSTFLAGS="-C target-cpu=native"
    export CARGO_PROFILE_RELEASE_LTO=fat
    export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
    export CARGO_PROFILE_RELEASE_PANIC=abort
    export CARGO_PROFILE_RELEASE_STRIP=symbols
    export CARGO_PROFILE_RELEASE_DEBUG=line-tables-only
    cargo build --frozen --release
}

check() {
    cd "$srcdir/$pkgname"
    cargo test --frozen --release
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "target/release/fileminal" "$pkgdir/usr/bin/fileminal"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/fileminal/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/fileminal/README.md"
}
