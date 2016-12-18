# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Tech Guy Software <techguy100official at gmail dot com>
# macOS port by metacollins, original project by donovan6000, licensed under GPLv3
pkgname=universal-ifr-extractor-linux-git
pkgver=r42.f703249
pkgrel=1
#epoch=
pkgdesc="Command-line EFI/UEFI module IFR extractor"
arch=('x86_64')
url="https://github.com/TGSoftware/Universal-IFR-Extractor-Linux"
license=('GPL3')
#groups=()
depends=('cmake' 'clang' 'pacman')
makedepends=('git')
#checkdepends=()
#optdepends=()
provides=('ifrextract')
#conflicts=()
#replaces=()
#backup=()
#options=()
install=Universal-IFR-Extractor-Linux-git.install
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
	cd "$pkgname"
	#patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd "$pkgname"
	#./configure --prefix=/usr
	# remove existing binary build directories
	rm -rf build
	mkdir build && cd build
	cmake ..
	make
}

#check() {
#	cd "$pkgname-$pkgver"
#	make -k check
#}

package() {
	cd $srcdir

	# cleanup existing unfinished packaging folders
	echo "--> Removing existing source folders..."
	rm -rf "$pkgname-$pkgver"
	mv "$pkgname" "$pkgname-$pkgver"
	cd "$pkgname-$pkgver/build"

	# cleanup existing install to /usr/bin
	echo "--> Moving ifrextract binary to /usr/bin..."
	sudo rm -f /usr/bin/ifrextract
        sudo cp ifrextract /usr/bin/
	
	# post-install instructions
	echo "--> Success! Run Universal IFR Extractor in the command line by using the command \"ifrextract\" as the root user."
	
	#make DESTDIR="$pkgdir/" install
}
