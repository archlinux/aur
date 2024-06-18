# Maintainer: Tobias Borgert <tobias (dot) borgert (at) gmail (dot) com>

pkgname=fynedesk-git
pkgver=r1291.bb9b5f6
pkgrel=1
pkgdesc="An easy to use Linux/Unix desktop environment following material design"
arch=('x86_64' 'armv7h')
url="https://fyshos.com/desktop/"
license=('BSD-3-Clause')
conflicts=('fynedesk') 
provides=('fynedesk')
depends=('libx11')
makedepends=('git' 'go')
optdepends=('arandr: for modifying display settings'
            'xorg-xbacklight: for laptop brightness'
            'brightnessctl: for laptop brightness'
            'connman-gtk: used for configuring Wi-Fi network settings'
            'picom: for compositor support')
source=("${pkgname}::git+https://github.com/FyshOS/fynedesk.git#branch=develop")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "${pkgname}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build ./cmd/fynedesk_runner
    go build ./cmd/fynedesk
}

package() {
    cd "${pkgname}"
    install -Dm00644 LICENSE "${pkgdir}"/usr/share/licenses/fynedesk/LICENSE
    install -Dm00755 fynedesk_runner "${pkgdir}"/usr/bin/fynedesk_runner
    install -Dm00755 fynedesk "${pkgdir}"/usr/bin/fynedesk
    install -Dm00644 fynedesk.desktop "${pkgdir}"/usr/share/xsessions/fynedesk.desktop
}
