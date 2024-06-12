# Maintainer: taotieren <admin@taotieren.com>

pkgname=epsidm24-secc0014-bin
pkgver=1.2.2
pkgrel=1
epoch=
pkgdesc="Driver for Epson SIDM Printers: LQ-82KF/90KP/106KF/136KWII/300KH/520K/590KII/595KII/610KII/615KII/630KII/635KII/675KT/680KII/690K/730KII/735KII/1600KIVH/1900KIIH/2680K/790K;PLQ-20K/30K/30KM ppds"
arch=('aarch64' 'x86_64' )
url="https://www.epson.com.cn/services/supportproduct.html?p=b896c3f048ca4c62a5c339e7084feb8b#"
license=('GPL-2.0-or-later' 'Commercial' )
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
replaces=()
depends=(
  glibc
  libcups)
makedepends=()
optdepends=()
backup=()
options=(!strip !debug)
install=
_pkg_name=signed_${pkgname%-bin}_${pkgver//./_}-1uos20
source=("${_pkg_name}_amd64.deb::https://eposs.epson.com.cn/EPSON/assets/resource/Download/Service/driver/SIDM/LQ-635KII/${_pkg_name}_amd64.deb"
  "${_pkg_name}_arm64.deb::https://eposs.epson.com.cn/EPSON/assets/resource/Download/Service/driver/SIDM/LQ-635KII/${_pkg_name}_arm64.deb")
sha256sums=('a1f862a5ec42fac7509df0a6f2ec4505bf01cc71115358fecb3757eb58a6d933'
            '40da4708f6fe2b5e63b79c555a0fc4a937a52185bbcb9de57df1e5a33576ccde')
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
  install -dm0755 "${pkgdir}/usr/share/${pkgname}/model/" \
    "${pkgdir}/usr/share/cups/model/" \
    "${pkgdir}/usr/share/licenses/${pkgname}/" \
    "${pkgdir}/usr/bin/" \
    "${pkgdir}/usr/share/doc/${pkgname}/"

  cp --preserve=mode -r ${srcdir}/${_pkg_name}/usr/share/cups/model/Epson/*.ppd "${pkgdir}/usr/share/${pkgname}/model/"
  ln -sf /usr/share/${pkgname}/model "${pkgdir}/usr/share/cups/model/${pkgname}"
  install -Dm0755 "${srcdir}/${_pkg_name}/opt/Epson/${pkgname%-bin}/bin/Epson_${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm0755 "${srcdir}/${_pkg_name}/opt/Epson/${pkgname%-bin}/doc/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm0755 "${srcdir}/${_pkg_name}/opt/Epson/${pkgname%-bin}/doc/copyright" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm0755 "${srcdir}/${_pkg_name}/opt/Epson/${pkgname%-bin}/doc/README" -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
