# Maintainer: trustytrojan <t@trustytrojan.dev>
pkgname='neosu-tt-git'
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="cookie clicker with extra features - trustytrojan fork that builds on linux and doesn't need existing osu folder"
arch=('x86_64')
url='https://neosu.net'
license=('GPLv3')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://git.kiwec.net/trustytrojan/neosu#branch=neosu-only-loading")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

export GIT_LFS_SKIP_SMUDGE=1

prepare() {
	cd $srcdir/neosu
	cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release
}

build() {
	cd $srcdir/neosu
	cmake --build build -j$(nproc)
}

package() {
	mkdir -p $pkgdir/usr/bin # script to execute the binary goes here
	mkdir -p $pkgdir/usr/lib/neosu # the binary goes here
	mkdir -p $pkgdir/usr/share/neosu # resources go here

	# make simple script to execute neosu with PWD at the resources
	echo -e '#!/bin/sh\ncd /usr/share/neosu && /usr/lib/neosu/neosu' >$pkgdir/usr/bin/neosu
	chmod +x $pkgdir/usr/bin/neosu

	cp $srcdir/neosu/build/neosu $pkgdir/usr/lib/neosu
	cp -nr $srcdir/neosu/build/_deps/old-repo-src/resources/* $pkgdir/usr/share/neosu
}

