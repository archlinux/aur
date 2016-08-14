# Maintainer: Yaohan Chen <yaohan.chen@gmail.com>
# Contributor: Christopher Rosell <chrippa@tanuki.se>
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Mikael Eriksson <mikael_miffe_eriksson@yahoo.se>

realname=libflashsupport
bename=pulse
_gitname="${realname}-${bename}"
pkgname="${realname}-${bename}-git"
pkgver=r10.a9bc3ca
pkgrel=1
pkgdesc="Adds PulseAudio support to the Flash browser plugin"
url="http://git.0pointer.net/${realname}.git/"
license=("GPL")
arch=("x86_64" "i686")
depends=("flashplugin")
depends_x86_64=("lib32-libpulse")
depends_i686=("libpulse")
makedepends=("automake" "autoconf" "git" "pkg-config")
source=("${_gitname}::git+http://git.0pointer.net/${realname}.git")
sha256sums=(SKIP)

prepare() {
	cd "${srcdir}/${_gitname}"

	# Patch
	sed -i 's|#define V4L1|//#define V4L1|g' 'flashsupport.c'
}

pkgver() {
	cd "${srcdir}"/${_gitname}/
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

case "$CARCH" in
	x86_64)
		libdir='/usr/lib32'
		;;
	i686)
		libdir='/usr/lib'
		;;
esac

build() {
	cd "${srcdir}/${_gitname}"

	# Config
	[ ${CARCH} = 'x86_64' ] && CXXFLAGS="$CXXFLAGS -fPIC"

	export CC="gcc -m32"
	export PKG_CONFIG_PATH="${libdir}/pkgconfig"

	NOCONFIGURE=1 ./bootstrap.sh
	./configure --prefix=/usr --libdir="${libdir}" --libexecdir="${libdir}"
	make
}

package() {
	cd "${srcdir}/${_gitname}"

	make DESTDIR="${pkgdir}" install
	rm "${pkgdir}/${libdir}/${realname}.la"
}
