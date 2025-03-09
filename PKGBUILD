# Maintainer: taotieren <admin@taotieren.com>

pkgname=at32-ide-bin
pkgver=1.0.11
pkgrel=4
# epoch=1
pkgdesc="AT32 IDE 是个跨平台 ARM 嵌入式系统的软件开发环境。 它包含一系列的 Eclipse 插件和工具。该插件可让用户在 AT32 IDE 开发环境下创建、建置和调试 AT32
MCU。"
arch=('x86_64')
url="https://www.arterytek.com/cn/support/index.jsp"
license=('LicenseRef-Commercial')
provides=(at32-ide AT32IDE)
conflicts=(at32-ide AT32IDE)
replaces=()
depends=(
  #   java-runtime
  bash
  gcc-libs
  glibc
  hidapi
  libusb
  java-runtime
  perl
  python
  zlib)
makedepends=(libarchive
  sed)
optdepends=('artery-isp-console: Artery ISP Console 是一款基于 MCU Bootloader 的命令行应用程序。使用该应用程序,用户可以通过 UART 端口或者 USB 端口配置操作 Artery 的 MCU 设备。'
  'at32-ide-project-generate: AT32 IDE 是个跨平台 ARM 嵌入式系统的软件开发环境。 它包含一系列的 Eclipse 插件和工具。该插件可让用户在 AT32 IDE 开发环境下创建、建置和调试 AT32 MCU。'
  'at-link-console: Artery AT LINK Console 是一款基于 MCU Bootloader 的命令行应用程序。支持AT32 MCU「在电路编程」Console工具'
  'at32-work-bench: AT32 MCU 图形化配置软件，生成初始化 C 代码(目前仅支持 AT32F421 系列)'
  'jlink-software-and-documentation: Segger JLink software & documentation pack for Linux')
backup=()
options=(!strip !emptydirs !staticlibs)
install=${pkgname}.install
_pkg_file_name=AT32_IDE_V${pkgver}_Linux-${arch}
source=("${_pkg_file_name}.zip::https://www.arterytek.com/download/TOOL/${_pkg_file_name}.zip")
sha256sums=('12cb9e8ee8d50924854181d01e2808cbe005a2a0815e691dfb146627280b07bd')
noextract=()

package() {
  install -dm0755 "${pkgdir}/opt/artery32/${pkgname%-bin}/"

  bsdtar -xf ${srcdir}/AT32IDE_V${pkgver}_Linux-${arch/x/X}.tar.gz -C "${pkgdir}/opt/artery32/${pkgname%-bin}/"

  install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-bin}" <<EOF
#!/bin/bash
/opt/artery32/${pkgname%-bin}/AT32IDE "\$@"
EOF

  chmod 664 "${pkgdir}/opt/artery32/${pkgname%-bin}/AT32IDE.ini"

  install -Dm0644 "${pkgdir}/opt/artery32/${pkgname%-bin}/icon.xpm" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.xpm"

  install -Dm0644 "${pkgdir}/opt/artery32/${pkgname%-bin}/OpenOCD/contrib/60-openocd.rules" "${pkgdir}/etc/udev/rules.d/60-openocd-${pkgname%-bin}.rules"
  sed -i 's|openocd_rules|openocd_at32_ide_rules|g' "${pkgdir}/etc/udev/rules.d/60-openocd-${pkgname%-bin}.rules"

  install -Dm0644 /dev/stdin "${pkgdir}/usr/share/metainfo/com.arterytek.at32ide.metainfo.xml" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<component type="desktop-application">
  <id>com.arterytek.at32ide</id>

  <name>AT32IDE</name>
  <summary>AT32IDE</summary>

  <metadata_license>MIT</metadata_license>
  <project_license>GPL-2.0-or-later</project_license>

  <description>
    <p>
      AT32 IDE 是个跨平台 ARM 嵌入式系统的软件开发环境。 它包含一系列的 Eclipse 插件和工具。该插件可让用户在 AT32 IDE 开发环境下创建、建置和调试 AT32
MCU。
    </p>
  </description>

  <launchable type="desktop-id">com.arterytek.at32ide.desktop</launchable>
</component>
EOF

  install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/com.arterytek.at32ide.desktop" <<EOF
[Desktop Entry]
Version=1.0
Type=Application

Name=AT32IDE
Comment=AT32IDE
Categories=Development;Electronics;

Icon=${pkgname%-bin}
Exec=${pkgname%-bin}
Terminal=false
EOF
  chown -R root:root "${pkgdir}/"
}
