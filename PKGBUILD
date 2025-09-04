# Maintainer: taotieren <admin@taotieren.com>

pkgname=pango-design-suite-bin
pkgver=6.7.1
pkgrel=1
# epoch=1
pkgdesc="Pango Design Suite (PDS) 软件是紫光同创自主研发的从HDL描述到位流生成与下载调试的可编程工具套件，为公司全系列FPGA芯片提供高效友好的集成设计环境。该软件支持业界标准的开发流程，已具备支持大规模FPGA芯片的应用开发能力。"
arch=('x86_64')
url="https://www.pangomicro.com/product/pds/"
license=('LicenseRef-scancode-commercial-license')
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
replaces=()
depends=(
  bash
  gcc-libs
  glibc
  python
  zlib
)
makedepends=(
  libarchive
  sed
)
optdepends=()
backup=(etc/${pkgname%-bin}-license.conf)
options=(!debug !strip !emptydirs !staticlibs)
install=${pkgname}.install
_name=PDS
_year=2022.2
_os=CentOS
_mojar=SP${pkgver}
_min=7.3
_file_name=${_name}_${_year}-${_mojar}-ads
_pkg_file_name=${_file_name}-${_os}${_min}-x64
# https://www.pangomicro.com/uploads/soft/PDS/PDS_2022.2-SP6.7.1-ads-OW/CentOS-64bit/PDS_2022.2-SP6.7.1-ads-CentOS7.3-x64.tar.gz
source=(
  "pango-design-suite-license.conf"
  "pango-design-suite-license.sh"
  "pango-design-suite.png"
  "${pkgname}.install"
  "${_pkg_file_name}.tar.gz::https://www.pangomicro.com/uploads/soft/${_name}/${_file_name}-OW/${_os}-64bit/${_pkg_file_name}.tar.gz"
)
sha256sums=('36a132b356038a6497d16bed20dc2c1a5539da6bdacf29a82e7a6e4845ece305'
            '66140ded6003519d378165f0c82f0b53329587a840ce7036c83a4a93b76eb8bd'
            '30ac601f2d44cc86731ee17dc1f8d5d714654fd3e6626d5409e5564684f20c67'
            '06aa1d5b573e6e23f3317cdf740d65929b133e09a8c4c0857243ca721bd360bc'
            'd7e00eadd36ce24b1ccef778af6117f6c4a0dcde26ee871a94ef281ba2ec8b92')
# noextract=(${_pkg_file_name}.tar.gz)

package() {
  install -Dm644 "${srcdir}/${pkgname%-bin}-license.conf" -t "${pkgdir}/etc/"
  install -Dm755 "${srcdir}/${pkgname%-bin}-license.sh" -t "${pkgdir}/etc/profile.d/"
  install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps/"
  install -Dm644 "${srcdir}/Pango_Design_Suite_Linux_Install_Guide.pdf" -t "${pkgdir}/usr/share/doc/${pkgname}/"
  sed -i 's|users|uucp|g' "${srcdir}/${_pkg_file_name}/99-zpangodevices-udev.rules"
  install -Dm644 "${srcdir}/${_pkg_file_name}/99-zpangodevices-udev.rules" -t "${pkgdir}/usr/lib/udev/rules.d/"
  install -Dm644 "${srcdir}/${_pkg_file_name}/license.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  mv "${srcdir}/${_pkg_file_name}/opensource_licenses" "${pkgdir}/usr/share/licenses/${pkgname}/"
  mv "${srcdir}/${_pkg_file_name}/doc" "${pkgdir}/usr/share/doc/${pkgname}/"

  install -dm0755 "${pkgdir}/opt/pangomicro/${pkgname%-bin}/"
  mv ${srcdir}/${_pkg_file_name}/{arch,bin,driver,example,install.sh,ip,lib} "${pkgdir}/opt/pangomicro/${pkgname%-bin}/"

  install -Dm0755 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.sh" <<EOF
#!/bin/sh
[ -d /opt/pangomicro/${pkgname%-bin}/bin ] && append_path '/opt/pangomicro/${pkgname%-bin}/bin'

export PATH
EOF
  #   install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-bin}" <<EOF
  # #!/bin/bash
  # /opt/pangomicro/${pkgname%-bin}/bin/pds "\$@"
  # EOF

  install -Dm0644 /dev/stdin "${pkgdir}/usr/share/metainfo/com.pangomicro.pds.metainfo.xml" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<component type="desktop-application">
  <id>com.pangomicro.pds</id>

  <name>PDS</name>
  <summary>Pango Design Suite (PDS)</summary>

  <metadata_license>MIT</metadata_license>
  <project_license>GPL-2.0-or-later</project_license>

  <description>
    <p>
      Pango Design Suite (PDS) 软件是紫光同创自主研发的从HDL描述到位流生成与下载调试的可编程工具套件，为公司全系列FPGA芯片提供高效友好的集成设计环境。该软件支持业界标准的开发流程，已具备支持大规模FPGA芯片的应用开发能力。
    </p>
  </description>

  <launchable type="desktop-id">com.pangomicro.pds.desktop</launchable>
</component>
EOF

  install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/com.pangomicro.pds.desktop" <<EOF
[Desktop Entry]
Version=1.0
Type=Application

Name=pds
Comment=Pango Design Suite (PDS)
Categories=Development;Electronics;

Icon=${pkgname%-bin}
Exec=/opt/pangomicro/pango-design-suite/bin/pds %U
Terminal=false
EOF
  #   chown -R root:root "${pkgdir}/"
}
