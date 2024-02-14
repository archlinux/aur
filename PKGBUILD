# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Grzegorz Koperwas <admin@grzegorzkoperwas.site>

pkgname=swww-git
pkgver=0.4.0.r259.g1eecca7
pkgrel=1
pkgdesc='Efficient animated wallpaper daemon for Wayland, controlled at runtime'
#arch=(x86_64)
arch=(x86_64 aarch64)
url=https://github.com/LGFae/swww
license=(GPL-3.0-or-later)
makedepends=(cargo git scdoc)
depends=(libxkbcommon lz4)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=(!lto)
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  RUSTUP_TOOLCHAIN=stable cargo fetch --locked --manifest-path=$pkgname/Cargo.toml --target="$CARCH-unknown-linux-gnu"
}

build() {
  RUSTUP_TOOLCHAIN=stable cargo build --release --manifest-path=$pkgname/Cargo.toml --target-dir=$pkgname/target --all-features

  # Man pages
  $pkgname/doc/gen.sh
}

check() {
  RUSTUP_TOOLCHAIN=stable cargo test --release --manifest-path=$pkgname/Cargo.toml --target-dir=$pkgname/target
}

package() {
  install -Dm755 "$pkgname/target/release/${pkgname%-git}"{,-daemon} -t "$pkgdir/usr/bin"

  install -Dm644 $pkgname/*.md -t "$pkgdir/usr/share/doc/${pkgname%-git}"
  cp -a $pkgname/example_scripts "$pkgdir/usr/share/doc/${pkgname%-git}"

  install -Dm644 $pkgname/doc/generated/*.1 -t "$pkgdir/usr/share/man/man1"

  install -Dm644 $pkgname/completions/_swww -t "$pkgdir/usr/share/zsh/site-functions"
  install -Dm644 $pkgname/completions/swww.bash "$pkgdir/usr/share/bash-completion/completions/swww"
  install -Dm644 $pkgname/completions/swww.fish -t "$pkgdir/usr/share/fish/vendor_completions.d"
}
