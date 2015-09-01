# Maintainer: Zhuoyi Xu (LDE Team) <xzy476386434@vip.qq.com>

pkgname=lplayer
pkgver=2.9.r0.gb5c217d
pkgrel=1
pkgdesc='A free and open source, cross-platform, mplayer based multimedia player. Qt5 build.'
arch=('i686' 'x86_64')
url='http://ldeteam.tk'
license=('GPL')

depends=('qt5-base' 'qt5-webkit' 'python2' 'python' 'qt5-xmlpatterns' 'mplayer')

makedepends=('git' 'pkg-config' 'cmake')
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}")
replaces=("${pkgname}")

source=(
	"${pkgname}::git+https://github.com/xuzhuoyi/lplayer.git"
)
sha512sums=(
	"SKIP"
)

pkgver() {
	# Updating package version
	cd ${srcdir}/${pkgname}
	(
		set -o pipefail
		git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
        cd ${srcdir}/lplayer
        git submodule init
        git submodule update
}

build() {	
	# Building package
	cd ${srcdir}/lplayer
	cmake .
	make
}

package() {
	# Installing package
	cd ${srcdir}/lplayer
	make DESTDIR=${pkgdir} install
}