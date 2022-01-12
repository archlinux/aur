# Maintainer: Vasil Bakalov <jens300304@gmail.com>
pkgname=danser-git
url="https://github.com/Wieku/danser-go"
pkgver=0.6.8.r1.g5fb69fb4
pkgrel=1
pkgdesc="Dancing visualizer of osu! maps and custom osu! client written in Go (git version)"
arch=('any')
license=('MIT')
source=("git+https://github.com/Wieku/danser-go.git")
conflicts=('danser')
sha256sums=('SKIP')
depends=(
    'libyuv'
    'ffmpeg'
)
makedepends=(
    'xorg-server-devel'
    'go>=1.17'
    'git'
    'gcc'
)

pkgver() {
    cd "${srcdir}/danser-go"
    git describe --long --tags --abbrev=8 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/danser-go"
    git checkout dev
}

build() {
    cd "${srcdir}/danser-go"

    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
        .
}

package() {
    cd "${srcdir}/danser-go"
    mkdir -p "${pkgdir}/usr/lib/danser" "${pkgdir}/usr/bin"

    install -Dm755 libbass.so libbass_fx.so libbassmix.so "${pkgdir}/usr/lib/danser"
    cp -r "assets" "${pkgdir}/usr/lib/danser/assets"
    chmod 755 "${pkgdir}/usr/lib/danser/assets"

    install -Dm755 danser-go "${pkgdir}/usr/lib/danser/danser"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    ln -s "/usr/lib/danser/danser" "${pkgdir}/usr/bin/danser"
}
