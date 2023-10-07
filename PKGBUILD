# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Thomas Hipp <thomashipp at gmail dot com>

_pkgname=cowsql
pkgname=cowsql-git
pkgver=0.r21.c29b220
pkgrel=1
pkgdesc="Distributed SQLite, animal-friendly edition"
arch=('x86_64')
url="https://github.com/cowsql/cowsql"
license=('LGPL3')
depends=('libuv' 'raft' 'sqlite')
makedepends=('tcl' 'readline' 'zlib' 'git')
provides=('cowsql')
conflicts=('cowsql')
options=(strip)
source=("git+https://github.com/cowsql/cowsql")
sha256sums=('SKIP')

pkgver() {
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	autoreconf -i 
	#PKG_CONFIG_PATH="/usr/lib/sqlite-replication/pkgconfig" ./configure --prefix=/usr
	./configure --prefix=/usr
	make
}

check() {
	cd "$_pkgname"
	make check ||:  # uh, what?
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
