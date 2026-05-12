# Maintainer: taotieren <admin@taotieren.com>

pkgbase=opentracejtag-git
pkgname=opentracejtag-git
pkgver=r30.63ae884
pkgrel=1
pkgdesc="A unified Go toolkit for PCB design analysis and JTAG boundary scan testing."
arch=($CARCH)
url="https://github.com/OpenTraceLab/OpenTraceJTAG"
license=('GPL-3.0-or-later')
groups=()
provides=(${pkgbase%-git})
conflicts=(${pkgbase%-git})
replaces=()
depends=(
    glibc
    libglvnd
    libusb
    libx11
    libxcursor
    libxfixes
    libxkbcommon
    libxkbcommon-x11
    wayland
)
makedepends=(
    git
    go
    pkgconf
    eglexternalplatform
    vulkan-headers
)
checkdepends=()
optdepends=(
    'kicad: Electronic schematic and printed circuit board (PCB) design tools'
    'ttf-jetbrains-mono: Typeface for developers, by JetBrains'
)
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
options=()

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^[vV]//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare()
{
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    export GO111MODULE=on
    export GOPROXY=https://goproxy.cn,direct
    make build
}

package() {
    cd "${srcdir}/${pkgname}"
    make install
    install -vDm755 bin/* -t "${pkgdir}/usr/bin/"
    install -vDm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -vDm644 docs/*.md -t "${pkgdir}/usr/share/doc/${pkgname}/docs"
    # install -vDm644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
