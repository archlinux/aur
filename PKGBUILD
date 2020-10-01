# Maintainer: Westly Ward <sonicrules1234 at gmail dot com>

pkgname=magiwallet-magid-raspi4-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r300.d316219f3
pkgrel=2
pkgdesc="Magicoin wallet"
arch=("aarch64")
url="https://github.com/m-pays/magi"
license=('custom')
groups=()
depends=('db-4.8-raspi4-magi' 'boost-63-raspi4-magi' 'openssl-1.0' 'gmp' 'miniupnpc')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("magid")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=(!makeflags)
install=
source=("${pkgname%-git}::git+https://github.com/m-pays/magi.git"
		"fix_makefile.patch"
		"LICENSE")
noextract=()
md5sums=('SKIP'
		'a77b8747d17f4bca417c729c272b0f37'
		'97b022da0f876d9eb53279e7c047182a')

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
#	printf "r%s" "$(bzr revno)"

# Git, tags available
#	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

# Mercurial
#	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"

# Subversion
#	printf "r%s" "$(svnversion | tr -d 'A-z')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	patch -p1 -i "$srcdir/fix_makefile.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}/src/"
	make -f makefile.unix xCPUARCH=aarch64 -j 3
}


package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm775 "src/magid" "${pkgdir}/usr/bin/magid"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-git}-git/LICENSE"
#	make DESTDIR="$pkgdir/" install
}
