# Maintainer: OpenSourceGuy <osguy@duck.com>

pkgname=rpris-git
pkgver=r33.13b5fd6
pkgrel=1
pkgdesc='MPRIS to Discord Rich Presence bridge for Linux (tray + CLI)'
arch=('x86_64' 'aarch64')
url='https://gitlab.com/OpenSourceGuy/rpris'
license=('MIT')
depends=('gtk3' 'libayatana-appindicator')
makedepends=('git' 'go' 'gcc' 'pkgconf')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    export CGO_ENABLED=1
    export CGO_CFLAGS="-Wno-deprecated-declarations"
    go build \
        -trimpath \
        -buildmode=pie \
        -ldflags="-s -w -X rpris/version.Version=${pkgver}" \
        -tags tray \
        -o rpris \
        ./cmd/rpris
}

package() {
    cd "${srcdir}/${pkgname%-git}"

    install -Dm755 rpris                              "${pkgdir}/usr/bin/rpris"
    install -Dm644 packaging/rpris.desktop            "${pkgdir}/usr/share/applications/rpris.desktop"
    install -Dm644 packaging/rpris.png               "${pkgdir}/usr/share/icons/hicolor/32x32/apps/rpris.png"
    install -Dm644 LICENSE                            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
