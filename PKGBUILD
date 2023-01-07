# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>

_pkgname=torch7
pkgname="$_pkgname-git"
pkgver=r1337.dde9e56
pkgrel=1
pkgdesc='LuaJIT-based scientific computing framework'
arch=('x86_64' 'i686')
url='http://torch.ch'
license=('custom')
depends=('blas' 'lapack' 'luajit' 'torch7-cwrap-git' 'torch7-paths-git')
makedepends=('cmake' 'git')
optdepends=('torch7-trepl-git: Interactive REPL shell')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/torch/$_pkgname")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $_pkgname
	cmake . \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DLUADIR=/usr/share/lua/5.1 \
		-DLIBDIR=/usr/lib/lua/5.1 \
		-DLUA_BINDIR=/usr/bin \
		-DLUA_INCDIR=/usr/include/luajit-2.1 \
		-DLUA_LIBDIR=/usr/lib \
		-DLUALIB=/usr/lib/libluajit-5.1.so \
		-DLUA=/usr/bin/luajit
	make
}

package () {
	cd $_pkgname
	make DESTDIR="$pkgdir" install
	install -Dm644 COPYRIGHT.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
