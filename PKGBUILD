# Maintainer: bobpaul <bobpaul@users.noreply.github.com>
# contact me via AUR or archlinux forums
pkgname=mavlink-router-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=v1.r33.61ce186
pkgrel=2
pkgdesc="Route mavlink packets between endpoints (serial, tcp, udp, etc)"
arch=('x86_64')
url="https://github.com/intel/mavlink-router"
license=('Apache 2.0')
groups=()
depends=('python-pymavlink')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/intel/mavlink-router.git')
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"

# Git, tags available
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

# Git, no tags available
#	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

#prepare() {
#	cd "$srcdir/${pkgname%-git}"
#	patch -p1 -i "$srcdir/${pkgname%-git}.patch"
#}

build() {
	cd "$srcdir/${pkgname%-git}"
    git submodule update --init --recursive
	./autogen.sh
	./configure CFLAGS='-g -O2' \
        --sysconfdir=/etc --localstatedir=/var --libdir=/usr/lib64 \
        --prefix=/usr
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
	make -k check
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
