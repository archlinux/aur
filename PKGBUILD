# Maintainer: Your Name <your@email.com>
# Created with assistance from Claude (Anthropic)

pkgname=smp-server
pkgver=6.5.0
pkgrel=1
pkgdesc="SMP relay server for SimpleX Chat - private messaging without user identifiers"
arch=('x86_64' 'aarch64')
url="https://simplex.chat/docs/server.html"
license=('AGPL-3.0-only')

depends=('glibc' 'openssl')

makedepends=(
    'ghcup-hs-bin'
    'pkg-config'
    'zlib'
    'numactl'
)

optdepends=(
    'caddy: reverse proxy for automated Let'\''s Encrypt TLS certificates'
    'tor: Tor/onion address support and SOCKS proxy for .onion SMP servers'
)

install=smp-server.install

source=(
    "simplexmq-${pkgver}.tar.gz::https://github.com/simplex-chat/simplexmq/archive/refs/tags/v${pkgver}.tar.gz"
    "smp-server.service"
    "smp-server.sysusers"
    "smp-server.tmpfiles"
    "smp-server.ini"
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

    cabal build exe:smp-server
}

package() {
    cd "simplexmq-${pkgver}"

    export PATH="$HOME/.ghcup/bin:$PATH"

    # cabal list-bin output gets contaminated by git submodule log messages,
    # so we find the binary directly in the dist-newstyle build tree
    local _bin
    _bin=$(find dist-newstyle -name "smp-server" -type f -perm /111 | head -1)
    install -Dm755 "${_bin}" "${pkgdir}/usr/bin/smp-server"

    install -Dm644 "${srcdir}/smp-server.service" \
        "${pkgdir}/usr/lib/systemd/system/smp-server.service"

    install -Dm644 "${srcdir}/smp-server.sysusers" \
        "${pkgdir}/usr/lib/sysusers.d/smp-server.conf"

    install -Dm644 "${srcdir}/smp-server.tmpfiles" \
        "${pkgdir}/usr/lib/tmpfiles.d/smp-server.conf"

    # ini устанавливается в post_install только если файла ещё нет
    install -Dm640 "${srcdir}/smp-server.ini" \
        "${pkgdir}/etc/opt/simplex/smp-server.ini.new"
}
