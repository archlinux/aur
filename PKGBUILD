# Maintainer: Christian Pfeiffer <cpfeiffer@live.de> 

pkgname=ircdog
pkgver=0.5.5
pkgrel=1
pkgdesc="Tool for sending and receiving raw IRC protocol lines"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/ergochat/ircdog"
license=('LicenseRef-ISC')
depends=('glibc')
makedepends=('go' 'git')
source=("git+$url#tag=v$pkgver")
sha256sums=('8299fb27db93fbd4ebee34dcd85152d953f4d10aed3cd29c795664dae8794351')

build() {
    GOPATH=$(pwd)/..
    export GOPATH
    cd "${srcdir}/ircdog" || exit

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"

    go build \
        -trimpath \
        -buildmode=pie \
        -mod=vendor \
        -modcacherw \
        -ldflags "-compressdwarf=false -linkmode external -extldflags \"${LDFLAGS}\"" \
        -v \
        .
}

package() {
    cd "${srcdir}/ircdog" || exit
    install -Dm755 ircdog "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
