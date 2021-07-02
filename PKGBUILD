# Maintainer: Jayvee Enaguas <harvettfox96@dismail.de>

pkgname=xstarfish
pkgver=1.1
pkgrel=2
_debver=1.1
_debrel=11.1
pkgdesc="X wallpaper generator"
arch=('x86_64' 'i686')
url="https://launchpad.net/ubuntu/+source/xstarfish/"
#url="http://www.redplanetsw.com/starfish/"
license=('GPL-2')
# For Hyperbola, add xenocara- before [xbitmaps] in build dependency.
depends=('libpng' 'libx11' 'xbitmaps')
makedepends=('glibc' 'quilt')
source=("https://deb.debian.org/debian/pool/main/x/${pkgname}/${pkgname}_${_debver}.orig.tar.gz"
	"https://deb.debian.org/debian/pool/main/x/${pkgname}/${pkgname}_${_debver}-${_debrel}.debian.tar.xz")
sha512sums=('8f398ddc1b0c6fbf33721b48c5859d9cabbbb9dddf298daa92e3658bac69e0544516294e8ef47b948d123115d0258d1d2502bce6e51a24a8b3e99331af3047a1'
	'84e1d2b464ded6ca5443300b3ccad44feeb9d719cd3b6892668839713add7a9f2a668c890598b43f48c44f719ae25475a2e1723927784187a0caa7f4b9f10807')

prepare() {
	cd starfish-${pkgver}/

	# Remove old Debian source directory.
	rm -frv ./debian/

	if [[ ${pkgver%.*} = ${_debver%.*} ]]; then
		# Debian patches
		export QUILT_PATCHES=debian/patches
		export QUILT_REFRESH_ARGS='-p ab --no-timestamps --no-index'
		export QUILT_DIFF_ARGS='--no-timestamps'

		mv "$srcdir"/debian/ ./

		quilt push -av
	fi
}

build() {
	cd starfish-${pkgver}/

	make
}

package() {
	cd starfish-${pkgver}/

	# Install binary and licence files.
	install -Dm755 starfish -t ${pkgdir}/usr/bin/
	install -Dm644 COPYING -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
