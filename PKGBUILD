# Maintainer: éclairevoyant

pkgname=happyx
pkgver=2.11.6
pkgrel=1
pkgdesc="Macro-oriented asynchronous full-stack web-framework, written in Nim"
arch=(x86_64)
url="https://github.com/HapticX/$pkgname"
license=(GPL3)
depends=(gcc-libs glibc)
makedepends=(choosenim git)
source=("git+$url.git#commit=9722ab55a36be0db80feb7f61a96405951d829bd")
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

build() {
	_setup

	PATH="$_path" nimble install --offline --noRebuild -l --verbose \
		--passNim:--passC:"\"$CFLAGS\"" --passNim:--passL:"\"$LDFLAGS\""
}

package() {
	cd $pkgname
	install -Dm755 $pkgname/hpx -t "$pkgdir/usr/bin/"
	install -dm755 "$pkgdir/usr/lib/nim/$pkgname/"
    cp -r --no-preserve=ownership src/* -t "$pkgdir/usr/lib/nim/$pkgname/"
}
