# Maintainer: Pavlo Hilei <p.hilei@ucu.edu.ua>
pkgname=ucutag-git
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="This is fuse based tag-oriented filesystem that uses MongoDB as backend"
arch=(x86_64)
url="https://github.com/yewhenp/UCUTag.git"
license=('GPL3')
groups=()
depends=(fuse2)
makedepends=(git 'cmake>=3.15''boost>=1.75' gcc)
checkdepends=()
optdepends=()
provides=(ucutag)
conflicts=()
replaces=()
backup=()
options=(!buildflags)
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd UCUTag
	printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	if [ ! -d "mongo-cxx-driver" ]; then
		git clone https://aur.archlinux.org/mongo-cxx-driver.git
	fi
	cd mongo-cxx-driver
	makepkg -si
	cd ..
	if [ ! -d "mongodb-bin" ]; then
		git clone https://aur.archlinux.org/mongodb-bin.git
	fi
	cd mongodb-bin
	makepkg -si
	cd ../UCUTag
	if [ -d build ]; then
		rm -rf build
	fi
	# bash compile.sh
	mkdir -p build
	(
		cd build
		cmake -G"Unix Makefiles" -DCMAKE_BUILD_TYPE=${1-Release} -S ..
		make -j4 X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 VERBOSE=1
	)

}

package() {
	cd UCUTag
	echo "Copying project to /opt/$pkgname"
	sudo mkdir -p /opt/${pkgname}
	sudo cp -rf * /opt/${pkgname}
	cd build
	echo "Installing $pkgname"
	sudo make install
	echo "Enabling mongodb service"
	sudo systemctl enable --now mongodb.service
	sudo ln -s /usr/bin/rmdir /usr/local/bin/rmtag
  	sudo ln -s /usr/bin/mkdir /usr/local/bin/mktag
}
