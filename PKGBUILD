# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Grzegorz Koperwas <admin@grzegorzkoperwas.site>

pkgname=awww-git
pkgver=0.11.2.r82.gcb3be36
pkgrel=1
pkgdesc='Efficient animated wallpaper daemon for Wayland, controlled at runtime'
#arch=(x86_64)
arch=(x86_64 aarch64)
url=https://codeberg.org/LGFae/awww
license=(GPL-3.0-or-later)
makedepends=(cargo dav1d git scdoc wayland wayland-protocols)
depends=(libxkbcommon lz4)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=(swww)
options=(!lto)
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname

  export RUSTUP_TOOLCHAIN=stable
  cargo update # Only in a VCS package build
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgname

  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features

  # Man pages
  ./doc/gen.sh
}

check() {
  cd $pkgname

  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  install -Dm755 "$pkgname/target/release/${pkgname%-git}"{,-daemon} -t "$pkgdir/usr/bin"

  install -Dm644 $pkgname/completions/_awww -t "$pkgdir/usr/share/zsh/site-functions"
  install -Dm644 $pkgname/completions/awww.bash "$pkgdir/usr/share/bash-completion/completions/awww"
  install -Dm644 $pkgname/completions/awww.elv "$pkgdir/usr/share/elvish/lib/awww.elv"
  install -Dm644 $pkgname/completions/awww.fish -t "$pkgdir/usr/share/fish/vendor_completions.d"

  install -Dm644 $pkgname/*.md -t "$pkgdir/usr/share/doc/${pkgname%-git}"
  cp -a $pkgname/example_scripts "$pkgdir/usr/share/doc/${pkgname%-git}"
  install -Dm644 $pkgname/doc/generated/*.1 -t "$pkgdir/usr/share/man/man1"
}
