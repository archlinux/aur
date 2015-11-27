# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Yonathan Dossow
# Contributor: Ansgar Taflinski <ataflinski@uni-koblenz.de>

pkgname=xf86-video-qxl
pkgver=0.1.4
pkgrel=6
pkgdesc='Xorg X11 qxl video driver'
arch=('x86_64' 'i686')
url='http://www.x.org'
license=('MIT')
groups=('xorg-drivers')
depends=('spice')
optdepends_x86_64=('python2: for Xspice')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=20' 'spice-protocol'
	'xf86dgaproto' 'xproto' 'fontsproto' 'randrproto' 'renderproto'
	'videoproto' 'resourceproto' 'scrnsaverproto')
conflicts=('xf86-video-qxl-git' 'X-ABI-VIDEODRV_VERSION<20' 'X-ABI-VIDEODRV_VERSION>=21')
validpgpkeys=('94A9F75661F77A6168649B23A9D8C21429AC6C82')
source=("http://xorg.freedesktop.org/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2"{,.sig}
	'0002-kms-initialize-primary-surface-to-screen-virtual-siz.patch'
	'0003-kms-do-not-overwrite-screen-virtualX-Y.patch'
	'0004-Fix-drawable-mm_time-with-KMS.patch')
sha256sums=('e57ad22f0b1daf8979e722be0cc38d351bfcc2e41568edc566d2bade5a621105'
            'SKIP'
            '2bee0ec4dacbe1bfd996373701090696b3bfdfd00f347329a8bc5b20c6da8853'
            '561dd6f41ccfdfdd666d631dd0dc66e8f671bff6191bad8359881e16d9a1d849'
            'b8ab4f53d367615bfb0b6297511e6aa7a83b4324de3c76aad558516da1b76f2f')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}/"

	# fix Xorg 1.18
	patch -Np1 < "${srcdir}"/0002-kms-initialize-primary-surface-to-screen-virtual-siz.patch
	patch -Np1 < "${srcdir}"/0003-kms-do-not-overwrite-screen-virtualX-Y.patch
	patch -Np1 < "${srcdir}"/0004-Fix-drawable-mm_time-with-KMS.patch

	# this is python 2.x
	sed -i '1c #!/usr/bin/python2' scripts/Xspice
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}/"

	if [ "${CARCH}" = "x86_64" ]; then
		./configure \
			--enable-xspice \
			--prefix=/usr
	else
		./configure \
			--prefix=/usr
	fi

	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/"

	make DESTDIR="${pkgdir}/" install

	if [ "${CARCH}" = "x86_64" ]; then
		install -v -D -m0755 scripts/Xspice "${pkgdir}"/usr/bin/Xspice
	fi
}

