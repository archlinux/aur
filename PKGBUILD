# Maintainer: Autumn Boyhan <autumn@crisismodel.com>

pkgname=naikari-git
_pkgname=naikari
pkgver=0.11.0.r37.g9525af71f
pkgrel=1
pkgdesc="Freeform 2-D space trading and mercenary game. Development branch."
arch=('x86_64')
url="https://naikari.github.io/"
license=('GPL3')
depends=('sdl2_image' 'libxml2' 'freetype2' 'libpng' 'openal' 'libvorbis' 'libgl' 'luajit' 'suitesparse' 'libunibreak' 'physfs')
makedepends=('meson' 'ninja' 'git')
provides=('naikari')
conflicts=('naikari')
source=('naikari::git+https://github.com/naikari/naikari.git'
        'naikari-artwork::git+https://github.com/naikari/naikari-artwork-production.git')
md5sums=('SKIP'
         'SKIP')

pkgver() {
	cd ${srcdir}/${_pkgname}
	git describe --long --tags --exclude=nightly | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd ${srcdir}/${_pkgname}
	git submodule init
	git config submodule.artwork.url ${srcdir}/naikari-artwork
	git config submodule.extras/windows/mingw-bundledlls.update none
	git -c protocol.file.allow=always submodule update
}

build() {
	cd ${srcdir}/${_pkgname}
	meson setup build .
	cd build
	meson configure --buildtype=release -Db_lto=true --prefix=/usr
	meson compile
}

package() {
	cd ${srcdir}/${_pkgname}
	DESTDIR=${pkgdir} meson install -C build
	install -D LICENSE -t ${pkgdir}/usr/share/licenses/${_pkgname}
}
