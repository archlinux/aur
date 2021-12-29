# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>

pkgname=brltty-git
pkgver=6.4.r237.g9d6ce08da
pkgrel=1
pkgdesc="Braille display driver for Linux/Unix (development version)"
arch=(x86_64)
url="https://brltty.app"
license=(LGPL2.1)
depends=('bluez-libs' 'gcc-libs' 'glibc' 'liblouis' 'libspeechd' 'pcre2'
         'polkit')
makedepends=('alsa-lib' 'at-spi2-atk' 'at-spi2-core' 'atk' 'cython' 'dbus'
             'expat' 'dracut' 'espeak-ng' 'festival' 'git' 'glib2' 'gpm' 'icu'
             'java-environment' 'tcl' 'libxaw' 'ncurses'
             'ocaml-ctypes' 'ocaml-findlib' 'speech-dispatcher' 'systemd-libs'
             'python-setuptools')
optdepends=('at-spi2-core: X11/GNOME Apps accessibility'
            'atk: ATK bridge for X11/GNOME accessibility'
            'espeak-ng: espeak-ng driver'
            'java-runtime: Java support'
            'libxaw: X11 support'
            'libxt: X11 support'
            'libx11: for xbrlapi'
            'libxfixes: for xbrlapi'
            'libxtst: for xbrlapi'
            'ocaml: OCaml support'
            'python: Python support'
            'speech-dispatcher: speech-dispatcher driver'
            'tcl: tcl support')
provides=('brltty' 'libbrlapi.so')
conflicts=('brltty')
backup=(etc/brltty.conf
        etc/X11/xinit/xinitrc.d/90xbrlapi)
options=(!emptydirs)
install=brltty-git.install
source=(${pkgname%-git}::'git+https://github.com/brltty/brltty.git'
        "${pkgname%-git}-6.2-systemd_sysusers_groups.patch"
        "${pkgname%-git}-6.4-x11_autostart.patch")
sha512sums=('SKIP'
            '32ba91271e2247b4a330cd213ed75b591268cb99a79c2efd9ae675804faee027c6b2f782768cb2329a65fc914ca2400b2901f35ce1fc2522c6691b343799eb02'
            '4871512affefbc178f4204a1b285fc2b5a05ea2d181163195d695b760e9729b3d2d00b5f052abd71379df609c3859d7cbd64128bdefd16e898bbc4368500a9a0')
b2sums=('SKIP'
        '036e36d558594bb06af1eb41ff5fc9ae52ccf4bad54556c3f4f81a5e2f31f574039835e5e756455527c327a73d563a3db54a9f32e3478545a2a22c2725aaeee2'
        '4ebc07a725ef8362233a83118e93901e78943e8dae08f9358b668ff13ab88a65eb9e87c49d106a8c3d87eb62007b230e199107eacb01f92dc683335076c01309')

pkgver() {
	cd "${pkgname%-git}"
	# cutting off 'BRLTTY.' prefix that presents in the git tag
	git describe --long | sed 's/^BRLTTY.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${pkgname%-git}"
	patch -Np1 -i ../"${pkgname%-git}-6.2-systemd_sysusers_groups.patch"
	patch -Np1 -i ../"${pkgname%-git}-6.4-x11_autostart.patch"
	./autogen
}

build() {
	# fat-lto-objects is required for non-mangled static libs
	CFLAGS+=" -ffat-lto-objects"
	cd "${pkgname%-git}"
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
	          --mandir=/usr/share/man \
	          --with-scripts-directory=/usr/lib/brltty \
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
	cd "${pkgname%-git}"
	# installation does not work reliably with many cores, so set jobs to 1
	make -j1 INSTALL_ROOT="${pkgdir}" install
	make -j1 INSTALL_ROOT="${pkgdir}" install-systemd
	make -j1 INSTALL_ROOT="${pkgdir}" install-udev
	make -j1 INSTALL_ROOT="${pkgdir}" install-dracut
	make -j1 INSTALL_ROOT="${pkgdir}" install-polkit
	install -vDm 644 "Documents/${pkgname%-git}.conf" -t "${pkgdir}/etc/"

	# fix directory permission and ownership
	install -vdm 750 -o root -g 102 "$pkgdir/usr/share/polkit-1/rules.d"
}
