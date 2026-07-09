# Maintainer: John Crenshaw <john@vintagetechie.com>
pkgname=placer
pkgver=0.1.0_beta.1
pkgrel=1
pkgdesc="Automatically place application windows on their assigned COSMIC workspace"
arch=('x86_64')
url="https://gitlab.com/vintagetechie/placer"
license=('GPL-3.0-only')
depends=('wayland' 'libxkbcommon')
makedepends=('cargo' 'git')
# The release tag (v0.1.0-beta.1, hyphen) and pkgver (0.1.0_beta.1, underscore -- AUR
# forbids hyphens in pkgver) diverge for prerelease versions, so the tag is tracked
# separately here rather than derived from $pkgver.
_tag=v0.1.0-beta.1
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$_tag/$pkgname-$_tag.tar.gz")
sha256sums=('20631f184c29c199bf08c0f47ebf3e45ea42dd8111ba58de49a663d28fc2eca4')
options=(!lto)

_srcdir="$pkgname-$_tag"

prepare() {
    cd "$_srcdir"
    export RUSTUP_TOOLCHAIN=stable
    # Cargo.lock pins the libcosmic/cosmic-config git deps to exact revs.
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_srcdir"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # BOTH binaries: the GUI (placer) and the headless daemon (placerd).
    cargo build --frozen --release -p placer -p placerd
}

package() {
    cd "$_srcdir"
    local appid="dev.jcrenshaw.Placer"

    install -Dm0755 "target/release/placer"  -t "$pkgdir/usr/bin/"
    install -Dm0755 "target/release/placerd" -t "$pkgdir/usr/bin/"
    install -Dm0644 resources/placerd.service "$pkgdir/usr/lib/systemd/user/placerd.service"
    install -Dm0644 "resources/$appid.desktop"      -t "$pkgdir/usr/share/applications/"
    install -Dm0644 "resources/$appid.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"
    install -Dm0644 resources/icons/hicolor/scalable/apps/icon.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/$appid.svg"
    install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
