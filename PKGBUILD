#Maintainer: Gabriel Margiani (gamag) <gabriel _strange_curved_character_ margiani · ch>
#Contributor: matthiaskrgr <matthias · krueger _strange_curved_character_ famsike · de>

pkgname=widelands-bzr
pkgver=19.r8984
pkgrel=1
pkgdesc="A realtime strategy game with emphasis on economy and transport - development version"
arch=(i686 x86_64)
license=('GPL2')
depends=('glew' 'sdl2_image' 'boost-libs' 'sdl2_mixer' 'sdl2_ttf')
makedepends=('bzr' 'cmake' 'python'  'boost')
provides=("widelands=$pkgver")
conflicts=('widelands' 'widelands-data')
url="http://wl.widelands.org"
changelog=changelog
source=("changelog")
sha1sums=('SKIP')

# HACK: Use Prepare to make a lightweight checkout, since it is a little faster
# than a full branch, as pacman would do it.  If you have a better solution,
# just tell me.
prepare() {
	cd "$srcdir"

	if test -d "$pkgname/.bzr"; then
		cd "$pkgname"
		msg2 "Updating bzr checkout"
		bzr update
	else 
		# don't use lp: to avoid bzr asking for ssh passphrase to authenticate
		# on launchpad
		msg2 "Making lightweight checkout. This may take some time."
		bzr checkout --lightweight "http://bazaar.launchpad.net/~widelands-dev/widelands/trunk" "$pkgname"
	fi
}

build() {
	cd "$srcdir/$pkgname"

    test -d build/locale || mkdir -p build/locale
    test -e locale || ln -s build/locale

	cd build

	msg2 "Running cmake..."
	# if this failes on an existing build because of an mismatch of src and build cmake files, just delete build and try again.
	cmake .. -DCMAKE_BUILD_TYPE=Release \
		-DOPTION_BUILD_WEBSITE_TOOLS=OFF \
		-DCMAKE_INSTALL_PREFIX=/usr/bin \
		-DWL_INSTALL_DATADIR=/usr/share/widelands \
		-DOPTION_ASAN=OFF
	msg2 "Running make..."
	make
}

package() {
	cd  "$srcdir/$pkgname/build"
	make DESTDIR="$pkgdir" install
}

pkgver() {
	cd "${srcdir}/${pkgname}"

	_build="$(sed -ne "s/.*<release .* version=\"Build \([0-9]\+\)\"\/>/\1/p" debian/widelands.appdata.xml | sort -rn | head -n 1)"
	_rev="$(bzr revno -q)"

	printf "%s.r%s" "${_build}" "${_rev}"
}
