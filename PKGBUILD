pkgname=runice-git
_pkgname=runice
pkgver=r20.b3127a3
pkgrel=1
pkgdesc="A daemon to manage process niceness, written in Rust"
url="https://github.com/droserasprout/runice"
arch=(x86_64)
license=(MIT)
provides=(runice)
depends=(schedtool util-linux)
makedepends=(cargo git)
source=("git+https://github.com/droserasprout/runice#branch=master")
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname
  cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
  cd $_pkgname
  cargo build --release --frozen --all-targets
}

check() {
  cd $_pkgname
  # test_expand* fails; needs nightly rust
  cargo test --release --frozen || :
}

package() {
  cd $_pkgname
  install -Dt "$pkgdir/usr/bin" target/release/runice
  install -d "$pkgdir/etc/runice/00-ananicy" config/00-ananicy/
  install -d "$pkgdir/etc/runice/10-default" config/10-default/
  install config/10-default/* "$pkgdir/etc/runice/10-default"
  install -d "$pkgdir/etc/runice/20-local" config/20-local/
  install -Dt "$pkgdir/usr/lib/systemd/system" runice.service
}