# Maintainer: Senge Dev <sengedev at gmail dot com>
# Contributor: Senge Dev <sengedev at gmail dot com>

pkgname=1panel-git
pkgver=1.10.1_alpha.5
pkgrel=1
pkgdesc="1Panel, a modern open source linux panel."
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
    'go'
    'nodejs'
    'git'
)
optdepends=(
    'ufw'
    'firewalld'
    'docker'
    'docker-compose'
)
conflicts=('1panel-dev-bin' '1panel-bin')
source=(
    "${pkgname}"::"git+https://github.com/1Panel-dev/1Panel.git#branch=dev"
    "1panel.service"
)
sha256sums=(
    "SKIP"
    "1d85c0b4a0b7256c75bb14d10d2bfb29fdcfb4c7ebc99622b024bd61be314ea3"
)

build() {
    # Override the upstream 1pctl script
    echo "#!/bin/bash" > ${srcdir}/1pctl
    echo "BASE_DIR=/opt" >> ${srcdir}/1pctl
    echo "ORIGINAL_PORT=${_1panel_original_port}" >> ${srcdir}/1pctl
    echo "ORIGINAL_VERSION=v${pkgver//_/-}" >> ${srcdir}/1pctl
    echo "ORIGINAL_ENTRANCE=${_1panel_original_entrance}" >> ${srcdir}/1pctl
    echo "ORIGINAL_USERNAME=${_1panel_original_username}" >> ${srcdir}/1pctl
    echo "ORIGINAL_PASSWORD=${_1panel_original_password}" >> ${srcdir}/1pctl
    echo "1panel --help" >> ${srcdir}/1pctl
    # Compile 1Panel using Makefile
    cd ${srcdir}/${pkgname}
    make build_all
}

package() {
    install -vd ${pkgdir}/opt/1panel
    install -vDm755 ${srcdir}/${pkgname}/build/1panel ${pkgdir}/usr/bin/1panel
    install -vDm644 ${srcdir}/1panel.service -t ${pkgdir}/usr/lib/systemd/system
    install -vDm755 ${srcdir}/1pctl ${pkgdir}/usr/bin/1pctl
}
