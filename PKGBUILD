# Maintainer: insmtr <insmtr@insmtr.cn>

pkgname=pumpkin-git
pkgver=dev
pkgrel=1
pkgdesc="Empowering everyone to host fast and efficient Minecraft servers"
arch=('x86_64')
url="https://github.com/Pumpkin-MC/Pumpkin"
license=('MIT')
depends=('glibc')
makedepends=('git' 'rust' 'clang')
provides=('pumpkin')
source=("$pkgname::git+https://github.com/Pumpkin-MC/Pumpkin.git")
options=(!debug)
sha256sums=('SKIP')

pkgver() {
    cd $pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $pkgname
    export RUSTFLAGS="$RUSTFLAGS -C target-cpu=native"
    export CFLAGS="${CFLAGS/-flto=auto/}"
    export CXXFLAGS="${CXXFLAGS/-flto=auto/}"
    export LDFLAGS="${LDFLAGS/-flto=auto/}"
    cargo build --release
}

package() {
    cd $pkgname
    install -Dm755 target/release/pumpkin $pkgdir/usr/bin/pumpkin
}
