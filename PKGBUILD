# Maintainer: ChoiWheatley <chltmdgus604 at naver dot com>
pkgname=kunsplash-wallpapers-git
pkgver=0.1.0.r1.gf7e8d64
pkgrel=1
pkgdesc="Unofficial Plasma 6 widget and daemon that sets your wallpaper from Unsplash"
arch=('x86_64' 'aarch64')
url="https://github.com/ChoiWheatley/kunsplash-wallpapers"
license=('MIT')
depends=('glibc' 'libgcc' 'kirigami' 'libplasma' 'plasma-workspace' 'qt6-declarative' 'kconfig' 'libkscreen' 'xdg-user-dirs')
makedepends=('cargo' 'git')
provides=('kunsplash-wallpapers')
conflicts=('kunsplash-wallpapers')
options=('!lto')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --manifest-path daemon/Cargo.toml --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=daemon/target
  make build CARGO="cargo --frozen"
}

check() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=daemon/target
  make test CARGO="cargo --frozen"
}

package() {
  cd "$pkgname"
  make install-daemon install-plasmoid DESTDIR="$pkgdir" PREFIX=/usr \
    UNITDIR=/usr/lib/systemd/user CARGO=true
  mv "$pkgdir/usr/share/licenses/kunsplash-wallpapers" "$pkgdir/usr/share/licenses/$pkgname"
}
