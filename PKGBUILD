# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor : Daniel Micay <danielmicay@gmail.com>

## GPG key: https://greenbone.net/GBCommunitySigningKey.asc

pkgname=gvm-libs
pkgver=22.4.0
pkgrel=1
pkgdesc='greenbone-vulnerability-manager libraries'
arch=('x86_64')
url="https://github.com/greenbone/gvm-libs"
license=('GPL')
groups=('greenbone-vulnerability-manager')
depends=(
	'gnutls'
	'hiredis'
	'libgcrypt'
	'libgio-2.0.so'
	'libglib-2.0.so'
	'libgpgme.so'
	'libnet'
	'libpcap.so'
	'libssh.so'
	'libuuid.so'
	'libxml2.so'
	'paho-mqtt-c'
	'zlib')
makedepends=('cmake')
provides=(
	"libgvm_base.so=${pkgver::2}-64"
	"libgvm_boreas.so=${pkgver::2}-64"
	"libgvm_gmp.so=${pkgver::2}-64"
	"libgvm_osp.so=${pkgver::2}-64"
	"libgvm_util.so=${pkgver::2}-64")
replaces=('openvas-libraries')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.asc")
sha256sums=('568ca642d9e616c27be128041acb0764022e8eebe5b43a6f96e82e4527734da5'
            'SKIP')
validpgpkeys=('8AE4BE429B60A59B311C2E739823FAA60ED1E580') # GVM Transfer Integrity

PURGE_TARGETS=('var/run')

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
}

package() {
	make DESTDIR="${pkgdir}/" -C build install
	rm -rf "$pkgdir/run"
}
