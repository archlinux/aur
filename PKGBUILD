# Maintainer: éclairevoyant

pkgname=happyx
pkgver=1.9.0
pkgrel=1
pkgdesc="Macro-oriented asynchronous full-stack web-framework, written in Nim"
arch=(x86_64)
url="https://github.com/HapticX/$pkgname"
license=(GPL3)
depends=(gcc-libs glibc)
makedepends=(choosenim git)
source=("git+$url.git#commit=32d7dc13fa00ff2a7084546eac30347f433c7d69")
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
	install -Dm755 $pkgname/hpx -t "$pkgdir/usr/bin/"
}
