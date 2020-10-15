# Maintainer: Alexander Epaneshnikov <aarnaarn2@gmail.com>

pkgname=brltty-git
pkgver=6.1.r559.g7cfd436fd
pkgrel=1
pkgdesc="Braille display driver for Linux/Unix (development version)"
arch=(x86_64)
url="https://brltty.app"
license=('LGPL2.1')
depends=('bluez-libs' 'expat' 'gcc-libs' 'glibc' 'liblouis' 'libspeechd' 'pcre'
'polkit' 'tcl')
makedepends=('alsa-lib' 'at-spi2-atk' 'at-spi2-core' 'atk' 'cython' 'dbus'
'dracut' 'espeak-ng' 'festival' 'glib2' 'gpm' 'icu' 'java-environment' 'libxaw' 'ncurses'
'ocaml-ctypes' 'ocaml-findlib' 'speech-dispatcher' 'systemd-libs')
optdepends=('at-spi2-core: X11/GNOME Apps accessibility'
            'atk: ATK bridge for X11/GNOME accessibility'
			         'dracut: initramfs support'
            'espeak-ng: espeak-ng driver'
            'java-runtime: Java support'
            'libxaw: X11 support'
            'libxt: X11 support'
            'libx11: for xbrlapi'
            'libxfixes: for xbrlapi'
            'libxtst: for xbrlapi'
            'ocaml: OCaml support'
            'python: Python support'
            'speech-dispatcher: speech-dispatcher driver')
conflicts=('brltty')
provides=('brltty' 'libbrlapi.so')
backup=(etc/brltty.conf)
options=('!emptydirs')
install=${pkgname}.install
source=(${pkgname}::'git+https://github.com/brltty/brltty.git'
        "${pkgname}.tmpfiles")
sha512sums=('SKIP'
            '6b29bf62cbcd1ffea70875c9325f02796797da83ece2e62742fcb09f6a8d49c465123ecbd7ebaad472b20cb2664fcf0ba9e81bf91d1d1529ef2ee154354afc58')

pkgver() {
	cd "${srcdir}/${pkgname}"
	# cutting off 'BRLTTY.' prefix that presents in the git tag
	git describe --long | sed 's/^BRLTTY.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${pkgname}"
	./autogen --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
		--mandir=/usr/share/man \
		--with-tables-directory=/usr/share/brltty \
		--with-writable-directory=/run/brltty \
		--enable-gpm \
		--disable-stripping
}

build() {
	cd "${srcdir}/${pkgname}"
	make
}

package() {
	depends+=('libasound.so' 'libdbus-1.so' 'libgio-2.0.so' 'libglib-2.0.so'
  'libgobject-2.0.so' 'libicuuc.so' 'libgpm.so' 'libncursesw.so'
  'libsystemd.so')
	cd "${srcdir}/${pkgname}"
 make INSTALL_ROOT="${pkgdir}" install
 make INSTALL_ROOT="${pkgdir}" install-systemd
 make INSTALL_ROOT="${pkgdir}" install-udev
 make INSTALL_ROOT="${pkgdir}" install-dracut
 install -vDm 644 "Documents/brltty.conf" -t "${pkgdir}/etc/"
 install -vDm 644 "../${pkgname}.tmpfiles" \
  "${pkgdir}/usr/lib/tmpfiles.d/brltty.conf"
}
