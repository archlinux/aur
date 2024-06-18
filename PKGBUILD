# Maintainer: Tobias Borgert <tobias (dot) borgert (at) gmail (dot) com>

pkgname=fin-git
pkgver=r112.23e4e32
pkgrel=1
pkgdesc="A minimal but good-looking login manager for Linux/Unix"
arch=('x86_64' 'armv7h')
url="https://github.com/FyshOS/fin"
license=('BSD-3-Clause')
conflicts=('fin')
provides=('fin')
depends=('libx11')
makedepends=('git' 'go')
source=("${pkgname}::git+https://github.com/FyshOS/fin.git#branch=main" "display_manager")
sha256sums=('SKIP'
            'ee917d55042f78b8bb03f5467e5233e3e2ddc2fe01e302bc53b218003fe22275')

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
    install -Dm00644 display_manager "${pkgdir}"/etc/pam.d/display_manager
    cd "${pkgname}"
    install -Dm00644 LICENSE "${pkgdir}"/usr/share/licenses/fin/LICENSE
    install -Dm00755 fin "${pkgdir}"/usr/bin/fin
    install -Dm00755 fin.service "${pkgdir}"/usr/lib/systemd/system/fin.service
}
