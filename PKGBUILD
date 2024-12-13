# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Grzegorz Koperwas <admin@grzegorzkoperwas.site>

pkgname=swww-git
pkgver=v0.9.5.r178.g004dfd8
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
  git -C $pkgname describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd $pkgname
  cargo update
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cd $pkgname
  cargo build --frozen --release --all-features

  # Man pages
  doc/gen.sh
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  cd $pkgname
  cargo test --frozen --all-features
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
