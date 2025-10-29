# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor : Daniel Micay <danielmicay@gmail.com>

## GPG key: https://greenbone.net/GBCommunitySigningKey.asc

pkgname=gvm-libs
pkgver=22.30.0
pkgrel=1
pkgdesc='greenbone-vulnerability-manager libraries'
arch=('x86_64')
url="https://github.com/greenbone/gvm-libs"
license=('GPL')
groups=('greenbone-vulnerability-manager')
depends=(
	'cjson'
	'gnutls'
	'hiredis'
	'json-glib'
	'libgcrypt'
	'libgio-2.0.so'
	'libglib-2.0.so'
	'libgpgme.so'
	'libldap'
	'libnet'
	'libssh.so'
	'libuuid.so'
	'libxml2.so'
	'paho-mqtt-c'
	'radcli'
	'zlib')
makedepends=('cmake' 'doxygen' 'graphviz')
provides=(
	"libgvm_base.so=${pkgver::2}-64"
	"libgvm_boreas.so=${pkgver::2}-64"
	"libgvm_gmp.so=${pkgver::2}-64"
	"libgvm_osp.so=${pkgver::2}-64"
	"libgvm_util.so=${pkgver::2}-64")
replaces=('openvas-libraries')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.asc")
sha256sums=('959dbaeb01e66f16451bd1f191e19f319844e6b68fec0605a3e6cbeaac092e45'
            'SKIP')
validpgpkeys=('8AE4BE429B60A59B311C2E739823FAA60ED1E580') # GVM Transfer Integrity


prepare() {
	cd "$pkgname-$pkgver"
	sed -i '/-Werror/d' CMakeLists.txt
}

build() {
	cmake \
		-B build \
		-S "$pkgname-$pkgver" \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DLIBDIR=/usr/lib \
		-DSYSCONFDIR=/etc \
		-DLOCALSTATEDIR=/var
	make -C build
	make -C build doc
}

package() {
	make DESTDIR="${pkgdir}/" -C build install

	# Install doc (should be possible via cmake)
	install -Dm644 build/doc/generated/html/* -t "${pkgdir}/usr/share/doc/${pkgname}/html/"

	# Otherwise this package would install /run/gvm
	# Let this be created by gvmd
	rm -rf "$pkgdir/run"
}
