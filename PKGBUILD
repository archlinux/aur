# Maintainer: taotieren <admin@taotieren.com>

pkgbase=at32-new-clock-configuration-bin
pkgname=at32-new-clock-configuration
pkgver=3.0.20
pkgrel=3
# epoch=1
pkgdesc="AT32 时钟配置工具是雅特力科技为方便对 AT32 系列 MCU 进行时钟配置而开发的一个图形化配置工具，其主旨是使用户清晰了解时钟路径和配置出期望的时钟频率。"
arch=('x86_64')
url="https://www.arterytek.com/cn/support/tools.jsp"
license=('LicenseRef-scancode-commercial-license')
provides=(${pkgname})
conflicts=()
replaces=()
depends=(
  sh
  glib2
  libgcc_s.so
  libstdc++.so
  libz.so
)
makedepends=(libarchive sed)
optdepends=(
  'artery-isp-console'
  'at-link-console'
  'at32-bootloader-doc'
  'at32-ide'
  'at32-ide-project-generate'
  'at32-work-bench'
  'at32-openocd'
  'jlink-software-and-documentation: Segger JLink software & documentation pack for Linux'
)
backup=()
options=('!strip' '!debug' '!lto')
# install=${pkgname}.install
_pkg_name=AT32_New_Clock_Configuration
_pkg_linux=${_pkg_name}_Linux-${arch}
_pkg_file_name=${_pkg_linux}_V${pkgver}
source=("${_pkg_file_name}.zip::https://www.arterytek.com/download/Program%20and%20Debug/${_pkg_file_name}.zip")
# https://www.arterytek.com/download/Program%20and%20Debug/AT32_New_Clock_Configuration_Linux-x86_64_V3.0.19.zip
sha256sums=('55d41411fcc0b22b9df4a6d900575c88bf0852a6883d5f96761fbfb6e85e2f1a')
# noextract=(${_pkg_file_name}.zip)

package() {
  install -dm0755 "${pkgdir}/opt/artery32/${pkgname}/" \
    "${srcdir}/${_pkg_file_name}"

  bsdtar -xf ${srcdir}/${_pkg_file_name}.deb -C ${srcdir}/${_pkg_file_name}
  bsdtar -xf ${srcdir}/${_pkg_file_name}/data.tar.xz -C ${srcdir}/${_pkg_file_name}

  cp -rv ${srcdir}/${_pkg_file_name}/usr/local/* "${pkgdir}/opt/artery32/${pkgname}/"

  sed -i 's|/usr/local/|/opt/artery32/at32-new-clock-configuration/|g' ${srcdir}/${_pkg_file_name}/usr/share/applications/AT32_New_Clock_Configuration.desktop
  install -Dm0644 ${srcdir}/${_pkg_file_name}/usr/share/applications/AT32_New_Clock_Configuration.desktop ${pkgdir}/usr/share/applications/AT32_New_Clock_Configuration.desktop
  install -Dm0644 ${srcdir}/${_pkg_file_name}/usr/share/icons/AT32_New_Clock_Configuration/ArteryIcon.ico ${pkgdir}/usr/share/icons/AT32_New_Clock_Configuration/ArteryIcon.ico

  install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<EOF
#!/bin/bash
/opt/artery32/${pkgname}/${_pkg_name}/${_pkg_name}.sh "\$@"
EOF
  chown -R root:root "${pkgdir}/"
}
