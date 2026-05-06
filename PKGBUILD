# Maintainer: Your Name <your@email.com>
# Created with assistance from Claude (Anthropic)

pkgname=xftp-server
pkgver=6.5.0
pkgrel=3
pkgdesc="XFTP relay server for SimpleX Chat - private file transfer without metadata"
arch=('x86_64' 'aarch64')
url="https://simplex.chat/docs/xftp-server.html"
license=('AGPL-3.0-only')

depends=('glibc' 'openssl')

makedepends=(
    'ghcup-hs-bin'
    'pkg-config'
    'zlib'
    'numactl'
)

optdepends=(
    'tor: Tor/onion address support'
)

keywords=('simplex' 'simplex-chat' 'simplex-server' 'xftp' 'file-transfer' 'privacy')

options=('!debug')
install=xftp-server.install

source=(
    "simplexmq-${pkgver}.tar.gz::https://github.com/simplex-chat/simplexmq/archive/refs/tags/v${pkgver}.tar.gz"
    "xftp-server.service"
    "xftp-server.sysusers"
    "xftp-server.tmpfiles"
    "xftp-server.ini"
)
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)

_ghc_ver="9.6.3"
_cabal_ver="3.16.1.0"

prepare() {
    export PATH="$HOME/.ghcup/bin:$PATH"

    cabal update
}

build() {
    cd "simplexmq-${pkgver}"

    export PATH="$HOME/.ghcup/bin:$PATH"

    cabal build exe:xftp-server
}

package() {
    cd "simplexmq-${pkgver}"

    export PATH="$HOME/.ghcup/bin:$PATH"

    local _bin
    _bin=$(find dist-newstyle -name "xftp-server" -type f -perm /111 | head -1)
    install -Dm755 "${_bin}" "${pkgdir}/usr/bin/xftp-server"

    install -Dm644 "${srcdir}/xftp-server.service" \
        "${pkgdir}/usr/lib/systemd/system/xftp-server.service"

    install -Dm644 "${srcdir}/xftp-server.sysusers" \
        "${pkgdir}/usr/lib/sysusers.d/xftp-server.conf"

    install -Dm644 "${srcdir}/xftp-server.tmpfiles" \
        "${pkgdir}/usr/lib/tmpfiles.d/xftp-server.conf"

    # ini устанавливается в post_install только если файла ещё нет
    install -Dm640 "${srcdir}/xftp-server.ini" \
        "${pkgdir}/etc/opt/simplex-xftp/file-server.ini.new"
}
