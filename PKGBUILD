pkgname=timetrackrs-git
pkgver=0.1.0.r6.gd33a51a
pkgrel=3
pkgdesc="automatically track your pc usage with custom data processing. inspired by arbtt."
arch=(x86_64)
license=('AGPL')
depends=(libxss)
makedepends=(git cargo nodejs libxss)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
url="https://github.com/phiresky/timetrackrs"
source=('timetrackrs::git+https://github.com/phiresky/timetrackrs.git')
md5sums=('SKIP')
prepare() {
    cd "$srcdir/${pkgname%-git}"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
    cd "$srcdir/${pkgname%-git}"
    pushd frontend
    yarn="$(echo .yarn/releases/yarn-*.cjs)"
    $yarn install --immutable
    $yarn build
    popd
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    ./update-schemas.sh
    cargo build --frozen --release
}
package() {
    cd "$srcdir/${pkgname%-git}"
    find target/release \
        -maxdepth 1 \
        -executable \
        -type f \
        -exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +
    install -Dm0644 -t "$pkgdir/usr/lib/systemd/user/" timetrackrs.service
}
