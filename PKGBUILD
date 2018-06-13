# Maintainer: PAPPY <pappy _AT_ a s c e l i o n _DOT_ com>


pkgname=hyperpixel
pkgver=1.0
pkgrel=1
pkgdesc="Setup for the Pimoroni Hyper Pixel 800x480 pixel multi-touch display"
arch=(armv6h armv7h)
url=https://github.com/pimoroni/hyperpixel
license=(MIT)
depends=(python2-evdev python2-smbus python2-rpi.gpio)
makedepends=(libbcm2835)
_gitdir=${pkgname}-git
source=(${_gitdir}::git+https://github.com/pimoroni/hyperpixel.git)
md5sums=(SKIP)
install=install.sh

pkgver()
{
	cd ${srcdir}/${_gitdir}

	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build()
{
	cd ${srcdir}/${_gitdir}/sources

	cc -o hyperpixel-init hyperpixel-init.c -lbcm2835
}

package()
{
	cd ${srcdir}/${_gitdir}

	install -dm755 ${pkgdir}/boot/overlays
	install -dm755 ${pkgdir}/usr/bin
	install -dm755 ${pkgdir}/usr/lib/systemd/system
	install -sm755 sources/hyperpixel-init ${pkgdir}/usr/bin
	install -m644 requirements/boot/overlays/*.dtbo ${pkgdir}/boot/overlays
	install -m755 requirements/usr/bin/hyperpixel-touch ${pkgdir}/usr/bin
	install -m644 requirements/usr/lib/systemd/system/*.service ${pkgdir}/usr/lib/systemd/system

	sed -i '1 s:python$:python2:' ${pkgdir}/usr/bin/hyperpixel-touch
}

