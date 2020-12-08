# Maintainer: Alexander Epaneshnikov <aarnaarn2@gmail.com>

pkgname=brltty-git
pkgver=6.1.r666.g11e2b96fd
pkgrel=1
pkgdesc="Braille display driver for Linux/Unix (development version)"
arch=(x86_64)
url="https://brltty.app"
license=('LGPL2.1')
depends=('bluez-libs' 'expat' 'gcc-libs' 'glibc' 'liblouis' 'libspeechd' 'pcre'
         'polkit' 'tcl')
makedepends=('alsa-lib' 'at-spi2-atk' 'at-spi2-core' 'atk' 'cython' 'dbus'
             'dracut' 'espeak-ng' 'festival' 'git' 'glib2' 'gpm' 'icu'
             'java-environment' 'libxaw' 'ncurses'
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
source=(${pkgname%-git}::'git+https://github.com/brltty/brltty.git'
          ${pkgname%-git}-systemd.patch)
sha512sums=('SKIP'
            'eab819248b5bbf8251e1bedc5009aec1ebd8fa8b8a09e2eef116d582f31d7d13d9837e06bd09a3910159cc97406d73e98bb0e9e99102fcb35e667a12153e4aa2')

pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	# cutting off 'BRLTTY.' prefix that presents in the git tag
	git describe --long | sed 's/^BRLTTY.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${pkgname%-git}"
	patch -p1 -i "$srcdir/${pkgname%-git}-systemd.patch"
	./autogen
}

build() {
	cd "${srcdir}/${pkgname%-git}"
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
	          --mandir=/usr/share/man \
	          --with-tables-directory=/usr/share/brltty \
	          --with-writable-directory=/run/brltty \
	          --enable-gpm \
	          --disable-stripping
	make
}

package() {
	depends+=('libasound.so' 'libdbus-1.so' 'libgio-2.0.so' 'libglib-2.0.so'
	          'libgobject-2.0.so' 'libicuuc.so' 'libgpm.so' 'libncursesw.so'
	          'libsystemd.so')
	cd "${srcdir}/${pkgname%-git}"
	make INSTALL_ROOT="${pkgdir}" install
	make INSTALL_ROOT="${pkgdir}" install-systemd
	make INSTALL_ROOT="${pkgdir}" install-udev
	make INSTALL_ROOT="${pkgdir}" install-dracut
	make INSTALL_ROOT="${pkgdir}" install-polkit
	install -vDm 644 "Documents/brltty.conf" -t "${pkgdir}/etc/"
}
