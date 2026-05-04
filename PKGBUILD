# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="linux-wifi-hotspot"
pkgname="${_pkgname}-bin"
pkgver=4.7.2
pkgrel=2
pkgdesc="Feature-rich wifi hotspot creator"
arch=(
  'x86_64'
)
url="https://github.com/lakinduakash/${_pkgname}"
license=(
  'BSD-2-Clause'
)
depends=(
  'bash'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'hostapd'
  'iproute2'
  'iw'
  'libgcc'
  'libstdc++'
  'libpng'
  'libx11'
  'procps-ng'
  'qrencode'
)
optdepends=(
  'dnsmasq: for 'NATed' or 'None' Internet sharing method'
  'iptables: for 'NATed' or 'None' Internet sharing method'
  'haveged: for random MAC generation'
  'wireless_tools: if iw cannot recognize your adapter'
)
provides=(
  "${_pkgname}"
  'wihotspot'
  'create_ap'
)
conflicts=(
  "${_pkgname}"
  'wihotspot'
  'create_ap'
)
backup=(
  'etc/create_ap.conf'
)
install="${_pkgname}.install"
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE"
)
source_x86_64=(
  "${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
)
noextract=(
  "${source_x86_64[@]##*/}"
)
b2sums=('04ee85002030378b57f7e0dddc16ed1ad546513fee5a6c8754b4e879e45dd3350083ced3fef268667463f05029280655f2e9ee0ee224ed046fef97eb407e52f4'
        '2864aeda3055806c3008e6d13452edf1f3b3b4fa0bca1477f0137a49899ef4cc0798b2f2385a2f2ba7e1d52363fd9ea0437088d845b8c775740e6ade858244de')
b2sums_x86_64=('490b99dffd08f70f8405cae6426ba32f589fa529b2ec191f0f34596902a505f601c547ecc8f946f24b587c3b7b83a5fbff054410c92d4458e4ead3d6a8f36e1d')

prepare() {
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}"
  mkdir -p "${source_artifact%.deb}"
  bsdtar -xf "${source_artifact}" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${source_artifact%.deb}"
  rm -f data.tar.*

  cd "${source_artifact%.deb}"
  rm -rf "usr/share/doc/${pkgname}"
}

package() {
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}"
  cp -vaT --no-preserve=ownership "${source_artifact%.deb}" "${pkgdir}"

  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
