# Maintainer: taotieren <admin@taotieren.com>

pkgbase=cloud-fs-bin
pkgname=clouddrive
_pkgver=0.5.9-4
pkgver=${_pkgver/-/_}
pkgrel=1
epoch=2
pkgdesc="CloudDrive - Unlocking the Unlimited Possibilities of Cloud Storage"
arch=('x86_64' 'aarch64')
url="https://github.com/cloud-fs/cloud-fs.github.io"
license=('custom' 'Commercial')
provides=(${pkgbase%-bin} ${pkgname} ${pkgname}2)
conflicts=(${pkgbase%-bin} ${pkgname} ${pkgname}2)
replaces=()
depends=(fuse3
    systemd)
makedepends=(libarchive)
optdepends=('docker: Pack, ship and run any application as a lightweight container')
backup=()
options=(!strip)
install=
source=("LICENSE.html::https://raw.githubusercontent.com/cloud-fs/cloud-fs.github.io/gh-pages/eula.html")
source_x86_64=("${pkgname}-${epoch}-${_pkgver}-x86_64.tgz::${url}/releases/download/v${_pkgver}/${pkgname}-${epoch}-linux-x86_64-${_pkgver}.tgz")
source_aarch64=("${pkgname}-${epoch}-${_pkgver}-aarch64.tgz::${url}/releases/download/v${_pkgver}/${pkgname}-${epoch}-linux-aarch64-${_pkgver}.tgz")
sha256sums=('c336f41e259916212c7fdd3e21a26a2faf94d725b5daf686bca501978efbf17e')
sha256sums_x86_64=('3e19706d7f0ab6f16a4cf04e828afd9122d13835d043f2006bc8b89ee5fe8ae6')
sha256sums_aarch64=('218bb7d8811836c8684b8915486fed1e43385d29309843b2f7fff37a4b8a1da7')
noextract=(
    ${pkgname}-${epoch}-x86_64-${_pkgver}.tgz
    ${pkgname}-${epoch}-aarch64-${_pkgver}.tgz)

_install_path="opt/${pkgname}"

package() {
    cd ${srcdir}
    install -dm755 ${pkgdir}/${_install_path} \
        "${pkgdir}"/media/clouddrive

    bsdtar -xf "${pkgname}-${epoch}-${_pkgver}-${CARCH}.tgz" --strip-components=2 -C ${pkgdir}/${_install_path}

#     sed -i 's/\\//g' "${pkgdir}/${_install_path}"/wwwroot/*.js

    install -Dm755 /dev/stdin  "${pkgdir}/usr/bin/${pkgname}" << EOF
#!/usr/bin/env bash

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
