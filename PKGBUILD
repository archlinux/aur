# Maintainer: Mahid Sheikh <mahidsheikh@proton.me>
#
# shellcheck disable=all
pkgname=ebou-git
pkgver=0.2.0.742.r24.g241e66e
pkgrel=1
pkgdesc="Mastodon Client Written in Rust!"
arch=(any)
url="https://github.com/terhechte/Ebou"
license=('GPL')
depends=(webkit2gtk-4.1 gtk3 xdotool libsoup gst-libav gst-plugins-base gst-plugins-good)
makedepends=(cargo)
source=('git+https://github.com/terhechte/Ebou.git'
        'ebou.png'
        'ebou.desktop')
sha256sums=('SKIP'
            'b999f94a84c543b4445ff30f6db0535523ca39d4264c4309dd7b564de040a1e3'
            '37c1105bea607aa6e80b32b04a4d80d6a8a10627ed3bd3dfa27bc962d526d5a0')

git_clone_name=Ebou
pkgver() {
  cd "$srcdir/$git_clone_name"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$srcdir/$git_clone_name"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "$srcdir/$git_clone_name"
  cargo build --frozen --release
}

package() { 
  install -Dm0755 -t "$pkgdir/usr/share/icons/hicolor/192x192/apps" "ebou.png"
  install -Dm0755 -t "$pkgdir/usr/share/applications" "ebou.desktop"
  install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/$git_clone_name/target/release/ebou"
}
