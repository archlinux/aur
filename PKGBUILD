# Maintainer: wtx <sdrb@onet.eu>

pkgname=atari800-a8cas-custom
pkgver=4.2.0
pkgrel=1
pkgdesc='An emulator of Atari 800/800XL/130XE/5200 with support for several turbo tape systems from liba8cas library'
arch=('x86_64' 'i686')
url='http://www.arus.net.pl/FUJI/a8cas-util'
license=('GPL2')
liba8cas_name='liba8cas-custom'
liba8cas_ver='1.5.3'
depends=('libsndfile' 'sdl')
provides=("${liba8cas_name}=${liba8cas_ver}")
source=("${url}/uploads/files/${liba8cas_name}-${liba8cas_ver}.tgz"
	"${url}/uploads/files/${pkgname}-${pkgver}.tgz")
md5sums=('aecf058429f0d3dcbf116c9acad3c6a2'
         'b42fe6b48f9c371d6e762e2ff161a7fd')

build() {
	cd ${srcdir}/${liba8cas_name}-${liba8cas_ver}
	autoupdate
	autoreconf -i
	./configure --prefix=/usr
	make

	cd ${srcdir}/${pkgname}-${pkgver}
	./autogen.sh
	./configure --with-a8cas-libraries=${srcdir}/${liba8cas_name}-${liba8cas_ver}/src/.libs/ \
		--with-a8cas-includes=${srcdir}/${liba8cas_name}-${liba8cas_ver}/include/ \
		--program-suffix='-a8cas' \
		--prefix=/usr
	make
}

package() {
	cd ${srcdir}/${liba8cas_name}-${liba8cas_ver}/include
	make DESTDIR=${pkgdir} install

	cd ${srcdir}/${liba8cas_name}-${liba8cas_ver}/src
	make DESTDIR=${pkgdir} install

	cd ${srcdir}/${pkgname}-${pkgver}/src
	make DESTDIR=${pkgdir} install-exec

	install -Dm 0444 ${srcdir}/${pkgname}-${pkgver}/src/atari800.man ${pkgdir}/usr/share/man/man1/atari800-a8cas.1
	gzip ${pkgdir}/usr/share/man/man1/atari800-a8cas.1
}
