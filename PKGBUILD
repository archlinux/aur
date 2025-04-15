# Contributor: éclairevoyant

pkgname=happyx
pkgver=4.7.4
pkgrel=1
pkgdesc="Macro-oriented asynchronous web-framework written in Nim"
arch=(x86_64)
url="https://github.com/HapticX/$pkgname"
license=(GPL3)
depends=(gcc-libs glibc)
makedepends=(choosenim git)
source=("git+$url.git#commit=6298ad771ed8132ad78372e851f4789a1e34b2c4")
b2sums=('SKIP')

_setup() {
	_nimble_dir="$srcdir/nimbleDir"
	_path="$_nimble_dir/bin:$PATH"
	cd $pkgname
}

prepare() {
	_setup

	# stable nim doesn't support --offline --noRebuild
	CHOOSENIM_NO_ANALYTICS=1 choosenim '#head' --nimbleDir="$_nimble_dir"
	PATH="$_path" nimble refresh -l
	PATH="$_path" nimble install -d -l
}

pkgver() {
	git -C $pkgname describe --tags | sed 's/^v//'
}

build() {
	_setup

	PATH="$_path" nimble install --noRebuild -l --verbose \
		--passNim:--passC:"\"$CFLAGS\"" --passNim:--passL:"\"$LDFLAGS\""
}

package() {
	cd $pkgname
	install -Dm755 $pkgname/hpx -t "$pkgdir/usr/bin/"
	install -dm755 "$pkgdir/usr/lib/nim/$pkgname/"
    cp -r --no-preserve=ownership src/* -t "$pkgdir/usr/lib/nim/$pkgname/"
}
