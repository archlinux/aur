# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=instantbird
pkgver=1.5
pkgrel=1
pkgdesc="Instant messenger using libpurple and xulrunner"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
url="http://instantbird.com"
depends=('xulrunner<26.0')
makedepends=('unzip' 'zip' 'pkg-config' 'diffutils' 'python2' 'wireless_tools' 'yasm' 'libidl2' 'mesa' 'autoconf2.13')
source=(http://instantbird.com/downloads/${pkgver}/${pkgname}-${pkgver}.src.tgz nss.patch libxul-fixes.patch shared-libs.patch mozconfig ${pkgname}.desktop)
options=('!buildflags' 'staticlibs')
_xulnum=`ls /usr/lib | grep -m1 xulrunner-devel | sed -e 's/.*-//'`

build() {
	cd "${srcdir}"/${pkgname}-${pkgver}-src

	cp "${srcdir}"/mozconfig .
	patch -Np1 -i ../nss.patch
	patch -Np1 -i ../libxul-fixes.patch
	patch -Np1 -i ../shared-libs.patch
	echo "ac_add_options --with-libxul-sdk=/usr/lib/xulrunner-devel-"${_xulnum} >> mozconfig

        make -j1 -f client.mk build
}

package() {
	cd "${srcdir}"/obj-${pkgname}/mozilla/dist

	# This will take up more space but omni.ja appears to be broken
	# https://bugzilla.mozilla.org/show_bug.cgi?id=956509
	mkdir -p "${pkgdir}"/usr/bin
	mkdir -p "${pkgdir}"/usr/lib
	mkdir -p "${pkgdir}"/usr/share/pixmaps
	mkdir -p "${pkgdir}"/usr/share/applications
	cp -RL ./bin "${pkgdir}"/usr/lib/instantbird
	
	cd "${pkgdir}"/usr/bin
	ln -sf /usr/lib/instantbird/instantbird instantbird

	# No idea why this is needed now
	cd "${pkgdir}"/usr/lib/instantbird
	ln -sf /usr/lib/xulrunner-${_xulnum} xulrunner

	install -D -m 644 icons/mozicon128.png ../../share/pixmaps/instantbird.png
	install -D -m 644 "${srcdir}"/instantbird.desktop ../../share/applications/instantbird.desktop
}

md5sums=('5654c1b1c48f73699b218ea877a1252e'
         'b4c43e622dd62a4dc6a446d9f40fa6b2'
         '358728705ee83b21a05c0bfd587e791b'
         'f2165407567b2d0f8fe90a9785a53025'
         '7e4dd7027afd4a18129e569adcb080c3'
         '9149cae331413af6430c7b5b8f9cfd80')
