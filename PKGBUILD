# Maintainer: taotieren <admin@taotieren.com>

pkgbase=cloud-fs-bin
pkgname=clouddrive
pkgver=0.5.8_pre1
_pkgver=${pkgver/_/-}
pkgrel=1
epoch=
pkgdesc="CloudDrive - Unlocking the Unlimited Possibilities of Cloud Storage"
arch=('x86_64' 'aarch64')
url="https://github.com/cloud-fs/cloud-fs.github.io"
license=('custom' 'Commercial')
provides=(${pkgname%-bin} clouddrive)
conflicts=(${pkgname%-bin} clouddrive)
replaces=()
depends=(fuse3)
makedepends=(libarchive)
backup=()
options=(!strip)
install=
source=("LICENSE.html::https://raw.githubusercontent.com/cloud-fs/cloud-fs.github.io/gh-pages/eula.html")
source_x86_64=("${pkgname}-2-${_pkgver}-x86_64.tgz::${url}/releases/download/v${_pkgver}/clouddrive-2-linux-x86_64-${_pkgver}.tgz")
source_aarch64=("${pkgname}-2-${_pkgver}-aarch64.tgz::${url}/releases/download/v${_pkgver}/clouddrive-2-linux-aarch64-${_pkgver}.tgz")
sha256sums=('445a37f017c646fe8fcd3cdd24c159e7fed733ace7197b972070d76aca3b83b7')
sha256sums_x86_64=('13956c6760736b67ec20993abf2772df2d73d2b24b69607a64b5a866e14e7410')
sha256sums_aarch64=('c8a785ebe8120b02008bf113b892b72ad467625b143df021d650fda5d306e00d')
noextract=(
    ${pkgname}-2-x86_64-${_pkgver}.tgz
    ${pkgname}-2-aarch64-${_pkgver}.tgz)

_install_path="opt/${pkgname}"

package() {
    cd ${srcdir}
    install -dm755 ${pkgdir}/${_install_path} \
        "${pkgdir}"/media/clouddrive

    bsdtar xf "${pkgname}-2-${_pkgver}-${CARCH}.tgz" --strip-components=2 -C ${pkgdir}/${_install_path}

#     sed -i 's/\\//g' "${pkgdir}/${_install_path}"/wwwroot/*.js

    install -Dm755 /dev/stdin  "${pkgdir}/usr/bin/${pkgname}" << EOF
#!/bin/env bash

cd /opt/clouddrive
./clouddrive
EOF

    install -Dm644 /dev/stdin  "${pkgdir}/usr/lib/systemd/system/${pkgname}.service" << EOF
[Unit]
Description="CloudDrive - Unlocking the Unlimited Possibilities of Cloud Storage"
Wants=network-online.target
After=network-online.target network.target

[Service]
Type=exec
ExecStart=clouddrive

[Install]
WantedBy=multi-user.target
DefaultInstance=default
EOF

    install -Dm644 /dev/stdin "${pkgdir}/etc/systemd/system/docker.service.d/clear_mount_propagation_flags_clouddirve.conf" << EOF
[Service]
MountFlags=shared
EOF

    install -Dm644 "${pkgdir}/usr/lib/systemd/system/${pkgname}.service" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"
    install -Dm644 "${srcdir}"/LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
