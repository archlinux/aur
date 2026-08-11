# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=qeli-bin
pkgver=0.7.14
pkgrel=1
pkgdesc='Self-hosted obfuscated VPN with anti-DPI masking and post-quantum crypto'
arch=('x86_64')
url='https://qeli.ru'
license=('AGPL-3.0-only')
depends=('gcc-libs' 'glibc' 'iproute2' 'iptables')
optdepends=('systemd: systemd service, resolvectl DNS integration')
provides=('qeli')
conflicts=('qeli')
backup=(
    'etc/qeli/client-reality.conf.example'
    'etc/qeli/client.conf.example'
    'etc/qeli/server-multiprofile.conf.example'
    'etc/qeli/server.conf.example'
    'etc/qeli/users.conf.example'
)
options=('!debug')

_gh_repo='litvinovtd/qeli'

source=(
    "${pkgname}-${pkgver}.deb::https://github.com/${_gh_repo}/releases/download/v${pkgver}/qeli_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/${_gh_repo}/v${pkgver}/LICENSE"
    'qeli.sysusers'
    'qeli.tmpfiles'
)
sha256sums=('2838930cd2e7563642fe8532c68bb7037ed9493cbeb6e5d59d52ed4bc6380942'
            '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0'
            '02857c110cb5b4a482ab360760e5c29abf6e4eaf27ad0ca901d8a7b278c913c0'
            '18b66c713abb9eed1eab4655129c7347d8417a0ad9fc59b27dffeaf0f575c161')

latestver() {
    gh api --paginate "repos/${_gh_repo}/releases" --jq \
        '.[] | select(.draft == false) | select(any(.assets[].name; test("^qeli_[0-9]+(\\.[0-9]+)*_amd64\\.deb$"))) | .tag_name' |
        sed -nE 's/^v([0-9]+(\.[0-9]+)*)$/\1/p' | sort -V | tail -1
}

package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"

    install -d "${pkgdir}/usr/lib"
    mv "${pkgdir}/lib/systemd" "${pkgdir}/usr/lib/"
    rmdir "${pkgdir}/lib"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 qeli.sysusers "${pkgdir}/usr/lib/sysusers.d/qeli.conf"
    install -Dm644 qeli.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/qeli.conf"
}
