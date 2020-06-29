# Maintainer: Max Shaughnessy <msh@lap.is>

pkgname=dnscontrol-git
pkgver=3.2.0.r812.0a36cb7f
pkgrel=1
pkgdesc="Synchronize your DNS to multiple providers from a simple DSL"
arch=('x86_64')
url="https://github.com/StackExchange/dnscontrol.git"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go-pie')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')

pkgver() {
         cd "${pkgname}"
         echo "$(git describe --tags --abbrev=0 | sed 's/^v//').r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
          mkdir -p "${srcdir}/gopath/src/github.com/StackExchange"
          ln -rTsf "${pkgname}" "${srcdir}/gopath/src/github.com/StackExchange/${pkgname%-git}"
}

build() {
        export GOPATH="${srcdir}/gopath"
        cd "${GOPATH}/src/github.com/StackExchange/${pkgname%-git}"

        go build \
           -gcflags "all=-trimpath=${GOPATH}" \
           -asmflags "all=-trimpath=${GOPATH}" \
           -ldflags "-extldflags ${LDFLAGS}" \
           -v .
}

package() {
          install -Dm755 "${srcdir}/gopath/src/github.com/StackExchange/${pkgname%-git}/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
          install -Dm644 "${srcdir}/gopath/src/github.com/StackExchange/${pkgname%-git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
