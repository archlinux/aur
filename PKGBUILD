# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor Will Price <will.price94+aur@gmail.com>

pkgname=0verkill-git
pkgver=r149.cfcb3fd
pkgrel=1
pkgdesc="Bloody 2D action deathmatch-like game in ASCII-ART"
arch=('i686' 'x86_64')
url="https://github.com/hackndev/0verkill"
license=('GPL2')
depends=('xorgproto' 'libx11' 'libxpm')
makedepends=('git')
provides=('0verkill')
source=('git+https://github.com/patlefort/0verkill.git')
sha256sums=('SKIP')

_name='0verkill'

pkgver() {
	cd "$_name"
	( set -o pipefail
	  git describe --abbrev=7 --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

prepare() {
	cd "$_name"
	autoupdate
	autoreconf
}

build() {
	cd "$_name"
	./configure --prefix=/usr --with-x
	make
}

package() {
	cd "$_name"
	make DESTDIR="$pkgdir" install
	install -Dpm644 'doc/COPYING' -t "${pkgdir}/usr/share/licenses/${_name}/"
}
