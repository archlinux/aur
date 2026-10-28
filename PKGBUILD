# Maintainer: Remco Stoeten
pkgname=kiekje
pkgver=0.1.0alpha9
pkgrel=1
_tag=0.1.0-alpha.9
pkgdesc='Capture, mark up and keep screenshots'
arch=('x86_64' 'aarch64')
url='https://github.com/remcostoeten/kiekje'
license=('MIT' 'OFL-1.1')
depends=('gtk4' 'gtk4-layer-shell' 'wayland' 'glib2' 'cairo' 'pango' 'gcc-libs' 'glibc')
makedepends=('cargo')
optdepends=(
    'xdg-desktop-portal: capture and global shortcuts through the portal'
    'gst-plugins-base: capture sound'
    'gst-plugins-good: capture sound through PulseAudio, and screen recording'
    'gst-plugin-pipewire: screen recording'
)
options=('!lto')
source=("$pkgname-$_tag.tar.gz::$url/archive/refs/tags/v$_tag.tar.gz")
sha256sums=('6d3aaf67ceec1346bf83995433c44ea408bb0997117850fe0985064b2ad6cbbd')

prepare() {
    cd "$pkgname-$_tag"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$_tag"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$_tag"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release
}

package() {
    cd "$pkgname-$_tag"
    DESTDIR="$pkgdir" PREFIX=/usr packaging/install.sh target/release/kiekje
}
