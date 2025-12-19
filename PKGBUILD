# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=goplus
pkgname=xgo
pkgver=1.5.3
pkgrel=1
pkgdesc="XGo is a programming language that reads like plain English and lets you leverage assets from C/C++, Go, Python, and JavaScript/TypeScript"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${pkgname}"
license=('Apache-2.0')

provides=("${pkgname}")
depends=('bash' 'glibc')
conflicts=('goplus')
replaces=('goplus')
makedepends=('go')

source=("${pkgname}-${pkgver}.tgz::https://github.com/${_pkgauthor}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('af10b9e8d3980e4c4f4b9bf3d341e3d1dd72d1324ca26825b360c3ce865b7da0')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	go mod tidy
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	export GOPROOT_FINAL=${pkgdir}/usr/lib/xgo
	export CGO_ENABLED=0

	go build -trimpath -o "${pkgname}" ./cmd/${pkgname}
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	mkdir -p ${pkgdir}/usr/{bin,lib/xgo}
	cp -r * ${pkgdir}/usr/lib/xgo

	ln -s /usr/lib/xgo/${pkgname} ${pkgdir}/usr/bin/
}
