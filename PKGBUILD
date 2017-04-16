# Maintainer: Tech Guy Software <techguy100official at gmail dot com>
# macOS port by metacollins, original project by donovan6000, licensed under GPLv3
pkgname=universal-ifr-extractor-linux-git
pkgver=r46.61c09aa
pkgrel=4
#epoch=
pkgdesc="Command-line EFI/UEFI module IFR extractor"
arch=('x86_64' 'i386' 'i686')
url="https://github.com/TGSoftware/Universal-IFR-Extractor-Linux"
license=('GPL3')
#groups=()
#depends=()
makedepends=('git' 'cmake' 'clang')
#checkdepends=()
#optdepends=()
provides=('ifrextract')
#conflicts=()
#replaces=()
#backup=()
#options=()
changelog=README.md
source=("$pkgname::git+https://github.com/TGSoftware/Universal-IFR-Extractor-Linux")
#noextract=()
md5sums=('SKIP')
#validpgpkeys=()

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	# Licensing information and build from source instructions
	echo "[Package Install - Supplementary Information]"
	echo "This package is a fork of a macOS port by metacollin on GitHub."
	echo "The original project was created by donovan6000. This project, the macOS port, and the original are licensed under GPLv3."
	echo "Thank you for your hard work! This Linux fork works on any distribution, just build it from source."
	echo "You can find build instructions at https://github.com/TGSoftware/Universal-IFR-Extractor-Linux"
	echo "[End Supplementary Information]"
	# currently in $srcdir
	cd "$srcdir"
}

build() {
    # currently in $srcdir
	cd "$srcdir/$pkgname"
	
	# build makefile from CMakeLists.txt
	echo "--> Building ifrextract makefile (cmake)..."
	mkdir build
	cd build
	cmake ..
}

package() {
    # make package from built makefile (makefile from cmake)
    echo "--> Building ifrextract binary (make)..."
	cd "$pkgname/build"
	make
	
	# fakeroot will install it to /usr/bin
	# uninstall will remove associated files with the package
	echo "--> Moving to temporary /usr/bin which will be destination of ifrextract after install..."
	mkdir -p "$pkgdir/usr/bin"
    mv ifrextract "$pkgdir/usr/bin"
	
	# post-install instructions
	echo "--> Success! Run Universal IFR Extractor in the command line by using the command \"ifrextract\" as the root user."
	echo "[Sample Usage] ifrextract input.bin output_ifr.txt"
}
