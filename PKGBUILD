# $Id$
# Maintainer: Joey Pabalinas <joeypabalinas@gmail.com>

pkgname=myrrdin-mc-git
_pkgname=${pkgname%-*}
pkgver=0.3.1.r28.g38727e953df2c11f56
pkgrel=2
pkgdesc='The Myrddin Compiler - development branch'
url='http://myrlang.org/'
arch=('i686' 'x86_64')
license=('MIT')
options=('staticlibs')
depends=('glibc')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/oridb/mc")
provides=('myrddin')
conflicts=('myrddin')
sha256sums=('SKIP')
options=('zipman')

pkgver() {
	cd "$srcdir/$_pkgname"
	_tag=$(git tag --sort=v:refname | sed -n '$p')
	printf '%s.r%s.g%s' "${_tag#r}" "$(git rev-list "$_tag"..HEAD --count)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	./configure --prefix=/usr
	make bootstrap
	make
}

check() {
	cd "$srcdir/$_pkgname"
	make check
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir" install
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
