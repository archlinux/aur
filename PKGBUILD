# Maintainer: Pk11 <pk11@outlook.jp>
# Contributor: angelsl

_pkgname='bannertool'
pkgname="$_pkgname-git"
pkgver=r79.51dac92
pkgrel=1
pkgdesc="A tool for creating 3DS banners."
arch=('x86_64')
url="https://github.com/Epicpkmn11/bannertool"
license=('MIT')
makedepends=('git' 'zip')
provides=("$_pkgname")
conflicts=("$_pkgname")

source=("$pkgname::git+${url}"
				"git+https://github.com/Steveice10/buildtools")
sha1sums=('SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$pkgname"
	git submodule init
	git config submodule.buildtools.url "$srcdir/buildtools"
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	install -D "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
	cd output/linux-$CARCH
	install -Dm755 bannertool "$pkgdir/usr/bin/$_pkgname"
}
