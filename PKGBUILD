# Maintainer: Adam Perkowski <adas1per@protonmail.com>
pkgname=himalaya-git
_pkgname=himalaya
pkgver=r713.681837b
pkgrel=1
pkgdesc="CLI to manage emails, written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/pimalaya/himalaya"
license=('MIT')
depends=('glibc' 'gcc-libs' 'openssl')
makedepends=('rustup' 'git')
optdepends=('notmuch-runtime: notmuch backend through cargo features' 'gpgme: encryption')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}")
md5sums=(SKIP)

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    
    cd "$_pkgname"

    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "$_pkgname"

    cargo build --frozen --release --features default
}

package() {
   cd "$_pkgname"
   
   install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
}

