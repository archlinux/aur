# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=pam-oauth2
pkgver=1.0.1
_jsmnver=1.1.0
pkgrel=3
pkgdesc='OAuth2 pam module'
arch=(x86_64)
url="https://github.com/CyberDem0n/$pkgname"
license=(MIT)
makedepends=(curl)
backup=("etc/pam.d/${pkgname#pam-}")
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz"
        "$pkgname.pam"
        "jsmn-$_jsmnver.tar.gz::https://github.com/zserge/jsmn/archive/v$_jsmnver.tar.gz")
sha256sums=('7eabb1be36183a6c6c7505c5dcfde284b7722c095d925c6a03add9bd0a82774b'
            '463df53fa6c3b0532fa5325c495bbb0c808a04ea6aef9813cb7bf8a14d040277'
            '5f0913a10657fe7ec8d5794ccf00a01000e3e1f2f1e1f143c34a0f7b47edcb38')

prepare() {
	cd "$_archive"
	rm -rf .gitmodules jsmn
	ln -sf ../jsmn-$_jsmnver jsmn
	sed -i -e '/^LIBDIR=/,/^PAM_DIR=/d' Makefile
}

build() {
	cd "$_archive"
	make
}

package() {
	cd "$_archive"
	make DESTDIR="$pkgdir/" PAM_DIR="/usr/lib/security" install
	install -Dm644 ../$pkgname.pam "$pkgdir/etc/pam.d/${pkgname#pam-}"
}
