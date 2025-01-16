# Maintainer: taotieren <admin@taotieren.com>

pkgname=nutool-usbtoserialport-git
_pkgname=NuTool-USBtoSerialPort
pkgver=1.02.r0.g9b2404b
pkgrel=1
epoch=
pkgdesc="NuTool-USB to Serial Port is a host-side software, it passes through and montiors I2C, SPI and CAN data of Nu-Link2-Pro® adapter"
arch=($CARCH)
url="https://gitee.com/OpenNuvoton/NuTool-USB-to-Serial-Port"
license=('GPL-3.0-only')
groups=()
depends=(
  gcc-libs
  glibc
  qt5-base
  qt5-serialport)
makedepends=('qt5-tools' 'git')
checkdepends=()
optdepends=()
provides=(${pkgname%-git} 'NuTool-USBtoSerialPort')
conflicts=(${pkgname%-git})
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${_pkgname}::git+${url}.git")
noextract=()
sha256sums=('SKIP')
#validpgpkeys=()

pkgver() {
  cd "${srcdir}/${_pkgname}"
  (
    set -o pipefail
    git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
  cd "${srcdir}/${_pkgname}"
  qmake
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm0755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm0644 /dev/stdin "${pkgdir}/usr/share/metainfo/io.gitee.opennuvoton.nutool-usb-to-serial-port.metainfo.xml" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<component type="desktop-application">
  <id>io.gitee.opennuvoton.nutool-usb-to-serial-port</id>

  <name>${_pkgname}</name>
  <summary>${_pkgname}</summary>

  <metadata_license>MIT</metadata_license>
  <project_license>GPL-2.0-or-later</project_license>

  <description>
    <p>
      NuTool-USB to Serial Port is a host-side software, it passes through and montiors I2C, SPI and CAN data of Nu-Link2-Pro® adapter
    </p>
  </description>

  <launchable type="desktop-id">io.gitee.opennuvoton.nutool-usb-to-serial-port.desktop</launchable>
</component>
EOF

  install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/io.gitee.opennuvoton.nutool-usb-to-serial-port.desktop" <<EOF
[Desktop Entry]
Version=1.0
Type=Application

Name=${_pkgname}
Comment=${_pkgname}
Categories=Development;Electronics;

Icon=${_pkgname}
Exec=${_pkgname}
Terminal=false
EOF
  install -dm0755 "${pkgdir}/usr/share/licenses/${pkgname%-git}/"
  cp -ra "${srcdir}/${_pkgname}/Licenses" "${pkgdir}/usr/share/licenses/${pkgname%-git}/"
}
