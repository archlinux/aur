# Maintainer: Ian Beringer <ian@ianberinger.com>

pkgname=usbguard
_pkgname=usbguard
pkgver=0.6.0
pkgrel=1
license=('GPL2')
pkgdesc='USBGuard is a software framework for implementing USB device authorization policies'
makedepends=("git")
depends=("libqb-git" "libsodium" "libsystemd" "gcc-libs-multilib" "libcap-ng" "glib2" "libseccomp" "protobuf")
arch=("i686" "x86_64")
url='https://github.com/dkopecek/usbguard'
source=(
	"${url}/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz"
	"${url}/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz.sig")
sha256sums=(
	'b19152e2cc5d0d2ec56fce95b84ee2bed8d1f600a1aed04639757eb7282e8c33'
	'71ee20db98e3bc3ff1da4c2216edb03da6eb8913d39b2f370ea5274270cc025b')
validpgpkeys=("D36B9AB1E6809AF54691C23A3AEF037DB25991BC")
provides=("usbguard")
conflicts=("usbguard-git")
backup=(
	"etc/usbguard/usbguard-daemon.conf"
	"etc/usbguard/rules.conf")

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	rm -f ./usbguard-daemon.conf
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc -sbindir=/usr/bin --libdir=/usr/lib \
	--enable-systemd \
	--with-bundled-spdlog \
	--with-bundled-catch \
	--with-bundled-pegtl
  make
	touch rules.conf
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make SYSTEMD_UNIT_DIR="/usr/lib/systemd/system" DESTDIR="$pkgdir/" install
	mkdir -p "${pkgdir}/etc/usbguard"
	install -p -m 644 ./usbguard-daemon.conf "${pkgdir}/etc/usbguard/usbguard-daemon.conf"
	install -p -m 644 ./rules.conf "${pkgdir}/etc/usbguard/rules.conf"
}
