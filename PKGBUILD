# Maintainer: taotieren <admin@taotieren.com>

pkgname=epsidm24-secc0014-bin
pkgver=1.2.3
pkgrel=1
epoch=
pkgdesc="Driver for Epson SIDM Printers: DLQ-3500KII/LQ-82KF/90KP/106KF/136KWII/300KH/520K/590KII/595KII/610KII/615KII/630KII/635KII/675KT/680KII/690K/730KII/735KII/1600KIVH/1900KIIH/2680K/790K/PLQ-20K/30K/30KM/35K/50K ppds"
arch=('aarch64' 'x86_64' )
url="https://www.epson.com.cn/services/supportproduct.html?p=be71009d3b5345398384c5d723cfe9cf"
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
_url=https://eposs.epson.com.cn/EPSON/assets/resource/Download/Service/driver/SIDM/DLQ-3500KII
_pkg_name=signed_${pkgname%-bin}_${pkgver//./_}-1uos20
source=("${_pkg_name}_amd64.deb::${_url}/${_pkg_name}_amd64.deb"
  "${_pkg_name}_arm64.deb::${_url}/${_pkg_name}_arm64.deb")
sha256sums=('8efaa016bb25358348a7f638f53476578cbc7257a72765b716976df5df480fbe'
            '93e0dcf982dbb7637c1145b85dc3cec360a6f855cf3a182e482c8be2497d8838')
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
