# Maintainer: nyorain <nyorain at gmail dot com>
pkgname=skia-git 
pkgver=r24473.1818701
pkgrel=1
pkgdesc="Chromiums high-performance rendering library (static)"
arch=('any')
url="https://github.com/google/skia"
license=('BSD')
depends=('mesa' 'libgl')
makedepends=('git' 'ninja' 'depot-tools-git' 'python2' 'gcc' 'gn')
source=()
md5sums=()

pkgver() {
	cd "$srcdir/skia"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	# to make sure depot tools are in path
	if [[ ! ":$PATH:" == *":/opt/depot_tools:"* ]]; then
		export PATH=$PATH:/opt/depot_tools
	fi

	# download/sync skia
	cd "$srcdir"
	gclient config --unmanaged https://skia.googlesource.com/skia.git
	gclient sync

	# make python2 default python
	mkdir -p .pkgbuild-bin 
	ln -sf /usr/bin/python2-config .pkgbuild-bin/python-config 
	ln -sf /usr/bin/python2 .pkgbuild-bin/python
	export PATH="$srcdir/.pkgbuild-bin":$PATH

	# generate the ninja build files using gn
	cd skia
	mkdir -p out
	gn gen out/Debug
}

build() {
	cd skia
	ninja -C ./out/Debug
}

package() {
	cd "$srcdir/skia"
	mkdir -p "$pkgdir/usr/include/skia"

	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -D -m644 out/Debug/libskia.a "$pkgdir/usr/lib/libskia.a"
	cp -dpr --no-preserve=ownership ./include/* "$pkgdir/usr/include/skia"

	# needs some kind of modification or must be copied to skia/folder/folder/folder
	# install -D -m644 out/Debug/gen/skia.h "$pkgdir/usr/include/skia/skia.h"
}
