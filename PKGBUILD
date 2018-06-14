# Maintainer: Falk Alexander Seidl <fa@terminal.run>

pkgname=transmission-csd-git
_gitname=transmission
_gitbranch="wip/gtk-3.14"
pkgver=r1000
pkgrel=4
pkgdesc="Fast, easy, and free BitTorrent client (GTK+ GUI), CSD port"
arch=('i686' 'x86_64')
license=('GPL2')
url="https://github.com/transmission/${_gitname}/tree/${_gitbranch}"
depends=('curl' 'libevent' 'gtk3' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('gtk3' 'intltool' 'curl' 'libevent' 'autoconf' 'cmake' 'git')
optdepends=('notification-daemon: Desktop notification support'
            'transmission-cli: daemon and web support')
options=('!emptydirs')
source=("git://github.com/transmission/${_gitname}.git#branch=${_gitbranch}")
install="transmission-gtk.install"
conflicts=('transmission-gtk')
provides=('transmission-gtk')
md5sums=('SKIP')
 
pkgver() {
	cd "${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_gitname}/"
	git submodule update --init
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
	make
}

package() {
	cd "${srcdir}/${_gitname}/"
	cd build
	make -C gtk DESTDIR="$pkgdir" install
	make -C po DESTDIR="$pkgdir" install
}
