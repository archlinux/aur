# Maintainer: John Crenshaw <john@vintagetechie.com>
pkgname=cosmic-ext-applet-tempest
pkgver=2.9.2
pkgrel=1
pkgdesc="Weather applet for COSMIC Desktop with automatic location detection"
arch=('x86_64')
url="https://gitlab.com/vintagetechie/cosmic-ext-applet-tempest"
license=('GPL-3.0-only')
depends=('wayland' 'libxkbcommon' 'openssl')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('f28a53f6ef81017c3199ee06aa7a2dc6a19c88d8407cd49124488f1c54272368')
options=(!lto)

_srcdir="$pkgname-v$pkgver"

prepare() {
    cd "$_srcdir"
    export RUSTUP_TOOLCHAIN=stable
    # Cargo.lock pins the two git deps (libcosmic, cosmic-randr-shell) to exact revs.
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_srcdir"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$_srcdir"
    local appid="com.vintagetechie.CosmicExtAppletTempest"

    install -Dm0755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
    install -Dm0644 "res/$appid.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm0644 "res/$appid.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"
    install -Dm0644 "res/icons/hicolor/scalable/apps/$appid.svg" \
        -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
    install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
