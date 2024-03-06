# Maintainer: Senge Dev <sengedev at gmail dot com>
# Contributor: Senge Dev <sengedev at gmail dot com>


pkgname=1panel-bin
pkgver=1.10.0_lts
pkgrel=3
pkgdesc="1Panel is a modern and open source Linux panel."
arch=('x86_64' 'aarch64')
url="https://1panel.cn"
license=('GPL-3.0-or-later')
_1panel_original_port=`expr $RANDOM % 55535 + 10000`
_1panel_original_username=$(pwgen -nABCv 10 1)
_1panel_original_password=$(pwgen -nBCv 20 1)
_1panel_original_entrance=$(pwgen -nABCv 10 1)
install=1panel-bin.install
depends=(
    'docker'
    'docker-compose'
)
makedepends=(
    'pwgen'
)
optdepends=(
    'ufw'
    'firewalld'
)
conflicts=('1panel-dev-bin')
source_aarch64=("${pkgname}-${pkgver//_/-}-arm64.tar.gz::https://resource.fit2cloud.com/1panel/package/stable/v${pkgver//_/-}/release/1panel-v${pkgver//_/-}-linux-arm64.tar.gz")
source_x86_64=("${pkgname}-${pkgver//_/-}-amd64.tar.gz::https://resource.fit2cloud.com/1panel/package/stable/v${pkgver//_/-}/release/1panel-v${pkgver//_/-}-linux-amd64.tar.gz")
sha256sums_x86_64=("c3735145fbdc8103ef8b3c1b726cedf8ed05d06aa84b075f3b0d4c0291b76100")
sha256sums_aarch64=("4b223ffdd7e50c2e93bae91fe7dd4aba24153bb2a1f7199883e8e6862e88005e")

build() {
    # Override the upstream 1pctl script
    echo "#!/bin/bash" > ${srcdir}/*/1pctl
    echo "BASE_DIR=/opt" >> ${srcdir}/*/1pctl
    echo "ORIGINAL_PORT=${_1panel_original_port}" >> ${srcdir}/*/1pctl
    echo "ORIGINAL_VERSION=${pkgver//_/-}" >> ${srcdir}/*/1pctl
    echo "ORIGINAL_ENTRANCE=${_1panel_original_entrance}" >> ${srcdir}/*/1pctl
    echo "ORIGINAL_USERNAME=${_1panel_original_username}" >> ${srcdir}/*/1pctl
    echo "ORIGINAL_PASSWORD=${_1panel_original_password}" >> ${srcdir}/*/1pctl
}

package() {
    install -vd ${pkgdir}/opt/1panel
    install -vDm755 ${srcdir}/*/1panel ${pkgdir}/usr/bin/1panel
    install -vDm644 ${srcdir}/*/1panel.service -t ${pkgdir}/usr/lib/systemd/system
    install -vDm755 ${srcdir}/*/1pctl ${pkgdir}/usr/bin/1pctl
}
