# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=udf-infusion-git
_pkgname=${pkgname%-git}
_reponame=udf_infusion
pkgver=r104.25c3613
pkgrel=2
pkgdesc="MySQL functionality enhancement UDF"
arch=('i686' 'x86_64')
url="https://github.com/infusion/udf_infusion"
license=('GPL2')
depends=('gcc-libs')
makedepends=('mysql')
provides=("$_pkgname")
conflicts=("$_pkgname")
install="$_pkgname.install"
source=("git+https://github.com/infusion/udf_infusion"
        bootstrap.patch)
sha256sums=('SKIP'
            '82a19b98f1338b2c73040e82ca60b0cfcdf1907e0ca4ab20de3d66227027108f')

pkgver() {
	cd "$_reponame"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_reponame"
	patch -Np1 -i "$srcdir/bootstrap.patch"
}

build() {
	cd "$_reponame"
	./configure --prefix=/usr
	make
}

package() {
	cd "$_reponame"
	make DESTDIR="$pkgdir/" install
	install -d "$pkgdir/usr/share/$_pkgname"
	install -m644 load.sql unload.sql "$pkgdir/usr/share/$_pkgname"
}
