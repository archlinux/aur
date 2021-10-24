# Maintainer: madmurphy <madmurphy333 AT gmail DOT com>

pkgname='gman'
pkgver='0.9.3'
pkgrel=1
pkgdesc='Small man(1) front-end for X'
arch=('i686' 'x86_64')
url="https://launchpad.net/ubuntu/impish/+package/${pkgname}"
license=('GPL')
conflicts=("${pkgname}-git" "${pkgname}-bin")
depends=('atk' 'cairo' 'fontconfig' 'libxft' 'gdk-pixbuf2' 'gtk2' 'libunwind'
         'mandoc' 'xterm' 'perl')
optdepends=('evince: for unknown'
            'gv: for unknown'
            'lighttpd: for unknown'
            'man2html: for unknown'
            'lighttpd: for unknown')
source=("https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/${pkgname}/${pkgver}-5.3build1/${pkgname}_${pkgver}.orig.tar.gz"
        "https://launchpadlibrarian.net/470122831/${pkgname}_${pkgver}-5.3build1.debian.tar.xz"
	'gman-commands.patch'
	'gman.desktop')
options=('!makeflags' '!buildflags')
sha256sums=('27d11b4f2d41691335cb666ca07e6b491fb24496b30330ffbbb26eaa24ed0f99'
            '63f895facd009a44820fd3bc45fc0e9319c2c32812d93d0a423ed5ca203b8f08'
            '77f37734f5496f0f070a84871474177f1de6ca338cf1e9472b9f882ab161a819'
            '479d105ceb6d24b01d82e2792b7aac022b8e918489bd770b26ec612060edc5b4')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch < "${srcdir}/debian/patches/pre-${pkgver}-5.1.patch"
	patch < "${srcdir}/gman-commands.patch"
	patch < "${srcdir}/debian/patches/sensible-browser.patch"
	patch < "${srcdir}/debian/patches/evince.patch"
	patch < "${srcdir}/debian/patches/manpath.patch"
	patch < "${srcdir}/debian/patches/gnome-terminal.patch"
	patch < "${srcdir}/debian/patches/fix-ftbfs-with-binutils-gold.patch"
	patch < "${srcdir}/debian/patches/0007-test.c-Let-main-function-return-int-to-fix-FTBFS.patch"
	patch < "${srcdir}/debian/patches/0008-Makefile-Take-DESTDIR-into-consideration.patch"
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -dm755 "${pkgdir}/usr/share/applications"
	install -Dm644 "${srcdir}/gman.desktop" "${pkgdir}/usr/share/applications/gman.desktop"
}

