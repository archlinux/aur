# Maintainer: wvlab <wvlab@murena.io>
_pkgname=space-cli
pkgname=$_pkgname-git
pkgver=r262.3441d6c
pkgrel=1
pkgdesc="Deta Space CLI"
# This architectures are marked as supported in official script to install space-cli 
arch=('x86_64' 'arm64' 'aarch64' 'aarch64_be' 'armv8b' 'armv8l')
url="https://github.com/deta/space-cli.git"
license=('MIT')
makedepends=('go' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    ( set -o pipefail
      git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

build() {
    cd $_pkgname
    
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath"
    
    go build
}

package() {
    cd "$_pkgname"

    install -Dm755 space "$pkgdir"/usr/bin/space
}
