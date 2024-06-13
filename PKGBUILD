# Maintainer: taotieren <admin@taotieren.com>

pkgname=epsidm24-secc0019-bin
pkgver=1.2.5
pkgrel=2
epoch=
pkgdesc="Driver for Epson SIDM Printers: LQ-790KII/690KII/680KIII/675KTII/106KFII/2680KII ppds"
arch=('aarch64' 'x86_64' )
url="https://www.epson.com.cn/services/supportproduct.html?p=beca262ad3e3431a9da695c7e696a737"
license=('GPL-2.0-or-later' 'Commercial' )
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
replaces=()
depends=(
  glibc
  libcups)
makedepends=(gzip)
optdepends=()
backup=()
options=(!strip !debug)
install=
_pkg_name=signed_${pkgname%-bin}_${pkgver//./_}-1
source=("${_pkg_name}_amd64.deb::https://eposs.epson.com.cn/EPSON/assets/resource/Download/Service/driver/SIDM/LQ-2680KII/${_pkg_name}_amd64.deb"
  "${_pkg_name}_arm64.deb::https://eposs.epson.com.cn/EPSON/assets/resource/Download/Service/driver/SIDM/LQ-2680KII/${_pkg_name}_arm64.deb")
sha256sums=('625305695cf8a1bc5bc916de7ef2cf073de2c90082a170992b41a0f94c41da8f'
            'e4dae3d4683af7e6252ddb4fca86d2b02bc3dd04d895967bcb22e8a7280643dd')
noextract=("${_pkg_name}_amd64.deb"
  "${_pkg_name}_arm64.deb")

build() {
  if [ ${CARCH} = "x86_64" ]; then
    mv ${_pkg_name}_amd64.deb ${_pkg_name}.deb
  fi
  if [ ${CARCH} = "aarch64" ]; then
    mv ${_pkg_name}_arm64.deb ${_pkg_name}.deb
  fi

  mkdir "${srcdir}/${_pkg_name}"
  bsdtar -xf ${_pkg_name}.deb
  bsdtar -xf data.tar.xz -C "${srcdir}/${_pkg_name}"
}

package() {
  install -dm0755 "${pkgdir}/usr/share/epson/${pkgname}/model/" \
    "${pkgdir}/usr/share/cups/model/" \
    "${pkgdir}/usr/share/licenses/${pkgname}/" \
    "${pkgdir}/usr/bin/" \
    "${pkgdir}/usr/share/doc/${pkgname}/"

  for file in ${srcdir}/${_pkg_name}/usr/share/cups/model/Epson/*.ppd; do
      filename=$(basename "$file")
      gzip -c "$file" > "${pkgdir}/usr/share/epson/${pkgname}/model/${filename%.*}.ppd.gz"
  done

  ln -sf /usr/share/epson/${pkgname}/model "${pkgdir}/usr/share/cups/model/${pkgname}"
  install -Dm0755 "${srcdir}/${_pkg_name}/opt/Epson/${pkgname%-bin}/bin/Epson_${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm0755 "${srcdir}/${_pkg_name}/opt/Epson/${pkgname%-bin}/doc/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm0755 "${srcdir}/${_pkg_name}/opt/Epson/${pkgname%-bin}/doc/copyright" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm0755 "${srcdir}/${_pkg_name}/opt/Epson/${pkgname%-bin}/doc/README" -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
