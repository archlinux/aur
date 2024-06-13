# Maintainer: taotieren <admin@taotieren.com>

pkgbase=epson-printer-io-community-bin
pkgname=epson-printer-io-community-bin
pkgver=1.2.6
pkgrel=1
epoch=
pkgdesc="EPSON Linux Printer IO daemon"
arch=('x86_64')
url="https://www.epson.com.cn/drive/df974e42dfab44ce965b39d4b2965fcc.html?productId=58a272d0e37640588de9bed078e2d11b"
license=('GPL-2.0-or-later' 'Commercial' )
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
replaces=()
depends=(
  glibc
  gcc-libs
  libusb)
makedepends=()
optdepends=("epson-label-printer-utility-community: Epson Label Printer Utility")
backup=()
options=(!strip !debug)
install=
_url=https://eposs.epson.com.cn/EPSON/assets/resource/Download/Service/driver/CW/CW-C4030
_zip_name=epson-label-printer-utility-community-1_5_1-QT5_s
_deb_name=${pkgname%-bin}-${pkgver}
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
  install -dm0755 "${pkgdir}/usr/share/licenses/epson/${pkgname}/" \
    "${pkgdir}/usr/bin/" \
    "${pkgdir}/usr/lib/systemd/system"

  install -Dm755 "${srcdir}/${_deb_name}/opt/epson/${pkgname%-bin}/elioud1" -t "${pkgdir}/usr/bin/"
  install -Dm755 "${srcdir}/${_deb_name}/opt/epson/${pkgname%-bin}/epsonUSB1" -t "${pkgdir}/usr/bin/"
  install -Dm755 "${srcdir}/${_deb_name}/opt/epson/${pkgname%-bin}/elio1.so" -t "${pkgdir}/usr/lib/"
  sed -i 's|/opt/epson/epson-printer-io-community/elioud1|/usr/bin/elioud1|g' "${srcdir}/${_deb_name}/etc/systemd/system/elioud1.service"
  install -Dm644 "${srcdir}/${_deb_name}/etc/systemd/system/elioud1.service" -t "${pkgdir}/usr/lib/systemd/system"
  cp -rv "${srcdir}/${_deb_name}/opt/epson/${pkgname%-bin}/license/"*.txt "${pkgdir}/usr/share/licenses/epson/${pkgname}/"
}
