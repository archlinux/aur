# Maintainer: Guru <anjanaya@gmail.com>
pkgname=pgboxdb-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Lightweight Postgres for AI agents: thousands of isolated databases in one runtime (formerly PGX)"
arch=('x86_64' 'aarch64')
url="https://pgboxdb.com/"
license=('AGPL-3.0-only' 'PostgreSQL')
depends=('gcc-libs' 'glibc')
provides=('pgboxdb')
conflicts=('pgboxdb')
options=('!debug')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/pgrundev/pgboxdb/releases/download/v${pkgver}/pgboxdb-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/pgrundev/pgboxdb/releases/download/v${pkgver}/pgboxdb-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('72fcf76dde297084f146f9fa3475c49de3e77dd1213fcbb6a02d45f0f656cdba')
sha256sums_aarch64=('74bcdcd73115c7ae180c8356e37b1152efee0194301df7cc21685a6cc5611884')

package() {
    local _arch=amd64
    [[ ${CARCH} == aarch64 ]] && _arch=arm64
    cd "pgboxdb-${pkgver}-linux-${_arch}"

    # pgboxdb finds its bundled postgres and share/ data relative to <prefix>/bin,
    # so keep the tree together and keep the bundled postgres out of /usr/bin
    install -dm755 "${pkgdir}/usr/lib/pgboxdb"
    cp -a bin share "${pkgdir}/usr/lib/pgboxdb/"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s ../lib/pgboxdb/bin/pgboxdb "${pkgdir}/usr/bin/pgboxdb"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 NOTICE THIRD-PARTY-LICENSES.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
