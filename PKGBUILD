pkgname=uutils-glob-git
_pkgname=uutils-glob
pkgver=0.1.0.4.g7436af3
pkgrel=1
pkgdesc="uutils cp, ln, mv and rm that expand their own file name patterns"
arch=('x86_64' 'i686')
url="https://github.com/quininer/uutils-glob"
license=('MIT')
depends=('cargo')
makedepends=('cargo')
optdepends=()
provides=('uutils-glob')
conflicts=('uutils-glob')
source=($pkgname::git+https://github.com/quininer/uutils-glob)
sha256sums=('SKIP')

pkgver() {
	cd $pkgname
	echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD).g$(git describe --always)
}

build() {
	cd $pkgname
	env CARGO_INCREMENTAL=0 cargo build --release
}

package() {
	cd $pkgname

	install -D -m755 "$srcdir/$pkgname/target/release/uutils-glob" "$pkgdir/usr/bin/uutils-glob"

	local util
	for util in cp ln mv rm; do
		ln -s "$_pkgname" "$pkgdir/usr/bin/$util-glob"
	done
}
