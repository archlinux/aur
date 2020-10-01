# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other git sources are not natively supported by makepkg yet.

# Maintainer: Westly Ward <sonicrules1234 at gmail dot com>
pkgname=wolf-m7m-cpuminer-v2-raspi4-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r5.9bbcb3b
pkgrel=1
pkgdesc="cpu miner for magicoin"
arch=('aarch64')
url="https://github.com/j6mes/wolf-m7m-cpuminer"
license=('GPL2')
groups=()
depends=('curl' 'gmp' 'jansson' 'openssl-1.0')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}" "minerd")
conflicts=("${pkgname%-git}" "minerd")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+https://github.com/j6mes/wolf-m7m-cpuminer.git")
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING git SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"

# The examples below are not absolute and need to be adapted to each repo. The
# primary goal is to generate version numbers that will increase according to
# pacman's version comparisons with later commits to the repo. The format
# VERSION='VER_NUM.rREV_NUM.HASH', or a relevant subset in case VER_NUM or HASH
# are not available, is recommended.

# Bazaar
	#printf "r%s" "$(bzr revno)"

# Git, tags available
	#printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

# Mercurial
	#printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"

# Subversion
	#printf "r%s" "$(svnversion | tr -d 'A-z')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./autogen.sh
	CFLAGS="-O2" LDFLAGS="-L/usr/lib/openssl-1.0" ./configure --prefix=/usr
	sed -i "s/\-march\=native/\-mcpu\=cortex\-a72/g" Makefile
	sed -i "s/\-march\=native/\-mcpu\=cortex\-a72/g" m7/Makefile
	make
}


package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
