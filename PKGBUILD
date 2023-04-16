# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=earthly
pkgver=0.7.4
pkgrel=1
pkgdesc='A build automation tool that executes in containers'
arch=('x86_64')
url='https://earthly.dev/'
license=('MPL2')
depends=('docker')
makedepends=('git' 'go')
BUILDENV+=('!check')
source=("git+https://github.com/earthly/earthly.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
    mkdir -p earthly/build
}

build() {
    local _ldflags='-linkmode=external'
    _ldflags+=" -X main.DefaultBuildkitdImage=docker.io/earthly/buildkitd:v${pkgver}"
    _ldflags+=" -X main.Version=${pkgver}"
    _ldflags+=" -X main.GitSha=$(git -C earthly rev-parse HEAD)"
    local _tags='dfrunmount,dfrunsecurity,dfsecrets,dfssh,dfrunnetwork,dfheredoc,forceposix'
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
    cd earthly
    go build -tags "$_tags" -ldflags "$_ldflags" -o build ./cmd/...
}

check() {
    cd earthly
    go test ./...
}

package() {
    install -D -m755 earthly/build/earthly -t "${pkgdir}/usr/bin"
}
