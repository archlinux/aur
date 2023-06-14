# Maintainer: Polarian <polarian@polarian.dev>
# Co-maintainer: Lemon <lemon@lemonsh.moe>

_upstream_name=uberbot
pkgname="irc-uberbot-git"
pkgver="0.3.r36.g8f4e3f7"
pkgrel=2
pkgdesc="General purpose IRC bot developed by Lemon.sh"
arch=("x86_64")
url="https://git.lemonsh.moe/lemon/uberbot"
license=('unknown')
backup=('etc/config/uberbot.toml')
depends=('gcc-libs')
makedepends=("cargo" "git")
# See issue: https://github.com/briansmith/ring/issues/1444
options=('!lto')
source=("git+https://git.lemonsh.moe/lemon/$_upstream_name"
        "uberbot.service"
        "uberbot.tmpfiles"
        "uberbot.sysusers"
        "config.toml")
sha256sums=('SKIP'
            '49df7d0318b91ce187679fc18ba86697fb4dadcfb3497b57644ff80d35362e9b'
            'e11423155f6fae7c66684b8c87900d0a301ed9d2899286ded993cfaeae063675'
            '1f2d0df6a6c1e0d248c60807635b4f68130f5dae1413d236ceef75ace559d742'
            '1c498cccec8ed472a53aff0fd02eb73e3128847096547c16ffc75fcc705d9fdf')

pkgver() {
    cd "$_upstream_name"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$_upstream_name"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$_upstream_name"
    cargo build --frozen --release --all-features
}

package() {
    install -Dm755 "$_upstream_name/target/release/$_upstream_name" "$pkgdir/usr/bin/$_upstream_name"
    install -Dm644 "$_upstream_name.service" "$pkgdir/usr/lib/systemd/system/$_upstream_name.service"
    install -Dm644 "$_upstream_name.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$_upstream_name.conf"
    install -Dm644 "$_upstream_name.sysusers" "$pkgdir/usr/lib/sysusers.d/$_upstream_name.conf"
    install -Dm644 "config.toml" "$pkgdir/etc/uberbot/config.toml" 
}
