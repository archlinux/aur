# Maintainer: taotieren <admin@taotieren.com>

pkgbase=cloud-fs-bin
pkgname=clouddrive
pkgver=0.5.7
pkgrel=2
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
source_x86_64=("${pkgname}-2-x86_64-${pkgver}.tgz::${url}/releases/download/v${pkgver}/clouddrive-2-linux-x86_64-${pkgver}.tgz")
source_aarch64=("${pkgname}-2-aarch64-${pkgver}.tgz::${url}/releases/download/v${pkgver}/clouddrive-2-linux-aarch64-${pkgver}.tgz")
sha256sums_x86_64=('2786d0758d1931fded8c9e100842716223b88eb7bea3548cd35e2b0b23fb1420')
sha256sums_aarch64=('dca197266a6abfb74af5c4268327b4c97785a04b84edd924915b22f2a7a2b8b5')
noextract=(
    ${pkgname}-2-x86_64-${pkgver}.tgz
    ${pkgname}-2-aarch64-${pkgver}.tgz)

_install_path="opt/${pkgname}"

package() {
    cd ${srcdir}
    install -dm755 ${pkgdir}/${_install_path} \
        "${pkgdir}"/media/clouddrive

    bsdtar xf "${pkgname}-2-${CARCH}-${pkgver}.tgz" --strip-components=2 -C ${pkgdir}/${_install_path}

    sed -i 's/\\//g' "${pkgdir}/${_install_path}"/wwwroot/*.js

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
#     install -Dm644 "${pkgdir}/${_install_path}/LICENSE*" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
