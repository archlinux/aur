# Maintainer: Mads Kjeldgaard<mail@madskjeldgaard.dk>
pkgname=supercollider-super-bufrd-git
pkgver=r84.a785981
pkgrel=2
pkgdesc="SuperCollider plugins for accessing long buffers with subsample accuracy"
arch=('any')
url="https://github.com/esluyter/super-bufrd"
license=('GPL')
groups=('pro-audio' 'supercollider-plugins')
depends=('supercollider')
makedepends=("git" "cmake" "supercollider-headers-git")
optdepends=()
source=("$pkgname"::git+$url.git)
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
		SC_SRC="/usr/share/supercollider-headers"

		cd "$srcdir/$pkgname"

		mkdir build 
		cd build

		cmake -DSC_PATH=$SC_SRC -DCMAKE_BUILD_TYPE=RELEASE ..
		make

}


package() {
	cd "$srcdir/$pkgname"
	DEST="$pkgdir/usr/share/SuperCollider/Extensions/$pkgname"


	# Prepare install directories
	mkdir -p $DEST/Classes 
	mkdir -p $DEST/HelpSource/Classes
	mkdir -p $DEST/SystemOverwrites

	# Classes
	for FILE in "*.sc"; do install -Dm755 ./$FILE "$DEST/Classes"; done
	for FILE in "SystemOverwrites/*.sc"; do install -Dm755 ./$FILE "$DEST/SystemOverwrites"; done

	# Shared objects
	for FILE in *.so; do install -Dm755 ./build/*.so "$DEST"; done

	# Help Files
	for FILE in "HelpSource/Classes/*"; do install -Dm755 ./$FILE "$DEST/HelpSource/Classes"; done

}
