# Maintainer: Senge Dev <sengedev at gmail dot com>
# Contributor: Senge Dev <sengedev at gmail dot com>

pkgname=1panel-dev-bin
pkgver=1.10.1_alpha.5
pkgrel=1
pkgdesc="1Panel is a modern and open source Linux panel."
arch=('x86_64' 'aarch64')
url="https://1panel.cn"
license=('GPL-3.0-or-later')
_1panel_original_port=`expr $RANDOM % 55535 + 10000`
_1panel_original_username=$(pwgen -nABCv 10 1)
_1panel_original_password=$(pwgen -nBCv 20 1)
_1panel_original_entrance=$(pwgen -nABCv 10 1)
install=1panel.install

makedepends=(
    'pwgen'
)
optdepends=(
    'ufw'
    'firewalld'
    'docker'
    'docker-compose'
)
conflicts=(
    '1panel-bin'
    '1panel-git'
)
source_aarch64=("${pkgname}-${pkgver//_/-}-arm64.tar.gz::https://resource.fit2cloud.com/1panel/package/dev/v${pkgver//_/-}/release/1panel-v${pkgver//_/-}-linux-arm64.tar.gz")
source_x86_64=("${pkgname}-${pkgver//_/-}-amd64.tar.gz::https://resource.fit2cloud.com/1panel/package/dev/v${pkgver//_/-}/release/1panel-v${pkgver//_/-}-linux-amd64.tar.gz")
sha256sums_x86_64=("21b68b6434bde83045727f150b035ecb002e8166602ff4e0b0ee2836b5cacdcb")
sha256sums_aarch64=("366c2d3eb98f4ac167e5dde87c4db4143df72c0ce99b840b14fcd87f616cf006")

build() {
    # Override the upstream 1pctl script
    cat > ${srcdir}/1pctl << EOF
#!/bin/bash
BASE_DIR=/opt
ORIGINAL_PORT=${_1panel_original_port}
ORIGINAL_VERSION=${pkgver}
ORIGINAL_ENTRANCE=${_1panel_original_entrance}
ORIGINAL_USERNAME=${_1panel_original_username}
ORIGINAL_PASSWORD=${_1panel_original_password}
1panel \$@
EOF
}

package() {
    install -vd ${pkgdir}/opt/1panel
    install -vDm755 ${srcdir}/*/1panel ${pkgdir}/usr/bin/1panel
    install -vDm644 ${srcdir}/*/1panel.service -t ${pkgdir}/usr/lib/systemd/system
    install -vDm755 ${srcdir}/*/1pctl ${pkgdir}/usr/bin/1pctl
}
