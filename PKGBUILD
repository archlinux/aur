# Maintainer: Techcable <$username @ techcable.net>
# Contributor: Dan Shick <dan.shick@gmail.com>

pkgname=senpai-irc
pkgver=0.1.0
pkgrel=1
pkgdesc='TUI IRC Client Created by ~taiite'
url=https://sr.ht/~taiite/senpai/
arch=(x86_64 aarch64)
license=('ISC')
# NOTE: The `senpai` package is unrelated, but provides a binary with a similar name
#
# As a result, our packages conflicts. Both packages seem to be low-usage in practice,
# so I am going to stick with the binary's original name.
#
# Please comment on the AUR board or email me if you want to install both packages and
# this is an issue for you (I'm sure I can work something out)
#
# Also the binary is aliased to "senpai-irc" as a secondary name
conflicts=('senpai-irc-git' 'senpai')
makedepends=('go' 'scdoc')
source=(
  "senpai-v${pkgver}.tar.gz::https://git.sr.ht/~taiite/senpai/archive/v0.1.0.tar.gz"
)
sha256sums=('98e1f16ed97433e1e8c8bdabac1cac1920ddcab90e6cef36d8817a41b45a94ff')

prepare () {
    cd "${srcdir}/senpai-v${pkgver}"
    make clean
}

build () {
    cd "${srcdir}/senpai-v${pkgver}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build ./cmd/senpai
    make doc/senpai.1
    make doc/senpai.5
}

package () {
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/man/man1"
    mkdir -p "${pkgdir}/usr/share/man/man5"
    cp "${srcdir}/senpai-v${pkgver}/senpai" "${pkgdir}/usr/bin/senpai"
    cp "${srcdir}/senpai-v${pkgver}/doc/senpai.1" "${pkgdir}/usr/share/man/man1/"
    cp "${srcdir}/senpai-v${pkgver}/doc/senpai.5" "${pkgdir}/usr/share/man/man5/"
    # Alias binary as "senpai-irc" (gives compat with senpai-irc-git)
    ln -s "${pkgdir}/usr/bin/senpai" "senpai-irc"
}

