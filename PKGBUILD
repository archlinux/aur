# Maintainer: Daniele Fucini <dfucini [at] gmail [dot] com>

pkgname=git-monitor-git
_pkgname=git-monitor
pkgdesc='Monitor Git repositories for new commits'
pkgver=r37.a0fa2fe
pkgrel=2
url="https://github.com/Kriechi/${_pkgname}"
arch=('x86_64')
license=('MIT')
makedepends=('git'
             'go')
source=("git+${url}.git#branch=master")
sha256sums=('SKIP')

pkgver()
{
    cd ${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare()
{
    git -C ${srcdir}/${_pkgname} clean -dfx
}

build()
{
    cd ${srcdir}/${_pkgname}
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    mkdir -p build/
    go build -o build ./...
}

package()
{
  cd ${srcdir}/${_pkgname}
  install -Dm755 build/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
