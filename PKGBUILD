# Maintainer: Valentin Lukyanets <valikluks95@gmail.com>
pkgname=sppy
pkgver=0.3.1
pkgrel=1
pkgdesc="Watch videos in sync with friends: a Syncplay alternative (mpv or VLC)"
arch=('x86_64')
url="https://github.com/vlukyanets/sppy"
license=('MIT OR Apache-2.0')
depends=(
  'gcc-libs'
  'glibc'
  'libglvnd'
  'libxkbcommon'
  'wayland'
  'libx11'
  'libxcursor'
  'libxi'
  'libxrandr'
)
makedepends=('cargo')
optdepends=(
  'mpv: the default player'
  'vlc: the other supported player'
  'yt-dlp: web links (YouTube and other sites) in the playlist'
  'xdg-desktop-portal: the folder picker in Settings'
)
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  'sppy.desktop')
sha256sums=('cb3853de33912943168245bba1d79029a57535b44d21c3f90880359529e0d451'
            '2f47059f4e4b3ffd331f13adcaadf07a0b1eeab53c488d2e964e12154c252326')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="$RUSTFLAGS --remap-path-prefix=$srcdir=/"
  cargo build --frozen --profile dist -p sppy-app
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/dist/sppy -t "$pkgdir/usr/bin/"
  install -Dm644 "$srcdir/sppy.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 assets/sppy.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE-MIT LICENSE-APACHE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
