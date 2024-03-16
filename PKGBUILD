# Maintainer: galister <galister at librevr dot org>

_pkgname=oscavmgr
pkgname=$_pkgname-git
pkgver=v0.1.0.2.r0.g8ae5130
pkgrel=1
pkgdesc="VRChat OSC avatar tools with built-in VRCFaceTracking relay"
url="https://github.com/galister/oscavmgr"
arch=('x86_64')
license=('MIT')
makedepends=('git' 'cargo')
conflicts=("$_pkgname")
provides=("$_pkgname")
source=("$_pkgname::git+https://github.com/galister/oscavmgr.git")
sha256sums=('SKIP')

# Use debug symbols
export CARGO_PROFILE_RELEASE_DEBUG=2

pkgver() {
	cd "$_pkgname"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkgname"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$_pkgname"
	cargo build --frozen --release --all-features
}

check() {
	cd "$_pkgname"
	cargo test --frozen --all-features
}

package() {
	cd "$_pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
}
