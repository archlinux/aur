# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=dnscontrol-ovh-git
pkgver=latest.r1868.6c7a9203
pkgrel=1
pkgdesc="Synchronize your DNS to multiple providers from a simple DSL (with OVH fixes)"
arch=('x86_64')
url="https://github.com/masterzen/dnscontrol.git"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go-pie')
provides=("${pkgname%-ovh-git}")
conflicts=("${pkgname%-ovh-git}")
source=("${pkgname}::git+${url}#branch=masterzen/fix-ovh-native-type-handling")
b2sums=('SKIP')

pkgver() {
         cd "${pkgname}"
         echo "$(git describe --tags --abbrev=0 | sed 's/^v//').r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
          mkdir -p "${srcdir}/gopath/src/github.com/HLFH"
          ln -rTsf "${pkgname}" "${srcdir}/gopath/src/github.com/HLFH/${pkgname%-ovh-git}"
}

build() {
        export GOPATH="${srcdir}/gopath"
        cd "${GOPATH}/src/github.com/HLFH/${pkgname%-ovh-git}"

	GO111MODULE=on go run build/build.go -os=linux
	go clean -modcache
}

package() {
          install -Dm755 "${srcdir}/gopath/src/github.com/HLFH/${pkgname%-ovh-git}/${pkgname%-ovh-git}-Linux" "${pkgdir}/usr/bin/${pkgname%-ovh-git}"
          install -Dm644 "${srcdir}/gopath/src/github.com/HLFH/${pkgname%-ovh-git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
