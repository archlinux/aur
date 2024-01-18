# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=plutolang-git
pkgver=0.8.1.r5.ge802902
pkgrel=1
pkgdesc='A superset of Lua 5.4 with unique features, optimizations, and improvements'
arch=(x86_64)
url='https://github.com/PlutoLang/Pluto'
license=(MIT)
depends=(gcc-libs
         glibc
         readline libreadline.so)
makedepends=(git)
conflicts=(pluto
           ${pkgname%-git})
provides=(${pkgname%-git}=$pkgver)
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags --abbrev=7 HEAD |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build () {
	cd "$pkgname/src"
	make MYCFLAGS="$CXXFLAGS -fPIC" MYLDFLAGS="$LDFLAGS" linux-readline
}

package () {
	cd "$pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" src/{pluto,plutoc}
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
