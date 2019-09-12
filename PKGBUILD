# Maintainer: Vianney le Clément de Saint-Marcq <code AT quartic·eu>
pkgname=codimd-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="Realtime collaborative markdown notes"
arch=('x86_64')
url="https://github.com/codimd/server"
license=('AGPL3')
makedepends=('skopeo' 'undocker')
options=('!strip')
backup=('etc/codimd/environment'
        'etc/codimd/config.json')
source=('codimd.service'
        'sysusers.conf'
        'environment'
        'config.json')
sha256sums=('dcb7d3a23b8d3be3a5b1067dc71e0e25046962c8bcf4e90e808cd9005fb32241'
            '25e696ca1202b9df1287e23f40ffa8b909a629f4b3916c572561d953e44e3b22'
            '523ccf9d8c1795bd70523f22b0268be3efdc42a3e8bed7008285bc3b894e53c2'
            'befaec00c6bfd3e6472659ae52639cd94ddd8d10edb5c7d0301ede6d9a817917')

_dockerimage="linuxserver/codimd:1.5.0-ls12"

prepare() {
    rm -f codimd.tar
    skopeo copy "docker://${_dockerimage}" "docker-archive:${srcdir}/codimd.tar:latest"
}

package() {
    mkdir -p "${pkgdir}/opt/codimd"
    cat codimd.tar | undocker -o "${pkgdir}/opt/codimd"
    install -Dm644 codimd.service "${pkgdir}/usr/lib/systemd/system/codimd.service"
    install -Dm644 sysusers.conf "${pkgdir}/usr/lib/sysusers.d/codimd.conf"
    install -Dm600 environment "${pkgdir}/etc/codimd/environment"
    install -Dm644 config.json "${pkgdir}/etc/codimd/config.json"
}
