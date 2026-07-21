# Maintainer: dfdc1123 <ch3fmt1g@outlook.com>
pkgname=kneadnet-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='Convert electronic schematics into breadboard layouts and routing suggestions'
arch=('x86_64')
url='https://github.com/dfdc1123/knead-net-gui'
license=('GPL-3.0-only')
depends=('gtk3' 'webkit2gtk-4.1')
provides=('kneadnet')
conflicts=('kneadnet' 'knead-net-gui')
options=('!strip')
_deb="kneadnet_${pkgver}_amd64.deb"
_examples="KneadNet-examples-${pkgver}.zip"
source_x86_64=(
  "${_deb}::${url}/releases/download/v${pkgver}/${_deb}"
  "${_examples}::${url}/releases/download/v${pkgver}/${_examples}"
)
noextract=("${_deb}" "${_examples}")
sha256sums_x86_64=(
  'a1f74910451b8a9b2e396c36e7543051ed2b185d2314aa3b3a4c59eb39e7fc3b'
  '02cc9ab32353c6c458b537b40b2336878dcf9c0d280190aa981baa1b4e7a73b7'
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
