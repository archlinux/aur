# Maintainer: Tobias Borgert <tobias (dot) borgert (at) gmail (dot) com>

pkgname=defyne-git
pkgver=r218.3973335
pkgrel=1
pkgdesc="Work-in-progress Fyne IDE"
arch=('x86_64' 'armv7h')
url="https://github.com/fyne-io/defyne"
license=('BSD-3-Clause')
conflicts=('defyne')
provides=('defyne')
makedepends=('git' 'go')
source=("${pkgname}::git+https://github.com/fyne-io/defyne#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
    cd "${pkgname}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build .
}

package() {
    cd "${pkgname}"
    install -Dm00644 LICENSE "${pkgdir}"/usr/share/licenses/defyne/LICENSE
    install -Dm00755 defyne "${pkgdir}"/usr/bin/defyne
}
