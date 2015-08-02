# Contributor: dorkster <jajdorkster@gmail.com>

pkgname=flare-game-git
pkgver=20141113
pkgrel=1
pkgdesc="Fantasy action RPG using the FLARE engine - Git version"
url="http://www.flarerpg.org/"
license=('GPL3' 'CC-BY-SA-3.0')
arch=('i686' 'x86_64')
makedepends=('git>=1.7.10-1' 'cmake')
depends=('flare-engine-git')
conflicts=('flare-game')
replaces=('flare-game')

_gitroot="git://github.com/clintbellanger/"
_gitname="flare-game"
_repo="flare-game"

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
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DDATADIR=share/flare
	msg "Compiling..."
	make
}

package() {
	cd $srcdir/$_repo
	msg "Installing..."
	cd build
	make install DESTDIR=$pkgdir
}
