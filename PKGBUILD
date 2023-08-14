# Maintainer: oldNo.7 <oldNo.7@archlinux.org>

_pkgname=gross
pkgname=${_pkgname}-git
pkgver=r28.b8d2b25
pkgrel=1
pkgdesc='This is a (simple) bundled collection of JSON generators that should be consumed by Eww'
arch=('x86_64')
url="https://github.com/fufexan/gross"
license=('MIT')
makedepends=('cargo' 'git')
provides=('gross')
conflicts=('gross')
source=("git+https://github.com/fufexan/gross.git")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"

	gross_v=$(
		set -o pipefail
		git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
	echo "$gross_v"
}

prepare() {
	cd "$_pkgname"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$_pkgname"
	cargo build --release
}

package() {
	cd "$_pkgname"
	install -Dm755 "target/release/$_pkgname" \
		-t "$pkgdir/usr/bin"
}
