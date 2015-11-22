# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Yonathan Dossow
# Contributor: Ansgar Taflinski <ataflinski@uni-koblenz.de>

pkgname=xf86-video-qxl
pkgver=0.1.4
pkgrel=4
pkgdesc='Xorg X11 qxl video driver'
arch=('x86_64' 'i686')
url='http://www.x.org'
license=('MIT')
groups=('xorg-drivers')
depends=('spice')
optdepends=('python2: for Xspice')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=20' 'spice-protocol'
	'xf86dgaproto' 'xproto' 'fontsproto' 'randrproto' 'renderproto'
	'videoproto' 'resourceproto' 'scrnsaverproto')
conflicts=('xf86-video-qxl-git' 'X-ABI-VIDEODRV_VERSION<20' 'X-ABI-VIDEODRV_VERSION>=21')
validpgpkeys=('94A9F75661F77A6168649B23A9D8C21429AC6C82')
source=("http://xorg.freedesktop.org/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2"{,.sig}
	'fix-cast.patch')
sha256sums=('e57ad22f0b1daf8979e722be0cc38d351bfcc2e41568edc566d2bade5a621105'
            'SKIP'
            '30b09971562d82b5bc9dc26e43514ff38e5eaa680c15471194f07c9129e1e0ed')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}/"

	# fix cast from pointer to integer of different size
	patch -Np1 < "${srcdir}/fix-cast.patch"

	# this is python 2.x
	sed -i '1c #!/usr/bin/python2' scripts/Xspice
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}/"

	./configure \
		--enable-xspice \
		--prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/"

	make DESTDIR="${pkgdir}/" install
}

