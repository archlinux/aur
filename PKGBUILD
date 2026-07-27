# Maintainer: dfdc1123 <ch3fmt1g@outlook.com>
pkgname=kneadnet-bin
pkgver=0.2.5
pkgrel=1
pkgdesc='Convert electronic schematics into breadboard layouts and routing suggestions'
arch=('x86_64')
url='https://github.com/dfdc1123/knead-net-gui'
license=('GPL-3.0-only')
depends=('gtk3' 'webkit2gtk-4.1')
provides=('kneadnet')
conflicts=('kneadnet' 'knead-net-gui')
replaces=('knead-net-gui')
options=('!strip')
_deb="kneadnet_${pkgver}_amd64.deb"
_examples="KneadNet-examples-${pkgver}.zip"
source_x86_64=(
  "${_deb}::${url}/releases/download/v${pkgver}/${_deb}"
  "${_examples}::${url}/releases/download/v${pkgver}/${_examples}"
)
noextract=("${_deb}" "${_examples}")
sha256sums_x86_64=(
  '3b3c8d3c1e99f11c9e0b65e14ae8cdfd0fcc6aafaf4edfd33242ece10399c187'
  'd33602be8e7975eab4bffdb83cd1d0091604bdd26320354f3bc1e02e0206bc11'
)

package() {
  local deb_dir="${srcdir}/deb"
  local data_archive=

  install -d "${deb_dir}" "${pkgdir}"
  bsdtar --no-same-owner -xf "${srcdir}/${_deb}" -C "${deb_dir}"
  for candidate in "${deb_dir}"/data.tar.*; do
    if [[ -f "${candidate}" ]]; then
      data_archive="${candidate}"
      break
    fi
  done
  [[ -n "${data_archive}" ]] || return 1
  bsdtar --no-same-owner -xf "${data_archive}" -C "${pkgdir}"

  install -Dm644 "${pkgdir}/usr/share/doc/kneadnet/copyright" \
    "${pkgdir}/usr/share/licenses/kneadnet/LICENSE"

  bsdtar --no-same-owner -xf "${srcdir}/${_examples}" -C "${srcdir}"
  install -d "${pkgdir}/usr/share/doc/kneadnet"
  cp -R "${srcdir}/KneadNet-examples-${pkgver}/examples" \
    "${pkgdir}/usr/share/doc/kneadnet/examples"
}
