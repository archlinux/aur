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
        'ebou-logo.png'
        'ebou.desktop')
sha256sums=('SKIP'
            'b999f94a84c543b4445ff30f6db0535523ca39d4264c4309dd7b564de040a1e3'
            'e08ba919ad4367d5b8b5acd86c0fd1c5df00de6bf12f496ef6f62d7a5715cd14')

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
  install -Dm0755 -t "$pkgdir/usr/share/ebou" "ebou-logo.png"
  install -Dm0755 -t "$pkgdir/usr/share/applications" "ebou.desktop"
  install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/$git_clone_name/target/release/ebou"
}
