# Maintainer: éclairevoyant
# Contributor: Klaus Alexander Seistrup <klaus at seistrup dot dk>

pkgname=nimdow
pkgver=0.7.36
pkgrel=1
pkgdesc='Tiling window manager written in Nim'
arch=(x86_64)
url="https://github.com/avahe-kellenberger/$pkgname"
license=(GPL2)
depends=(glibc)
makedepends=(choosenim git)
source=("git+$url.git#commit=7233c0f79b6e5cf1afecffac01a841ba1a7de594")
b2sums=('SKIP')

_setup() {
	_nimble_dir="$srcdir/nimbleDir"
	_path="$_nimble_dir/bin:$PATH"
	cd $pkgname
}

prepare() {
	_setup

	CHOOSENIM_NO_ANALYTICS=1 choosenim stable --nimbleDir="$_nimble_dir"
	PATH="$_path" nimble refresh -l
	PATH="$_path" nimble install -d -l
}

build() {
	_setup

	PATH="$_path" nimble install -l --verbose \
		--passNim:--passC:"\"$CFLAGS\"" --passNim:--passL:"\"$LDFLAGS\""
}

package() {
	cd $pkgname
	install -vDm0755 $pkgname            -t "$pkgdir/usr/bin/"
	install -vDm0644 doc/$pkgname.1      -t "$pkgdir/usr/share/man/man1/"
	install -vDm0644 config.default.toml -t "$pkgdir/usr/share/$pkgname/"
	install -vDm0644 $pkgname.desktop    -t "$pkgdir/usr/share/xsessions/"
	install -vDm0644 README.md           -t "$pkgdir/usr/share/doc/$pkgname/"
}
