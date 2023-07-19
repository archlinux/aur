# Maintainer: lorwp <lorwp AT lorwp DOT cc>
pkgname=strongdmm
pkgver="2.7.4.alpha"
pkgdesc="An alternative yet robust map editor for BYOND."
arch=('x86_64')
url="https://github.com/SpaiR/StrongDMM"
source=("https://github.com/SpaiR/StrongDMM/archive/v$pkgver.tar.gz")
license=('GPL')
depends=('')
makedepends=('cargo' 'go' 'xorg-server-devel' 'gtk3' 'git')
optdepends=('byond: For compliling created maps')
sha256sums=('')
build() {
    cd $srcdir/third_party/sdmmparser/src
    cargo build --release

    cd $srcdir
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw -X sdmm/internal/env.Version=$pkgver -X sdmm/internal/env.Revision="
    go build .
}

package() {
    cd $srcdir
    install -Dm755 sdmm "${pkgdir}/usr/bin/sdmm"
}
