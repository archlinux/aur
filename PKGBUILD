# Maintainer: taotieren <admin@taotieren.com>

pkgname=at32-openocd-bin
pkgver=2.0.7
pkgrel=1
# epoch=1
pkgdesc="AT32 OpenOCD 支持 AT32 MCU调试、编程及边界扫描"
arch=('x86_64')
url="https://www.arterytek.com/cn/support/tools.jsp"
license=('LicenseRef-scancode-commercial-license')
provides=(at32-openocd AT32OpenOCD)
conflicts=(at32-openocd AT32OpenOCD)
replaces=()
depends=(
  bash
  glibc
  hidapi
  libusb
)
makedepends=(
  libarchive
  sed
)
optdepends=(
  'at32-ide-bin: AT32 IDE 是个跨平台 ARM 嵌入式系统的软件开发环境。 它包含一系列的 Eclipse 插件和工具。该插件可让用户在 AT32 IDE 开发环境下创建、建置和调试 AT32 MCU。'
  'artery-isp-console: Artery ISP Console 是一款基于 MCU Bootloader 的命令行应用程序。使用该应用程序,用户可以通过 UART 端口或者 USB 端口配置操作 Artery 的 MCU 设备。'
  'at32-ide-project-generate: AT32 IDE 是个跨平台 ARM 嵌入式系统的软件开发环境。 它包含一系列的 Eclipse 插件和工具。该插件可让用户在 AT32 IDE 开发环境下创建、建置和调试 AT32 MCU。'
  'at-link-console: Artery AT LINK Console 是一款基于 MCU Bootloader 的命令行应用程序。支持AT32 MCU「在电路编程」Console工具'
  'at32-work-bench: AT32 MCU 图形化配置软件，生成初始化 C 代码(目前仅支持 AT32F421 系列)'
  'jlink-software-and-documentation: Segger JLink software & documentation pack for Linux')
backup=()
options=(!strip !emptydirs !staticlibs)
install=${pkgname}.install
_pkg_file_name=OpenOCD_Linux_${arch//_/-}_V${pkgver}
source=("${_pkg_file_name}.zip::https://www.arterytek.com/download/AT32%20IDE/${_pkg_file_name}.zip")
sha256sums=('e233946cfd92deb9d59860ee5819312009537b2a429aa4d21c193b6f7b522963')
noextract=(${_pkg_file_name}.zip)

package() {
  install -dm0755 "${pkgdir}/opt/artery32/${pkgname%-bin}/"

  bsdtar -xf ${srcdir}/${_pkg_file_name}.zip -C "${pkgdir}/opt/artery32/${pkgname%-bin}/"

  install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-bin}" <<EOF
#!/bin/bash
/opt/artery32/${pkgname%-bin}/openocd "\$@"
EOF

  install -Dm0644 "${pkgdir}/opt/artery32/${pkgname%-bin}/contrib/60-openocd.rules" "${pkgdir}/etc/udev/rules.d/60-openocd-${pkgname%-bin}.rules"
  sed -i 's|openocd_rules|openocd_at32_openocd_rules|g' "${pkgdir}/etc/udev/rules.d/60-openocd-${pkgname%-bin}.rules"

  install -Dm0644 /dev/stdin "${pkgdir}/usr/share/metainfo/com.arterytek.at32openocd.metainfo.xml" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<component type="desktop-application">
  <id>com.arterytek.at32openocd</id>

  <name>AT32OpenOCD</name>
  <summary>AT32OpenOCD</summary>

  <metadata_license>MIT</metadata_license>
  <project_license>GPL-2.0-or-later</project_license>

  <description>
    <p>
      AT32 OpenOCD 支持 AT32 MCU调试、编程及边界扫描
    </p>
  </description>

  <launchable type="desktop-id">com.arterytek.at32openocd.desktop</launchable>
</component>
EOF

  install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/com.arterytek.at32openocd.desktop" <<EOF
[Desktop Entry]
Version=1.0
Type=Application

Name=AT32OpenOCD
Comment=AT32OpenOCD
Categories=Development;Electronics;

Icon=${pkgname%-bin}
Exec=${pkgname%-bin}
Terminal=false
EOF
  chown -R root:root "${pkgdir}/"
}
