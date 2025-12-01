# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Antoine Lubineau <antoine@lubignon.info>

pkgname=fuc-git
_pkgname=fuc
pkgver=1.1.6.r82.gafbea1e
pkgrel=1
pkgdesc="Modern, performance focused unix commands"
arch=('x86_64')
url="https://github.com/SUPERCILEX/fuc"
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo')
checkdepends=('cargo')
provides=('fuc')
conflicts=('fuc')
source=("git+https://github.com/SUPERCILEX/fuc")
sha256sums=('SKIP')

_commands=('cpz' 'rmz')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkgname"
	cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
	# Yeah, right
	export RUSTC_BOOTSTRAP=0
}

build() {
	cd "$_pkgname"
	cargo build "${_commands[@]/#/--package=}" --release --bins --tests
}

check() {
	cd "$_pkgname"
	cargo test "${_commands[@]/#/--package=}" --release
}

package() {
	cd "$_pkgname"
	install -Dm755 \
		"${_commands[@]/#/"target/release/"}" \
		-t "$pkgdir/usr/bin"
}
