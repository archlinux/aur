# Maintainer: taotieren <admin@taotieren.com>

pkgbase=cloud-fs-bin
pkgname=clouddrive
pkgver=0.6.7
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
install=${pkgname}.install
source=("LICENSE.html::https://raw.githubusercontent.com/cloud-fs/cloud-fs.github.io/gh-pages/eula.html"
    "${pkgname}.install")
source_x86_64=("${pkgname}-${epoch}-x86_64-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${pkgname}-${epoch}-linux-x86_64-${pkgver}.tgz")
source_aarch64=("${pkgname}-${epoch}-aarch64-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${pkgname}-${epoch}-linux-aarch64-${pkgver}.tgz")
sha256sums=('c336f41e259916212c7fdd3e21a26a2faf94d725b5daf686bca501978efbf17e'
            'ee61e58c618535b420f5fcbc0d7b7d803bc6aec7f261bd595867152806f939aa')
sha256sums_x86_64=('1a70b18c010633fb641e5d0c3092fb292d68f913f1072df58861481ee6204564')
sha256sums_aarch64=('423015a18bf9546d93b55bf1464156bd06248485c183e5e832ae384808e950cb')
noextract=(
    ${pkgname}-${epoch}-x86_64-${pkgver}.tgz
    ${pkgname}-${epoch}-aarch64-${pkgver}.tgz)

_install_path="opt/${pkgname}"

package() {
    cd ${srcdir}
    install -dm755 ${pkgdir}/${_install_path} \
        "${pkgdir}"/media/clouddrive

    bsdtar -xf "${pkgname}-${epoch}-${CARCH}-${pkgver}.tgz" --strip-components=2 -C ${pkgdir}/${_install_path}

#     sed -i 's/\\//g' "${pkgdir}/${_install_path}"/wwwroot/*.js

    install -Dm755 /dev/stdin  "${pkgdir}/usr/bin/${pkgname}" << EOF
#!/usr/bin/env bash

cd /opt/clouddrive
./clouddrive
EOF

    install -Dm644 /dev/stdin  "${pkgdir}/usr/lib/systemd/system/${pkgname}.service" << EOF
[Unit]
Description="CloudDrive"
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
