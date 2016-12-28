# Maintainer: Constantin Lorenz <Cons27773964@aol.com>

pkgname=sandboxed-tor-browser # '-bzr', '-git', '-hg' or '-svn'
pkgver=0.0.2.r29.ga9cc56e
pkgrel=1
pkgdesc="A sandboxed version of the Tor Browser, currently in alpha!"
arch=('i686' 'x86_64')
url="https://trac.torproject.org/projects/tor/wiki/doc/TorBrowser/Sandbox/Linux"
license=('AGPL3')
groups=()
depends=(bubblewrap-git gtk3 gnome-themes-standard)
makedepends=(make git gcc gb go libseccomp) # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
replaces=()
backup=()
options=()
install=
source=('git+https://git.torproject.org/tor-browser/sandboxed-tor-browser.git')
source+=("${pkgname}.desktop"
         "${pkgname}.png")
noextract=()
md5sums=('SKIP'
         '49042133dbfad9f06df48c934dc123e6'
         '494afbfa60fb4ce21840244cc3f7208c')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-VCS}"

# The examples below are not absolute and need to be adapted to each repo. The
# primary goal is to generate version numbers that will increase according to
# pacman's version comparisons with later commits to the repo. The format
# VERSION='VER_NUM.rREV_NUM.HASH', or a relevant subset in case VER_NUM or HASH
# are not available, is recommended.

# Bazaar
#	printf "r%s" "$(bzr revno)"

# Git, tags available
	printf "$(git describe --long | sed 's/^sandboxed-tor-browser-//;s/\([^-]*-g\)/r\1/;s/-/./g')"

# Git, no tags available
#	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

# Mercurial
#	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"

# Subversion
#	printf "r%s" "$(svnversion | tr -d 'A-z')"
}

prepare() {
	cd "$srcdir/${pkgname%}"
#	patch -p1 -i "$srcdir/${pkgname%}.patch"
}

build() {
	cd "$srcdir/${pkgname%}"
#	./autogen.sh
#	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/${pkgname%}"
#	make -k check
}

package() {
	cd "$srcdir/${pkgname%}"
	make DESTDIR="$pkgdir/"	
	cd "$srcdir"
	install -Dm 644 ${pkgname}.desktop      ${pkgdir}/usr/share/applications/${pkgname}.desktop
   	install -Dm 644 ${pkgname}.png          ${pkgdir}/usr/share/pixmaps/${pkgname}.png
   	install -Dm 755 ${srcdir}/sandboxed-tor-browser/bin/sandboxed-tor-browser           ${pkgdir}/usr/bin/${pkgname}
}
