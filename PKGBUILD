# Maintainer: Jon Gjengset <jon@thesquareplanet.com>
pkgname=curb-git
pkgver=0.1.5.r10.2d9f461
pkgrel=1
pkgdesc="Run a process on a particular subset of the available hardware"
arch=('x86_64')
url="https://github.com/jonhoo/curb"
license=('MIT')
depends=('hwloc')
makedepends=('git' 'cargo' 'hwloc')
source=("$pkgname::git+https://github.com/jonhoo/${pkgname%-git}.git")
sha512sums=('SKIP')
pkgver() {
	cd "$pkgname"

	# get version from Cargo.toml
	local version=$(grep version Cargo.toml | head -n1 | sed 's/.*"\(.*\)"/\1/')
	# add on revision
	printf "%s.r%s.%s" "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"

  env -u CARGO_TARGET_DIR cargo build --release
}

package() {
  cd "$pkgname"

  install -Dm755 "target/release/curb" "$pkgdir/usr/bin/curb"
}
