# Maintainer: Techcable <$username @ techcable.net>
# Contributor: Dan Shick <dan.shick@gmail.com>
# Contributor: Bao Trinh <qubidt at gmail dot com>

# This package is mirored on github at Techcable/aur-senpai
# PRs and issues welcome

pkgname=senpai
pkgver=0.2.0
pkgrel=2
pkgdesc='TUI IRC Client Created by ~taiite'
url=https://sr.ht/~taiite/senpai/
arch=(x86_64 aarch64)
license=('ISC')
# Due to a naming conflict, this package was previously named 'senpai-irc'
#
# As of Jun 27, 2023, the other package has been removed.
# I have renamed the package to be more accurate.
#
# The binary continues to be aliased to "senpai-irc" for clarity and compatibility.
replaces=('senpai-irc')
conflicts=('senpai-git' 'senpai-irc-git')
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
