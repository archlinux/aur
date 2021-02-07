# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Jan Fader <jan.fader@web.de>
# Contributor: Stephen Drodge <stephen.drodge@gmail.com>
# Contributor: akiirui (AUR)
# Maintainer: SanskritFritz (gmail)

pkgname=fish-git
_gitname="fish-shell"
pkgver=3.1.2.r2055.gc633ce7e7
pkgrel=1
epoch=2
pkgdesc="User friendly shell intended mostly for interactive use."
arch=('i686' 'x86_64' 'arm')
url="http://fishshell.com"
license=("GPL2")
depends=('glibc' 'gcc-libs' 'ncurses' 'pcre2')
optdepends=('python: man page completion parser / web config tool'
            'pkgfile: command-not-found hook'
            'wl-clipboard: clipboard integration'
            'xsel: clipboard integration'
            'xclip: clipboard integration')
makedepends=('cmake' 'python-sphinx' 'git')
checkdepends=('expect')
provides=('fish' 'fish-shell')
conflicts=('fish' 'fish-shell')
install='fish.install'
source=("git://github.com/fish-shell/fish-shell.git")
md5sums=('SKIP')

pkgver() {
	cd "$_gitname"
	git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

check() {
	cd "$_gitname"
	make -C build test
}

build() {
	cd "$_gitname"
	export CXXFLAGS+=" ${CPPFLAGS}"
	cmake \
		-B build \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_SYSCONFDIR=/etc \
		-DCMAKE_BUILD_TYPE=None \
		-DBUILD_DOCS=True \
		-Wno-dev
	make -C build
}

package() {
	cd "$_gitname"
	make -C build DESTDIR="$pkgdir" install
}
