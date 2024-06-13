# Maintainer: taotieren <admin@taotieren.com>

pkgbase=epson-label-printer-utility-community-bin
pkgname=epson-label-printer-utility-community-bin
pkgver=1.5.1
pkgrel=1
epoch=
pkgdesc="Epson Label Printer Utility"
arch=('x86_64')
url="https://www.epson.com.cn/drive/df974e42dfab44ce965b39d4b2965fcc.html?productId=58a272d0e37640588de9bed078e2d11b"
license=('GPL-2.0-or-later' 'Commercial' )
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
replaces=()
depends=(
  glibc
  gcc-libs
  qt5-base
  libcups)
makedepends=()
optdepends=("epson-printer-io-community: EPSON Linux Printer IO daemon")
backup=()
options=(!strip !debug)
install=
_url=https://eposs.epson.com.cn/EPSON/assets/resource/Download/Service/driver/CW/CW-C4030
_zip_name=${pkgname%-bin}-${pkgver//./_}-QT5_s
_deb_name=${pkgname%-bin}-${pkgver}-QT5
source=("${_url}/${_zip_name}%20(1).zip")
sha256sums=('33572eb62320e80d9730f6d2180d5de60eadc56ee6afdbb8adf5381d2edd7717')
noextract=()

build() {
  mkdir -pv "${srcdir}/${_deb_name}"
  mkdir -pv "${srcdir}/${_zip_name}"
  bsdtar -xf "${srcdir}/${_deb_name}.deb" -C "${srcdir}/${_zip_name}"
  bsdtar -xf "${_zip_name}/data.tar.gz" -C "${srcdir}/${_deb_name}"
}

package() {
  install -dm0755 "${pkgdir}/usr/share/epson/${pkgname}/tr" \
    "${pkgdir}/usr/share/applications/" \
    "${pkgdir}/usr/share/licenses/epson/${pkgname}/" \
    "${pkgdir}/usr/bin/" \
    "${pkgdir}/usr/share/pixmaps/"

  install -Dm755 "${srcdir}/${_deb_name}/opt/epson/${pkgname%-community-bin}/elpu" -t "${pkgdir}/usr/share/epson/${pkgname}/"
  ln -sf /usr/share/epson/${pkgname}/elpu "${pkgdir}/usr/bin/elpu"
  install -Dm755 "${srcdir}/${_deb_name}/opt/epson/${pkgname%-community-bin}/elpuqt" -t "${pkgdir}/usr/share/epson/${pkgname}/"
  ln -sf /usr/share/epson/${pkgname}/elpuqt "${pkgdir}/usr/bin/elpuqt"
  cp -rv "${srcdir}/${_deb_name}/opt/epson/${pkgname%-community-bin}/tr/"*.qm "${pkgdir}/usr/share/epson/${pkgname}/tr/"
  install -Dm644 "${srcdir}/${_deb_name}/opt/epson/${pkgname%-community-bin}/AppIcon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
  cp -rv "${srcdir}/${_deb_name}/opt/epson/${pkgname%-community-bin}/license/"*.txt "${pkgdir}/usr/share/licenses/epson/${pkgname}/"
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/elpuqt.desktop" <<EOF
[Desktop Entry]
Name=Epson Label Printer Utility
Name[zh_CN]=爱普生标签打印机工具
GenericName=Epson Label Printer Utility
GenericName[zh_CN]=爱普生标签打印机工具
Type=Application
Categories=Qt;Utility;HardwareSettings;Printing;
Exec=elpuqt
Icon=/usr/share/pixmaps/${pkgname%-bin}.png
Keywords=Epson;Label;Printer
EOF

}
