# Maintainer: taotieren <admin@taotieren.com>

pkgbase=at32-work-bench-bin
pkgname=at32-work-bench
pkgver=1.0.03
pkgrel=0
# epoch=1
pkgdesc="AT32 MCU 图形化配置软件，生成初始化 C 代码(目前仅支持 AT32F421 系列)"
arch=('x86_64')
url="https://www.arterytek.com/cn/support/index.jsp"
license=('Commercial')
provides=(${pkgname})
conflicts=()
replaces=()
depends=(desktop-file-utils)
makedepends=(libarchive sed)
optdepends=('artery-isp-console-bin: Artery ISP Console 是一款基于 MCU Bootloader 的命令行应用程序。使用该应用程序,用户可以通过 UART 端口或者 USB 端口配置操作 Artery 的 MCU 设备。'
            'at32-ide-bin: AT32 IDE 是个跨平台 ARM 嵌入式系统的软件开发环境。 它包含一系列的 Eclipse 插件和工具。该插件可让用户在 AT32 IDE 开发环境下创建、建置和调试 AT32
MCU。'
            'jlink-software-and-documentation: Segger JLink software & documentation pack for Linux')
backup=()
options=()
install=
_pkg_file_name=AT32_Work_Bench_Linux-${arch}_V${pkgver}
source=("${_pkg_file_name}.zip::https://www.arterytek.com/download/TOOL/${_pkg_file_name}.zip")
sha256sums=('a02bd0915c784a98a80c89fe800c6501c1fc187a5a95cdbb1dfba25794a63a78')
noextract=()

package() {
    install -dm0755 "${pkgdir}/opt/artery32/"

    bsdtar -xf  ${srcdir}/${_pkg_file_name}.deb -C ${srcdir}
    bsdtar -xf ${srcdir}/data.tar.xz -C "${pkgdir}"

    mv "${pkgdir}/usr/local"  "${pkgdir}/opt/artery32/${pkgname}"

    sed -i "s|/usr/local|/opt/artery32/${pkgname}|g" "${pkgdir}"/usr/share/applications/AT32_Work_Bench.desktop

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" << EOF
#!/bin/bash
cd /opt/artery32/${pkgname}/AT32_Work_Bench/
bash AT32_Work_Bench.sh "\$@"
EOF
    find "${pkgdir}/" -type f -exec chmod 644 "{}" \;
    find "${pkgdir}/" -type d -exec chmod 755 "{}" \;

    cd "${pkgdir}/"/opt/artery32/${pkgname}/AT32_Work_Bench/
    chmod +x AT32_Work_Bench*

}
