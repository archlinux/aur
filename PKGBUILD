# Maintainer: taotieren <admin@taotieren.com>

pkgbase=cloud-fs-bin
pkgname=clouddrive
_pkgver=0.5.8-pre6
pkgver=${_pkgver/-/_}
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
sha256sums_x86_64=('44b8422459675e1ab1dbe6b32144ec1d4360173b43539251b86966ab73146ec7')
sha256sums_aarch64=('e3c543dcf380aed482e3e60b8579d79981839716fbe7130d6b63ab3e33586c49')
noextract=(
    ${pkgname}-2-x86_64-${_pkgver}.tgz
    ${pkgname}-2-aarch64-${_pkgver}.tgz)

_install_path="opt/${pkgname}"

package() {
    cd ${srcdir}
    install -dm755 ${pkgdir}/${_install_path} \
        "${pkgdir}"/media/clouddrive

    bsdtar -xf "${pkgname}-2-${_pkgver}-${CARCH}.tgz" --strip-components=2 -C ${pkgdir}/${_install_path}

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
Type=forking
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
