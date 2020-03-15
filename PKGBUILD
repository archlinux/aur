# Maintainer: Alexander Epaneshnikov <aarnaarn2@gmail.com>

pkgname=brltty-git
pkgver=6.0.r582.gece51f512
pkgrel=1
pkgdesc="Braille display driver for Linux/Unix (development version)"
arch=(x86_64)
url="https://brltty.app"
license=('LGPL2.1')
depends=('at-spi2-core' 'atk' 'bluez-libs' 'espeak-ng' 'java-runtime' 'libxaw' 'ocaml' 'polkit' 'python' 'speech-dispatcher' 'gpm' 'icu' 'liblouis' 'tcl' )
makedepends=('git' 'cython' 'java-environment' 'ocaml-ctypes' 'ocaml-findlib')
conflicts=('brltty')
provides=('brltty')
backup=(etc/brltty.conf)
options=('!emptydirs')
install=brltty.install
source=(${pkgname}::'git+https://github.com/brltty/brltty.git'
	"brltty.tmpfiles"
	"brltty.sysusers")
sha512sums=('SKIP'
	'a530fe66983768f9dc544af01c586abc101dfa2ed76885b4f1fd78c483b59e8445f2c0dbbfb865dd1cf2874342c346bd35ce978ab246e9cdd31d2d489a14e770'
	'cc2e2d5f33d4e11d6ff828aefc0773ccdc02127ce2f00649c1e3f8d4b39b90789f4a0e41385b344f850c38bd4a1df36d3d9d413a59144d431defdd343633f800')

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
		--with-screen-driver=lx \
		--enable-gpm \
		--without-espeak
}

build() {
	cd "${srcdir}/${pkgname}"
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	make INSTALL_ROOT="$pkgdir" install
	install -Dm644 Documents/brltty.conf "$pkgdir/etc/brltty.conf"
	cd "${srcdir}/${pkgname}/Autostart/Systemd/"
	make INSTALL_ROOT="$pkgdir" install
	cd "${srcdir}/${pkgname}/Autostart/Udev/"
	make INSTALL_ROOT="$pkgdir" install
}
