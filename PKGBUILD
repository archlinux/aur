# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=earthly-git
pkgver=0.6.2.r3.g42698d34
pkgrel=1
pkgdesc='A build automation tool that executes in containers (git version)'
arch=('x86_64')
url='https://earthly.dev/'
license=('custom: BSL1.1')
depends=('docker')
makedepends=('git' 'go')
provides=('earthly')
conflicts=('earthly')
BUILDENV+=('!check')
source=('git+https://github.com/earthly/earthly.git')
sha256sums=('SKIP')

prepare() {
    mkdir -p earthly/build
}

pkgver() {
    git -C earthly describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//;s/\.rc/rc/'
}

build() {
    local _ldflags='-linkmode=external'
    _ldflags+=' -X main.DefaultBuildkitdImage=docker.io/earthly/buildkitd:latest'
    _ldflags+=' -X main.Version=latest'
    _ldflags+=" -X main.GitSha=$(git -C earthly rev-parse HEAD)"
    local _tags='dfrunmount,dfrunsecurity,dfsecrets,dfssh,dfrunnetwork,dfheredoc'
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
    install -D -m644 earthly/licenses/BSL "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
