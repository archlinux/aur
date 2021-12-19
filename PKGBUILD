# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>

pkgname=brltty-git
pkgver=6.4.r226.g92316edc9
pkgrel=1
pkgdesc="Braille display driver for Linux/Unix (development version)"
arch=('x86_64')
url="https://brltty.app"
license=('LGPL2.1')
depends=('bluez-libs' 'expat' 'gcc-libs' 'glibc' 'liblouis' 'libspeechd' 'pcre'
         'polkit')
makedepends=('alsa-lib' 'at-spi2-atk' 'at-spi2-core' 'atk' 'cython' 'dbus'
             'dracut' 'espeak-ng' 'festival' 'git' 'glib2' 'gpm' 'icu'
             'java-environment' 'tcl' 'libxaw' 'ncurses'
             'ocaml-ctypes' 'ocaml-findlib' 'speech-dispatcher' 'systemd-libs')
optdepends=('at-spi2-core: X11/GNOME Apps accessibility'
            'atk: ATK bridge for X11/GNOME accessibility'
            'dracut: initramfs support'
            'espeak-ng: espeak-ng driver'
            'java-runtime: Java support'
            'tcl: tcl support'
            'libxaw: X11 support'
            'libxt: X11 support'
            'libx11: for xbrlapi'
            'libxfixes: for xbrlapi'
            'libxtst: for xbrlapi'
            'ocaml: OCaml support'
            'python: Python support'
            'speech-dispatcher: speech-dispatcher driver')
provides=('brltty' 'libbrlapi.so')
conflicts=('brltty')
backup=(etc/brltty.conf)
options=('!emptydirs')
install=${pkgname}.install
source=(${pkgname%-git}::'git+https://github.com/brltty/brltty.git'
        "${pkgname%-git}-6.2-systemd_sysusers_groups.patch")
sha512sums=('SKIP'
            '32ba91271e2247b4a330cd213ed75b591268cb99a79c2efd9ae675804faee027c6b2f782768cb2329a65fc914ca2400b2901f35ce1fc2522c6691b343799eb02')

pkgver() {
	cd "${pkgname%-git}"
	# cutting off 'BRLTTY.' prefix that presents in the git tag
	git describe --long | sed 's/^BRLTTY.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${pkgname%-git}"
	patch -Np1 -i ../"${pkgname%-git}-6.2-systemd_sysusers_groups.patch"
	./autogen
}

build() {
	cd "${pkgname%-git}"
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
	          --mandir=/usr/share/man \
	          --with-tables-directory=/usr/share/brltty \
	          --with-writable-directory=/run/brltty \
	          --with-scripts-directory=/usr/lib/brltty/ \
	          --enable-gpm \
	          --disable-stripping
	make
}

package() {
	depends+=('libasound.so' 'libdbus-1.so' 'libgio-2.0.so' 'libglib-2.0.so'
	          'libgobject-2.0.so' 'libicuuc.so' 'libgpm.so' 'libncursesw.so'
	          'libsystemd.so')
	cd "${pkgname%-git}"
	make INSTALL_ROOT="${pkgdir}" install
	make INSTALL_ROOT="${pkgdir}" install-systemd
	make INSTALL_ROOT="${pkgdir}" install-udev
	make INSTALL_ROOT="${pkgdir}" install-dracut
	make INSTALL_ROOT="${pkgdir}" install-polkit
	rm -rv "${pkgdir}/etc/X11"
	install -vDm 644 "Autostart/gdm/xbrlapi.desktop" -t "${pkgdir}/etc/xdg/autostart/"
	install -vDm 644 "Documents/${pkgname%-git}.conf" -t "${pkgdir}/etc/"

	# fix directory permission and ownership
	install -vdm 750 -o root -g 102 "$pkgdir/usr/share/polkit-1/rules.d"
}
