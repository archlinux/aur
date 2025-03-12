# Maintainer: Diego Frias <styx5242@gmail.com>
# Maintainer: Absobel <imkonnu@gmail.com>

pkgname=projectable-git
_pkgname=projectable
_bin=prj
pkgver=1.3.0.9.gcd26095
pkgrel=1
pkgdesc="A TUI file manager built for projects."
arch=('x86_64')
url="https://github.com/dzfrias/projectable"
_git="https://github.com/dzfrias/projectable.git"
license=('MIT')
depends=('libgit2' 'libssh2' 'openssl' 'gcc-libs' 'glibc')
makedepends=('git' 'cargo')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${_git}")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --tags | sed 's/-/./g'
}

prepare() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export LIBSSH2_SYS_USE_PKG_CONFIG=1
    cargo update
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

# The tests are way too long on top of a long build time
#check() {
#    cd "$_pkgname"
#    export RUSTUP_TOOLCHAIN=stable
#    cargo test --frozen --all-features
#}

package() {
    cd "$_pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
