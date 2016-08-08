# Maintainer: Ian Beringer <ian@ianberinger.com>

pkgname=usbguard-git
_pkgname=usbguard
pkgver=0.5.10.66.gbf28a52
pkgrel=2
license=('GPL2')
pkgdesc='USBGuard is a software framework for implementing USB device authorization policies'
makedepends=("git" "libqb-git" "libsodium")
depends=()
arch=("i686" "x86_64")
url='https://github.com/dkopecek/usbguard'
source=(
	"${_pkgname}::git+https://github.com/dkopecek/usbguard.git"
	"disable_json_regression_test.patch")
sha256sums=(
	'SKIP'
	'644ae1819eaf405091878bdcf78a5f71d7b344346c4e67a24525e4fb442eed4d')
provides=("usbguard")

pkgver() {
	cd "${srcdir}/${_pkgname}"
  git describe --tags | sed -e 's:v::' -e 's/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	patch -p1 <../disable_json_regression_test.patch
  ./autogen.sh
  ./configure --prefix=/usr --sbindir=/usr/bin --libdir=/usr/lib \
	--enable-systemd \
	--with-bundled-json \
	--with-bundled-spdlog \
	--with-bundled-catch \
	--with-bundled-pegtl
  make
}

check() {
  cd "${srcdir}/${_pkgname}"
  make check
}

package() {
	cd "${srcdir}/${_pkgname}"
	make SYSTEMD_UNIT_DIR="/usr/lib/systemd/system" DESTDIR="$pkgdir/" install
	mkdir -p ${pkgdir}/etc/usbguard
	install -p -m 644 ./usbguard-daemon.conf ${pkgdir}/etc/usbguard/usbguard-daemon.conf
}
