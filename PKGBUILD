# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=k8s-ldap-auth
pkgdesc="Kubernetes webhook token authentication plugin implementation using ldap."
pkgver=4.0.0
pkgrel=2
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="https://github.com/HopopOps/k8s-ldap-auth"
license=('MPL2')
makedepends=(
    'go'
)

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/HopopOps/k8s-ldap-auth/archive/v${pkgver}.tar.gz"
)

sha256sums=(
    "404606ac6ce95ceebbc30e5df1fc2a4dbec50cdf00e26c907129677903f7340b"
)

prepare(){
  cd $pkgname-$pkgver
  mkdir -p build/
}

build() {
    cd $pkgname-$pkgver
    export GOPATH="$srcdir/gopath"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"

    goversion=$(go version | sed -r 's/go version go(.+)\s.+/\1/')
    gopkg=hopopops/$pkgname

    go build \
      -trimpath \
      -buildmode=pie \
      -mod=readonly \
      -modcacherw \
      -ldflags "\
        -linkmode=external \
        -buildid=''
        -extldflags \"${LDFLAGS}\" \
        -X $gopkg/version.APPNAME=${pkgname} \
        -X $gopkg/version.VERSION=v${pkgver} \
        -X $gopkg/version.GOVERSION=${goversion}" \
      -o build .
}

package() {
    install -D -m0755 "${srcdir}/$pkgname-$pkgver/build/k8s-ldap-auth" "${pkgdir}/usr/bin/k8s-ldap-auth"
}
