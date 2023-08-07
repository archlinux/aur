# Maintainer: éclairevoyant

_pkgname=happyx
pkgname="$_pkgname-git"
pkgver=1.12.0.r36.7cdbd2d
pkgrel=1
pkgdesc="Macro-oriented asynchronous full-stack web-framework, written in Nim"
arch=(x86_64)
url="https://github.com/HapticX/$_pkgname"
license=(GPL3)
depends=(gcc-libs glibc)
makedepends=(choosenim git)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
b2sums=('SKIP')

_setup() {
	_nimble_dir="$srcdir/nimbleDir"
	_path="$_nimble_dir/bin:$PATH"
	cd $_pkgname
}

prepare() {
	_setup

	CHOOSENIM_NO_ANALYTICS=1 choosenim stable --nimbleDir="$_nimble_dir"
	PATH="$_path" nimble refresh -l
	PATH="$_path" nimble install -d -l
}

pkgver() {
	git -C $_pkgname describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	_setup

	PATH="$_path" nimble install -l --verbose --passNim:--passC:"\"$CFLAGS\"" --passNim:--passL:"\"$LDFLAGS\""
}

package() {
	install -Dm755 $_pkgname/happyx/hpx -t "$pkgdir/usr/bin/"
}
