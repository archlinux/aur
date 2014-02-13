gitname=htop
pkgname=${gitname}-git
pkgver=312.953ec71
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
source=("git+${url}.git"
	 "https://projects.archlinux.org/svntogit/packages.git/plain/htop/trunk/tree-crash.patch")
md5sums=('SKIP' '48eba3c0303bfd19d761b859bc69d713')

pkgver() {
	 cd "${srcdir}/${gitname}"
	 local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
	 printf "%s" "${ver//-/.}"
}

build() {
	 cd "${srcdir}/${gitname}"

	 ./autogen.sh

	 sed -i 's|ncursesw/curses.h|curses.h|' RichString.[ch] configure
	 sed -i 's|python|python2|' scripts/MakeHeader.py

	 # Boost field buffer size - crashes when trying to draw very deep UTF-8 trees
	 # Test by nesting 30 shells
	 patch -N -i "${srcdir}/tree-crash.patch"

	 ./configure \
        --prefix=/usr \
        --enable-unicode \
        --enable-openvz \
        --enable-vserver \
        --enable-cgroup \
        --enable-oom

	 make
}

package() {
	 cd "${srcdir}/${gitname}"
	 make DESTDIR="${pkgdir}" install
}
