# Maintainer: vadim.razorq@gmail.com
# Maintainer: Vadim Manaenko

_pkgname=robonomics
pkgname=${_pkgname}-git
pkgver=1.7.0.r0.g2409420e
pkgrel=1
pkgdesc='Robonomics platform includes a set of open-source packages and infrastructure for Robotics, Smart Cities and Industry 4.0 developers'
arch=('i686' 'x86_64')
url="https://github.com/airalab/robonomics"
license=('APACHE')
#depends=('')
makedepends=('cargo' 'git')
provides=('robonomics')
conflicts=('robonomics')
source=("git+https://github.com/airalab/robonomics.git#tag=v1.7.0")
md5sums=('SKIP')

pkgver() {
    cd $_pkgname
    printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

prepare() {
    cd $_pkgname
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd $_pkgname
    export RUSTUP_TOOLCHAIN=nightly
    export CARGO_TARGET_DIR=target
    cargo +nightly build --frozen --release
}

package() {
    cd $_pkgname
    install -Dm755 "target/release/$_pkgname" \
        -t "$pkgdir/usr/bin"
    install -Dm644 LICEN?E \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
