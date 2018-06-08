# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=xf86-video-geode
pkgver=2.11.19
pkgrel=3
pkgdesc='Xorg X11 Geode video driver'
arch=('i686')
url='http://www.x.org'
license=('MIT')
groups=('xorg-drivers')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=24.0')
conflicts=('xf86-video-geode-git' 'X-ABI-VIDEODRV_VERSION<24' 'X-ABI-VIDEODRV_VERSION>=25')
validpgpkeys=('C89002C77A8BEC6A4E6D7390AE1F8277C4B4D7B6')
source=("http://xorg.freedesktop.org/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2"{,.sig}
        '0001-Remove-call-to-LoaderGetOS.patch'
        '0002-gx-Fix-RANDR-initialization-for-xserver-1.20.patch')
sha256sums=('c6694c21ee3d9560f6e925925ef1d3818b1988e899b6a0592dbae597c87ac97e'
            'SKIP'
            '6b5df7020c88e61ca098677cc8621cd985cc8131f17e48f8be826ccda8e738ee'
            'c27fb4f6479b7f93ea46107612c21ac495ef7372e6c483c79ca4934468afab94')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}/"

	patch -Np1 < ../0001-Remove-call-to-LoaderGetOS.patch
	patch -Np1 < ../0002-gx-Fix-RANDR-initialization-for-xserver-1.20.patch
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}/"

	./configure \
		--prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/"

	make DESTDIR="${pkgdir}/" install

	install -d "${pkgdir}/etc/modules-load.d/"
	echo -e "# The Xorg Geode driver requires msr module to be loaded...\nmsr" \
		> "${pkgdir}/etc/modules-load.d/${pkgname}.conf"
}

