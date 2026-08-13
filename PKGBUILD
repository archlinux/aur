# Maintainer: Joseph Vigil <joeyvigil109329@gmail.com>

_repo=https://github.com/joeyvigil/cfish

pkgname=cfish-git
_pkgname=cfish
pkgver=1.0.r0.g0000000
pkgrel=1
pkgdesc='A terminal aquarium screensaver: colorful fish swimming across your terminal, leaving bubble trails (git)'
arch=('x86_64' 'aarch64')
url="$_repo"
license=('MIT')
depends=('ncurses')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+$_repo.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	# 1.0.r17.gdeadbee -- falls back to 0.0 before the first tag exists
	git describe --long --tags --abbrev=7 2>/dev/null \
		| sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
		|| printf '0.0.r%s.g%s' \
			"$(git rev-list --count HEAD)" \
			"$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$_pkgname"
	make
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir" PREFIX=/usr install
}
