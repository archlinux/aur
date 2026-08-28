# Maintainer: taotieren <admin@taotieren.com>

pkgname=at32-openocd-bin
pkgver=2.1.0
pkgrel=3
# epoch=1
pkgdesc="AT32 OpenOCD 支持 AT32 MCU调试、编程及边界扫描"
arch=('x86_64')
url="https://www.arterytek.com/cn/support/tools.jsp"
license=('LicenseRef-scancode-commercial-license')
provides=(at32-openocd AT32OpenOCD)
conflicts=(at32-openocd AT32OpenOCD)
replaces=()
depends=(
  sh
  hidapi
  libgcc_s.so
  libstdc++.so
  libusb
)
makedepends=(
  libarchive
  sed
)
optdepends=(
  'artery-isp-console'
  'at-link-console'
  'at32-bootloader-doc'
  'at32-ide-bin'
  'at32-ide-project-generate'
  'at32-new-clock-configuration'
  'at32-work-bench'
  'jlink-software-and-documentation: Segger JLink software & documentation pack for Linux')
backup=()
options=(!strip !emptydirs !staticlibs)
install=${pkgname}.install
_pkg_file_name=OpenOCD_Linux_${arch//_/-}_V${pkgver}
source=("${_pkg_file_name}.zip::https://www.arterytek.com/download/AT32%20IDE/${_pkg_file_name}.zip")
sha256sums=('3707a4e2610a04f65964eba91c1da2d014b867d296532f343760f48e5f5d5726')
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
