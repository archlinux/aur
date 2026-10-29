# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=ircdog
pkgver=0.5.5
pkgrel=2
pkgdesc="Tool for sending and receiving raw IRC protocol lines"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/ergochat/ircdog"
license=('ISC')
depends=('glibc')
makedepends=('go' 'git')
source=("git+$url#tag=v$pkgver")
sha512sums=('d42baf7125e81d3f167d013df0bbed917548a257251d630e04416d317cb9b0b60502414bb303fb5585be20db0016f3d7cfc54ae7e1f9c072eb8efca3990c31c2')
b2sums=('dc1f357fc60a5ddc3b997adb09be8f8cbdb37685eafb0c375c91f4f9bfd6a8016fa8d68b4455a4b3cb0135c20943a5143e59c6f34f1d7ae14d81bcecf2163129')

build() {
    export GOPATH="$srcdir/gopath"
    cd "${srcdir}/ircdog" || exit

    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"

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
