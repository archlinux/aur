# Maintainer: Yardena Cohen <yardenack at gmail dot com>

gitname=htop
pkgname=${gitname}-git
pkgver=517.64ecba2
pkgrel=1
pkgdesc="Interactive text-mode process viewer"
url="https://github.com/hishamhm/${gitname}"
license=('GPL')
arch=('i686' 'x86_64')
depends=('ncurses')
makedepends=('git' 'python2')
optdepends=('lsof: list open files for running process'
            'strace: attach to running process')
provides=('htop')
conflicts=('htop')
options=('!emptydirs')
source=("git+${url}.git#commit=e3d1ca")
sha256sums=('SKIP')

pkgver() {
	 cd "${srcdir}/${gitname}"
	 local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
	 printf "%s" "${ver//-/.}"
}

prepare() {
	 cd "${srcdir}/${gitname}"

	 ./autogen.sh

	 sed -i 's|ncursesw/curses.h|curses.h|' RichString.[ch] configure
	 sed -i 's|python|python2|' scripts/MakeHeader.py

	 ./configure \
        --prefix=/usr \
        --enable-unicode \
        --enable-openvz \
        --enable-vserver \
        --enable-cgroup \
        --enable-oom
}

build() {
	 cd "${srcdir}/${gitname}"
	 make
}

package() {
	 cd "${srcdir}/${gitname}"
	 make DESTDIR="${pkgdir}" install
}
