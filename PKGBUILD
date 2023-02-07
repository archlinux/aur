# Maintainer: Harish Rajagopal <harish dot rajagopals at gmail dot com>

_pkgname=regreet
pkgname="greetd-$_pkgname-git"
pkgver=r75.b0b21d1
pkgrel=1
pkgdesc="Clean and customizable greeter for greetd"
arch=('x86_64')
url="https://github.com/rharish101/ReGreet"
license=(GPL3)
install="$pkgname.install"
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')
makedepends=(cargo git)
depends=(greetd gtk4)

pkgver() {
    cd "$_pkgname"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_pkgname"

    export RUSTUP_TOOLCHAIN=stable
    export GREETD_CONFIG_DIR="/etc/greetd"
    export CACHE_DIR="/var/cache/${_pkgname}"
    export LOG_DIR="/var/log/${_pkgname}"
    export SESSION_DIRS="/usr/share/xsessions:/usr/share/wayland-sessions"
    cargo build --frozen --release --target-dir=target
}

package() {
    cd "$_pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
    install -Dm0644 -t "$pkgdir/usr/share/$_pkgname/" "$_pkgname.sample.toml"
    install -Dm0644 "systemd-tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
}
