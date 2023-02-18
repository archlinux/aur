# Maintainer: Grzegorz Koperwas <admin@grzegorzkoperwas.site>
pkgname=swww-git
pkgver=0.7.2
pkgrel=1
pkgdesc="Efficient animated wallpaper daemon for wayland, controlled at runtime."
arch=('x86_64' 'aarch64')
url="https://github.com/Horus645/swww"
license=('GPL')
depends=('gcc-libs' 'lz4' 'libxkbcommon')
makedepends=('cargo' 'scdoc')
provides=('swww')
conflicts=('swww')
options=(!lto)
source=("swww::git+https://github.com/Horus645/swww.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/swww"
    git describe --tags --match 'v*' | sed 's/^v//;s/-/./g'
}

prepare() {
    cd "$srcdir/swww"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/swww"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --release 
  # manpages
  ./doc/gen.sh
  for page in $(ls ./doc/generated/*.1)
  do 
    gzip -f "$page"
  done
}

package() {
  cd "$srcdir/swww"

  install -Dm755 "target/release/swww" "$pkgdir/usr/bin/swww"
  install -Dm755 "target/release/swww-daemon" "$pkgdir/usr/bin/swww-daemon"
  install -Dm644 "completions/swww.bash" "$pkgdir/usr/share/bash-completion/completions/swww"
  install -Dm644 "completions/swww.fish" "$pkgdir/usr/share/fish/vendor_completions.d/swww.fish"
  install -Dm644 "completions/_swww" "$pkgdir/usr/share/zsh/site-functions/_swww"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

  # manpages
  cd ./doc/generated 
  for page in $(ls *.1.gz)
  do 
    install -Dm644 "$page" "$pkgdir/usr/share/man/man1/$page"
  done
}

