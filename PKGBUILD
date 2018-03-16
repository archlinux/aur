# Maintainer: grufo <madmurphy333 AT gmail DOT com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: wahnby <wahnby@yahoo.fr>

pkgname='gnunet-git'
_appname='gnunet'
pkgver='r25770.de5018639'
pkgrel=1
pkgdesc="A framework for secure peer-to-peer networking"
arch=('x86_64')
url="http://gnunet.org"
license=('GPL')
provides=("${_appname}")
conflicts=("${_appname}")
depends=('gmp' 'libgcrypt' 'libextractor' 'sqlite' 'gnurl'
	 'libmicrohttpd' 'libunistring' 'libidn')
makedepends=('gettext' 'pkgconfig' 'autoconf'
	     'bluez-libs' 'python' 'glpk' 'libpulse' 'opus')
optdepends=('bluez-libs'
	    'python'
	    'glpk'
	    'libpulse'
	    'opus')

backup=('etc/gnunetd.conf')
options=('!makeflags')

source=("git+https://gnunet.org/git/${_appname}.git"
        'gnunet.service'
        'defaults.conf')

md5sums=('SKIP'
         '54cce3d2415d95b2e5bd1bd88db3a0ea'
         '0fe23b2ca5b3fc47a0b5645e04406da0')

pkgver() {

	cd "${_appname}"
	printf "'r%s.%s'" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

prepare() {

	cd "${srcdir}/${_appname}"
	autoreconf -fi
	sed -i 's|contrib doc|doc|' Makefile.*
	[ -f Makefile ] || ./configure --prefix=/usr \
	--without-mysql \
	--with-nssdir=/usr/lib

}

build() {

	cd "${srcdir}/${_appname}"
	make
	make -C contrib

}

package() {

	cd "${srcdir}/${_appname}"
	make DESTDIR="${pkgdir}" install
	make DESTDIR="${pkgdir}" -C contrib install
	install -D -m0644 "${srcdir}/defaults.conf" "${pkgdir}/etc/gnunetd.conf"
	rm -rf "${pkgdir}/usr/include/libltdl" "${pkgdir}/usr/lib/libltdl".* "${pkgdir}/usr/include/ltdl.h"
	install -Dm0644 "${srcdir}/${_appname}.service" "${pkgdir}/usr/lib/systemd/system/${_appname}.service"

}

