# Contributor: dorkster <jajdorkster@gmail.com>

pkgname=flare-engine-git
pkgver=20141113
pkgrel=1
pkgdesc="Free/Libre Action Roleplaying Engine - Git version"
url="http://www.flarerpg.org/"
license=('GPL3' 'CC-BY-SA-3.0')
arch=('i686' 'x86_64')
makedepends=('git>=1.7.10-1' 'cmake')
depends=('sdl2_image' 'sdl2_mixer' 'sdl2_ttf' 'hicolor-icon-theme' 'python')
conflicts=('flare-engine')
replaces=('flare-engine')
install=flare-engine-git.install
source=('flare-engine-git.install')
sha1sums=('f1399479b57f5948fb07b188c7599c1f04d2989b')

_gitroot="git://github.com/clintbellanger/"
_gitname="flare-engine"
_repo="flare-engine"

build() {
	cd $srcdir
	msg "Connecting to the GIT server..."

	if [[ -d $srcdir/$_repo ]] ; then
		msg "Updating flare-game"
		cd $_repo
		msg "Removing build files..."
		git clean -dfx
		msg "Updating..."
		git pull --no-tags
		msg "Updating flare"
	else
		msg "Cloning..."
		git clone $_gitroot$_repo --depth 1 --single-branch

		msg "Clone done."
	fi

	cd $srcdir/$_repo
	msg "Starting compile..."
	msg "Creating and moving to build directory..."
	mkdir build
	cd build
	msg "Running cmake..."
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DBINDIR=bin -DDATADIR=share/flare
	msg "Compiling..."
	make
}

package() {
	cd $srcdir/$_repo
	msg "Installing..."
	cd build
	make install DESTDIR=$pkgdir

    # HACK: this file is essentially empty and conflicts with the same file in flare-game
    rm -vf $pkgdir/usr/share/flare/mods/mods.txt
}
