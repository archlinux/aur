# Maintainer: taotieren <admin@taotieren.com>

pkgbase=cloud-fs-bin
pkgname=clouddrive
_pkgver=0.5.9-1
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
sha256sums=('445a37f017c646fe8fcd3cdd24c159e7fed733ace7197b972070d76aca3b83b7')
sha256sums_x86_64=('56ee3922b4e4f3ba6c66effd6946a360160300c910925e5eb12816a9ed0ee7ea')
sha256sums_aarch64=('806fd4abd0ef3ac70abe2e5d5de61a9572228c76246a9194114ddcbaba16a23f')
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
