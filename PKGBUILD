# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=telemt-bin
pkgver=3.4.12
pkgrel=1
pkgdesc='MTProxy for Telegram on Rust + Tokio'
arch=('x86_64' 'aarch64')
url='https://github.com/telemt/telemt'
license=('LicenseRef-TELEMT-Public-License-3')
install=telemt-bin.install
depends=('gcc-libs' 'glibc')
optdepends=(
    'nginx: when using nginx as reverse proxy'
    'caddy: when using caddy as reverse proxy'
)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')

source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/telemt/telemt/${pkgver}/LICENSE"
    "telemt.service::https://raw.githubusercontent.com/telemt/telemt/${pkgver}/contrib/systemd/telemt.service"
    "telemt.conf::https://raw.githubusercontent.com/telemt/telemt/${pkgver}/contrib/systemd/system-user-telemt.conf"
    "telemt.tmpfiles::https://raw.githubusercontent.com/telemt/telemt/${pkgver}/contrib/systemd/tmpfiles-telemt.conf"
    "telemt.toml.sample::https://raw.githubusercontent.com/telemt/telemt/${pkgver}/config.toml"
)
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/telemt/telemt/releases/download/${pkgver}/telemt-x86_64-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/telemt/telemt/releases/download/${pkgver}/telemt-aarch64-linux-gnu.tar.gz")
sha256sums=('c18e6fce5574fb3c5a19c38e2cc875e9101172c98a67aa1b87004752325994e1'
            '5f0c01dd2395bae6fdb86dd84dc4db5c677b339627b46abd3ca7549c92305bf0'
            '24a9a6c5804d970753641643eaa8f4514886892f3e415cf06fe6d693cda353fb'
            '2caa1b711c8d16cbdb4276bde9160b113f4c0e4d360953b14aa464a55bfa7a3b'
            'd2e5d0a178037def566afb5edfb62325de98ecf85c76fe4852200b85b0d36637')
sha256sums_x86_64=('1bd9a6c52f5a15eedbd3e40dee007534daca802bc995fef0ac47dd0c1561c0de')
sha256sums_aarch64=('9ba18df68c30dcdcaf20c2af7b2b7d9d762ca2a81cf242ce0621f16ff68dbdc5')

latestver() {
    gh api --paginate repos/telemt/telemt/releases \
        --jq '.[] | select(.prerelease == false and .draft == false and any(.assets[]; .name == "telemt-x86_64-v3-linux-musl.tar.gz")) | .tag_name' |
    head -1 | sed 's/^v//'
}

package() {
    install -Dm755 telemt "${pkgdir}/usr/bin/telemt"
    install -Dm644 telemt.service "${pkgdir}/usr/lib/systemd/system/telemt.service"
    install -Dm644 telemt.conf "${pkgdir}/usr/lib/sysusers.d/telemt.conf"
    install -Dm644 telemt.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/telemt.conf"
    install -Dm644 telemt.toml.sample "${pkgdir}/etc/telemt/telemt.toml.sample"
    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
