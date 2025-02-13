# Maintainer: jacopotediosi <jacopotediosi at gmail dot com>

pkgname=shortscan-git
_pkgname=shortscan
pkgver=0.9.2+r13+g2ba744fe4
pkgrel=1

pkgdesc="An IIS short filename enumeration tool"
arch=('any')
url="https://github.com/bitquark/shortscan"
license=("MIT")

makedepends=(go git)

conflicts=($_pkgname)
provides=($_pkgname)

b2sums=('SKIP')

source=("${pkgname}::git+https://github.com/bitquark/${_pkgname}.git")

pkgver() {
  cd ${pkgname}

  _version=$(git tag --sort=-v:refname --list | head -n1)
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version#'v'}+r${_commits}+g${_short_commit_hash}"
}

prepare() {
    cd ${pkgname}

    mkdir -p build/
}

build() {
    cd ${pkgname}

    export GOPATH="${srcdir}/gopath"
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go build -o build ./...                                          
}

package() {
    cd ${pkgname}

    install -Dm 755 "build/${_pkgname}" -t "${pkgdir}/usr/bin/"
    install -Dm 644 README.md -t           "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm 644 LICENSE.md -t          "${pkgdir}/usr/share/licenses/${pkgname}"
}
