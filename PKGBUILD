# Maintainer: Stuart Reilly <stu@reilly-family.co.uk>
_pkgname=protonup-rs
pkgname=$_pkgname-git
pkgver=0.5.0.r18.gd3bf27b
pkgrel=1
pkgdesc="CLI program to automate the installation and update of Proton-GE"
arch=('x86_64')
url="https://github.com/auyer/Protonup-rs"
license=('Apache-2.0')
depends=(gcc-libs xz glibc)
makedepends=(cargo git)
provides=()
conflicts=(protonup-rs protonup-rs-bin)
source=($_pkgname::git+https://github.com/auyer/Protonup-rs.git)
sha512sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $_pkgname
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd $_pkgname
	cargo build --frozen --release --all-features
}

check() {
	cd $_pkgname
	cargo test --workspace --frozen --all-features
}

package() {
	cd $_pkgname
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
}
