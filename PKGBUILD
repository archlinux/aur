# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Yonathan Dossow
# Contributor: Ansgar Taflinski <ataflinski@uni-koblenz.de>

pkgname=xf86-video-qxl
_commit=e13d28ee
pkgver=0.1.4.r40.g${_commit}
pkgrel=1
pkgdesc='Xorg X11 qxl video driver'
arch=('x86_64' 'i686')
url='http://www.x.org'
license=('MIT')
groups=('xorg-drivers')
depends=('spice')
optdepends=('python2: for Xspice')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=20' 'spice-protocol'
	'xf86dgaproto' 'xproto' 'fontsproto' 'randrproto' 'renderproto'
	'videoproto' 'resourceproto' 'scrnsaverproto' 'git')
conflicts=('xf86-video-qxl-git' 'X-ABI-VIDEODRV_VERSION<20' 'X-ABI-VIDEODRV_VERSION>=21')
validpgpkeys=('94A9F75661F77A6168649B23A9D8C21429AC6C82')
source=("git://anongit.freedesktop.org/xorg/driver/xf86-video-qxl.git#commit=${_commit}")
#source=("http://xorg.freedesktop.org/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2"{,.sig})
sha256sums=('SKIP')

prepare() {
	cd "${srcdir}/${pkgname}"

	# this is python 2.x
	sed -i '1c #!/usr/bin/python2' scripts/Xspice
}

build() {
	cd "${srcdir}/${pkgname}"

	autoreconf -fi
	./configure \
		--enable-xspice \
		--prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}"

	make DESTDIR="${pkgdir}/" install

	install -v -D -m0755 scripts/Xspice "${pkgdir}"/usr/bin/Xspice
}

