# Maintainer: lorwp <lorwp at lorwp dot cc>
pkgname=strongdmm
pkgver="2.7.4.alpha"
pkgrel=1
pkgdesc="An alternative yet robust map editor for BYOND."
arch=('x86_64')
url="https://github.com/SpaiR/StrongDMM/"
_tag=090c456f7ca26c24321c1347a6da2a8a9c8d2386 # git rev-parse v$pkgver
source=("git+$url#tag=$_tag")
license=('GPL3')
depends=('gtk3' 'glibc')
makedepends=('cargo' 'go' 'xorg-server-devel' 'git' 'gendesk')
optdepends=('byond: For compliling created maps')
sha256sums=('SKIP')
pkgver() { # <https://wiki.archlinux.org/title/Arch_package_guidelines#Package_versioning>
    cd "StrongDMM"
    git describe --tags | sed 's/^v//'
}
prepare() {
    gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --exec "/usr/bin/sdmm"
}
build() {
    cd $srcdir/StrongDMM/third_party/sdmmparser/src
    cargo build --release

    cd $srcdir/StrongDMM/
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    go build \
    -buildmode=pie \
    -trimpath \
    -ldflags="-linkmode=external -X sdmm/internal/env.Version=$(git describe --tags --always) -X sdmm/internal/env.Revision=$(git rev-parse --short HEAD)" \
    .
}
package() {
    cd $srcdir
    install -Dm755 $srcdir/StrongDMM/sdmm "${pkgdir}/usr/bin/sdmm"
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$srcdir/StrongDMM/docs/sdmm-logo.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
