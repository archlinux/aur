# Maintainer: taotieren <admin@taotieren.com>

pkgbase=cloud-fs-bin
pkgname=clouddrive
pkgver=0.5.7
pkgrel=1
pkgdesc="CloudDrive是一个强大的多云盘管理工具，为用户提供包含云盘本地挂载的一站式的多云盘解决方案。"
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
noextract=(${pkgname}-2-x86_64-${pkgver}.tgz
    ${pkgname}-2-aarch64-${pkgver}.tgz)

_install_path="opt/${pkgname}"

package() {
    cd ${srcdir}
    install -dm755 ${pkgdir}/${_install_path}
    bsdtar xf "${pkgname}-2-${CARCH}-${pkgver}.tgz" --strip-components=2 -C ${pkgdir}/${_install_path}

    install -Dm755 /dev/stdin  "${pkgdir}/usr/bin/${pkgname}" << EOF
#!/bin/env bash

cd /opt/clouddrive
./clouddrive
EOF

    install -Dm644 /dev/stdin  "${pkgdir}/usr/lib/systemd/system/${pkgname}.service" << EOF
[Unit]
Description="CloudDrive是一个强大的多云盘管理工具，为用户提供包含云盘本地挂载的一站式的多云盘解决方案。"
#开机时，确保在网络接通之后才会启动
Wants=network-online.target
After=network-online.target
#开机时，确保在DNS解析就绪之后才会启动
#Wants=nss-lookup.target
#After=nss-lookup.target
#关机时，确保在关闭网络之前已经停止
After=network.target

[Service]
#为兼容 systemd 老版本所做的妥协(v240 以上版本建议设置为 Type=exec )
Type=simple
ExecStart=clouddrive

[Install]
WantedBy=multi-user.target
#默认实例名称(仅当 systemctl enable 命令没有指定实例名称时有意义)
DefaultInstance=default
EOF

    install -Dm644 "${pkgdir}/usr/lib/systemd/system/${pkgname}.service" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"
#     install -Dm644 "${pkgdir}/${_install_path}/LICENSE*" -t "${pkgdir}/usr/share/licenses/${pkgname}"

    install -Dm644 /dev/stdin "${pkgdir}//etc/systemd/system/docker.service.d/clear_mount_propagation_flags_clouddirve.conf" << EOF
[Service]
MountFlags=shared
EOF
    install -dm755 "${pkgdir}"/media/clouddrive

    sed -i 's/\\//g' "${pkgdir}/${_install_path}"/wwwroot/*.js
}
