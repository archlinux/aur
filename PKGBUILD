# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=goplus
pkgname=xgo
pkgver=1.6.0
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
sha256sums=('11b2389f189d74843b441f4fc9ebcbb36b0ee5e3787e72db5189af8de2f6b39b')

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
