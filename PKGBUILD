# Maintainer: Adam Nielsen <malvineous@shikadi.net>

_pkgname=libgamecommon
pkgname=${_pkgname}-git
pkgver=20120611
pkgrel=1
pkgdesc="Common routines used by most Camoto libraries"
arch=('i686' 'x86_64')
url="http://www.shikadi.net/camoto"
license=('GPL3')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('boost')
makedepends=('git' 'autoconf' 'automake' 'pkgconfig')
options=()
_gitname=${_pkgname}
_gitroot="git://github.com/Malvineous/${_gitname}"
source=()
md5sums=()

build() {
	cd "${srcdir}"

	if [ "$NOEXTRACT" -eq 0 ]; then
		if [ -d "$_gitname" ]; then
			cd "$_gitname"

			msg "Cleaning up from previous build."
			git clean -X -f

			msg "Reverting local changes to source tree..."
			git reset --hard

			msg "Updating from GitHub server..."
			git pull origin
			msg "The local files are updated."
		else
			msg "Downloading from GitHub server..."
			git clone --depth=1 -- "$_gitroot" "$_gitname"
			cd "$_gitname"
		fi
	else
		warning "Skipping git clean/pull          -- using existing src/ tree"
		cd "$_gitname"
	fi

	msg "Configuring build environment..."
	./autogen.sh
	./configure --prefix="/usr"

	msg "Beginning compile..."
	make ${MAKEFLAGS}
}

check() {
	cd "$srcdir/$_gitname"
	make ${MAKEFLAGS} check
}

package() {
	cd "$srcdir/$_gitname"
	make install DESTDIR="$pkgdir"
}
