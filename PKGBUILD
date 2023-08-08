# Maintainer: taotieren <admin@taotieren.com>
# Maintainer: wh201906 <wh201906@yandex.com>

_pkgname=mEDIFIER
pkgname=medifier-git
pkgver=0.1.r7.g1e4fa5a
pkgrel=1
pkgdesc="I just don't know why the Edifier Connect takes up more than 200MB on my phone."
arch=('any')
url="https://github.com/wh201906/mEDIFIER"
license=('MIT')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=(qt5-serialport
    qt5-connectivity)
makedepends=(qt5-tools
    git)
backup=()
options=('!strip')
install=
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}/"
    git describe --long --tags | sed 's/v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}/Qt/"
    qmake
    make
}

package() {
    install -Dm0755 "${srcdir}/${_pkgname}/Qt/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-git}"

    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/metainfo/io.github.wh201906.medifier.metainfo.xml" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<component type="desktop-application">
  <id>io.github.skiars.medifier</id>

  <name>medifier</name>
  <summary>medifier</summary>

  <metadata_license>CC-BY-SA-4.0</metadata_license>
  <project_license>MIT</project_license>

  <description>
    <p>
      I just don't know why the Edifier Connect takes up more than 200MB on my phone.
    </p>
  </description>

  <launchable type="desktop-id">io.github.skiars.medifier.desktop</launchable>
</component>

EOF

    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/io.github.wh201906.medifier.desktop" <<EOF
[Desktop Entry]
Name=SerialTool
Name[en_US]=mEDIFIER
Name[zh_CN]=mEDIFIER
Exec=medifier
Terminal=false
Type=Application
Icon=medifier.png
Comment=I just don't know why the Edifier Connect takes up more than 200MB on my phone.
Comment[zh_CN]=
Categories=Development;Debugger;
EOF

    install -Dm0644 ${srcdir}/${_pkgname}/LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
#     install -Dm644 "$srcdir/${_pkgname}/src/icon/icon.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"
#    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/${_pkgname}/pkg/20-usb-serial.rules" "${pkgdir}/etc/udev/rules.d/20-usb-serial.rules"
}
