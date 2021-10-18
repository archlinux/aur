# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname=image-tools
pkgdesc='Tools to manipulate system images in OCI format'
pkgver=1.0.0_rc3
pkgrel=1
arch=(x86_64)
depends=(glibc)
makedepends=(go go-md2man make)
url='https://github.com/opencontainers/image-tools'
license=(custom:Apache-2.0)
source=("${url}/archive/v${pkgver//_/-}.tar.gz")
sha512sums=('ef870d95bf287210dfa34808097cd344fcfe52831335d73a56df0919bc6310acf5e7f5d66fc7191f7f34fc524aee2885542e267a279e2cde437bc9ed8a09e8ca')
	
_gorepo=${url#https://}

prepare () {
	mkdir -p "_go/src/${_gorepo%${pkgname}}"
	ln -fs "$(pwd)/${pkgname}-${pkgver//_/-}" "_go/src/${_gorepo}"
}

build () {
	export GOPATH="$(pwd)/_go"
	export GO111MODULE=off
	cd "_go/src/${_gorepo}"
	make
}

package () {
	export GOPATH="$(pwd)/_go"
	export GO111MODULE=off
	cd "_go/src/${_gorepo}"
	DESTDIR="${pkgdir}" make install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
