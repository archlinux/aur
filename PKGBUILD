# Maintainer: Yuanji <self@gimo.me>
pkgname=gohack-git
_pkgname=gohack
pkgver=1.0.2.r7.g03d2ff3
pkgrel=1
pkgdesc="Make temporary edits to your Go module dependencies"
arch=('i686' 'x86_64')
url="https://github.com/rogpeppe/gohack"
license=('MIT')
makedepends=('git' 'go' 'rsync')
conflicts=('gohack')
provides=('gohack')
source=("gohack::git+https://github.com/rogpeppe/gohack#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    export GOPATH="${srcdir}/gopath"
    export PATH="${srcdir}/gopath/bin:$PATH"

    cd "${srcdir}/${_pkgname}"
    go build \
      -trimpath \
      -buildmode=pie \
      -mod=readonly \
      -modcacherw \
      -ldflags "-s -w -X main.version=\"${pkgver}\" -linkmode external -extldflags \"${LDFLAGS}\"" \
      -o bin/gohack ./
}

package() {
    install -Dm755 "${srcdir}/${_pkgname}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
