# Maintainer: taotieren <admin@taotieren.com>

pkgname=epsidm24-secc0014-bin
pkgver=1.2.4
pkgrel=1
epoch=
pkgdesc="Driver for Epson SIDM Printers: DLQ-3500KII/3500KIIN/LQ-82KF/90KP/106KF/136KWII/300KH/520K/590KII/595KII/610KII/615KII/630KII/635KII/675KT/680KII/690K/730KII/735KII/1600KIVH/1900KIIH/2680K/790K/PLQ-20K/30K/30KM/35K/50K/50KM/50KMK ppds"
arch=('aarch64' 'x86_64' )
url="https://www.epson.com.cn/services/supportproduct.html?p=c5d0b2a483a14657bf87bd8e2f9a00aa"
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
_url=https://eposs.epson.com.cn/EPSON/assets/resource/Download/Service/driver/SIDM/PLQ-50KMK
_pkg_name=signed_${pkgname%-bin}_${pkgver//./_}-1uos20
source=("${_pkg_name}_amd64.deb::${_url}/${_pkg_name}_amd64.deb"
  "${_pkg_name}_arm64.deb::${_url}/${_pkg_name}_arm64.deb")
sha256sums=('838336d80eba91a4ac7b1397ee60509b532a6b220ae5256d87b1d61a95016d7f'
            'd04a14da17a72b6f1434fb506cc5ad8eafdc35078130f893d86ce5f5ffd07efd')
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
