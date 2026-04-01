# Maintainer: futpib-bot <futpib-bot@users.noreply.github.com>

pkgname=slopd-git
pkgver=r146.8bddbfa
pkgrel=1
pkgdesc="Claude agent session manager daemon"
arch=('x86_64')
url="https://github.com/futpib/slopd"
license=('custom')
depends=()
makedepends=('rust' 'cargo')
provides=('slopd' 'slopctl')
conflicts=('slopd')
source=("git+https://github.com/futpib/slopd.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/slopd"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/slopd"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/slopd"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    CFLAGS+=" -ffat-lto-objects"
    CXXFLAGS+=" -ffat-lto-objects"
    cargo build --frozen --release --workspace
}

package() {
    cd "$srcdir/slopd"
    install -Dm755 "target/release/slopd" "$pkgdir/usr/bin/slopd"
    install -Dm755 "target/release/slopctl" "$pkgdir/usr/bin/slopctl"
    # Install user systemd service with corrected ExecStart path
    sed 's|ExecStart=.*|ExecStart=/usr/bin/slopd|' slopd.service \
        | install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/slopd.service"
}
