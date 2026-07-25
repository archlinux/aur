# Maintainer: Berke Oruc <berke3oruc@gmail.com>
# Contributor: Berke Oruc <berke3oruc@gmail.com>

pkgname=dateminal-git
pkgver=0.1.0
pkgrel=1
pkgdesc="A breathtaking TUI calendar and scheduling application for the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/berkeoruc/dateminal"
license=('MIT')
depends=(
    'glibc'
    'gcc-libs'
    'sqlite'
)
makedepends=('cargo' 'git')
provides=('dateminal')
conflicts=('dateminal')
source=("$pkgname::git+https://github.com/berkeoruc/dateminal.git")
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
    install -Dm755 "target/release/dateminal" "$pkgdir/usr/bin/dateminal"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/dateminal/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/dateminal/README.md"
}
