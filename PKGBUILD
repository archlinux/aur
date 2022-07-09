# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor : Daniel Micay <danielmicay@gmail.com>

## GPG key: https://greenbone.net/GBCommunitySigningKey.asc

pkgname=gvm-libs
pkgver=21.4.4
pkgrel=1
pkgdesc='greenbone-vulnerability-manager libraries'
arch=('x86_64')
url="https://github.com/greenbone/gvm-libs"
license=('GPL')
groups=('greenbone-vulnerability-manager')
depends=('gnutls' 'libpcap' 'gpgme' 'libssh' 'glib2' 'libldap' 'hiredis' 'libnet' 'libxml2')
makedepends=('cmake')
provides=(
	'libgvm_util.so=21-64'
	'libgvm_osp.so=21-64'
	'libgvm_gmp.so=21-64'
	'libgvm_boreas.so=21-64'
	'libgvm_base.so=21-64')
replaces=('openvas-libraries')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.asc")
sha256sums=('119e61725c64cbff24c67f47e85463eb6f508f3ece4455da186ac28c29af96b2'
            'SKIP')
validpgpkeys=('8AE4BE429B60A59B311C2E739823FAA60ED1E580') # GVM Transfer Integrity

PURGE_TARGETS=('var/run')

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
