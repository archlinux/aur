# Maintainer: TingPing <tingping@tingping.se>

_gitname='tartan'
pkgname='tartan-git'
pkgver=0.3.0.r10.g7662db0
pkgrel=1
pkgdesc='Clang analysis plugin for GLib and GNOME'
url='https://people.collabora.com/~pwith/gnome-clang/'
arch=('i686' 'x86_64')
provides=('tartan')
conflicts=('tartan')
license=('GPL3')
source=('git+https://anongit.freedesktop.org/git/tartan.git'
        'gnome-clang-llvm-3.9.patch')
depends=('llvm' 'clang' 'glib2' 'gobject-introspection')
makedepends=('autoconf' 'automake' 'libtool' 'intltool' 'git')
sha256sums=('SKIP'
            '6e06fb4b942700e2428b865562bfbc831323d07d36443db6147b75c2e39cc61d')

pkgver() {
	cd "$_gitname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_gitname"
    git apply "$srcdir/gnome-clang-llvm-3.9.patch"
}

build() {
	cd "$_gitname"

	./autogen.sh --prefix=/usr
	sed -i 's|^#define NDEBUG|//|' config.h
	make
}

package() {
	cd "$_gitname"

	DESTDIR=$pkgdir make install
}
