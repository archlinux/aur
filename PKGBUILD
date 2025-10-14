# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Bastien 'neitsab' Traverse <neitsab@archlinux.org>
# Contributor: Felix Buehler
# Contributor: zethra <jediben97@gmail.com>

_pkgauthor=bmaltais
_pkgname=primitive
pkgname=${_pkgname}
pkgver=1.0
pkgrel=1
pkgdesc="Reproducing images with geometric primitives"
arch=('i686' 'x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
depends=('glibc')
makedepends=('git' 'go')
optdepends=('imagemagick: for GIF output support')

source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/1.0.tar.gz")
sha256sums=('f3fa7b3552de9a157f4a4e558f19c3a40c04b61b14ce8f4368d5ef36d5093af6')

build() {
	unset GOBIN
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOPATH="${srcdir}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -modcacherw"

	go install -v -gcflags "-trimpath $GOPATH/src" "${url#https://}@${pkgver}"
}

package() {
	install -Dm755 "${srcdir}/bin/${_pkgname}" "$pkgdir/usr/bin/${pkgname}"

	install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
