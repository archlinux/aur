# Maintainer: Berke Oruc <berke3oruc@gmail.com>
# Contributor: Berke Oruc <berke3oruc@gmail.com>

pkgname=animinal-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Netflix-style TUI anime client for Linux — powered by AniList and mpv"
arch=('x86_64' 'aarch64')
url="https://github.com/berkeoruc/animinal"
license=('MIT')
depends=(
    'glibc'
    'gcc-libs'
    'mpv'
)
makedepends=('cargo' 'git')
optdepends=(
    'noto-fonts-cjk: CJK subtitle rendering'
    'yt-dlp: additional streaming sources'
)
provides=('animinal')
conflicts=('animinal')
source=("$pkgname::git+https://github.com/berkeoruc/animinal.git")
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
    install -Dm755 "target/release/animinal" "$pkgdir/usr/bin/animinal"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/animinal/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/animinal/README.md"
}
