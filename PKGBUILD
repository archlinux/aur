# Maintainer: Vasil Bakalov <jens300304@gmail.com>
pkgname=danser-git
url="https://github.com/Wieku/danser-go"
pkgver=0.6.4.r0.gda852a79
pkgrel=1
pkgdesc="Dancing visualizer of osu! maps and custom osu! client written in Go (git version)"
arch=('any')
license=('MIT')
source=("git+https://github.com/Wieku/danser-go.git")
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
    mkdir -p "${pkgdir}/opt/danser-git" "${pkgdir}/usr/bin"
    chmod 777 "${pkgdir}/opt/danser-git"
    install -Dm755 libbass.so libbass_fx.so libbassmix.so "${pkgdir}/opt/danser-git"
    # i hate install i hate install i hate in-
    cp -r "assets" "${pkgdir}/opt/danser-git/assets"
    chmod 755 "${pkgdir}/opt/danser-git/assets"

    install -Dm755 danser-go "${pkgdir}/opt/danser-git/${pkgname}"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    ln -s "${pkgdir}/opt/danser-git/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
