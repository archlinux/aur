# Maintainer: Techcable <$username @ techcable.net>
# Contributor: Dan Shick <dan.shick@gmail.com>
# Contributor: Bao Trinh <qubidt at gmail dot com>

pkgname=senpai-irc
pkgver=0.2.0
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
source=("senpai-v${pkgver}.tar.gz::https://git.sr.ht/~taiite/senpai/archive/v${pkgver}.tar.gz")
sha256sums=('9786fd83f3e1067549c3c88455a1f66ec66d993fe597cee334d217a5d1cf4803')

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
    make GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw" all
}

package () {
    cd "${srcdir}/senpai-v${pkgver}"
    make "DESTDIR=${pkgdir}" "PREFIX=/usr" install
    # Alias binary as "senpai-irc" (gives compat with senpai-irc-git)
    ln -s "${pkgdir}/usr/bin/senpai" "senpai-irc"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
