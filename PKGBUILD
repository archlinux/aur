# Maintainer: lantw44 (at) gmail (dot) com

pkgname=ibus-table-tlim2
pkgver=2.4.245
pkgrel=1
pkgdesc='Taiwan Minnan input method for IBus Table / 教育部臺灣閩南語漢字輸入法'
arch=('any')
url='https://language.moe.gov.tw/001/Upload/Files/site_content/download/mandr/blgsujip_1060706.pdf'
license=('custom')
depends=('ibus-table')
makedepends=('scim-tables')
source=(
  'https://language.moe.gov.tw/sujip/tlim2.tar.gz'
  'tlim2.sed')
sha256sums=(
  'c11357d2cb118b05476587cfa1c98a4c2de3b250a022730438ef0f15f0565928'
  'c0c19887524eea0f0c71bb64a4d3b1f6d6561d75d1b75c5a62323abdbe9c5e7f')
noextract=(
  'tlim2.tar.gz')

prepare() {
  mkdir "${srcdir}/tlim2-${pkgver}"
  cd "${srcdir}/tlim2-${pkgver}"
  bsdtar -xf "${srcdir}/tlim2.tar.gz"
}

build() {
  cd "${srcdir}/tlim2-${pkgver}"
  local scim_table_binary
  for scim_table_binary in *.bin; do
    local name="${scim_table_binary%.bin}"
    local scim_table_text="${name}-scim.txt"
    local ibus_table_text="${name}-ibus.txt"
    local ibus_database="${name}.db"
    scim-make-table "${scim_table_binary}" -o "${scim_table_text}"
    sed -f "${srcdir}/tlim2.sed" "${scim_table_text}" > "${ibus_table_text}"
    ibus-table-createdb -s "${ibus_table_text}" -n "${ibus_database}"
  done
}

package() {
  cd "${srcdir}/tlim2-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/ibus-table/icons"
  mkdir -p "${pkgdir}/usr/share/ibus-table/tables"
  install -m 644 README "${pkgdir}/usr/share/${pkgname}"
  install -m 644 tlim2.png "${pkgdir}/usr/share/ibus-table/icons"
  install -m 644 -- *.db "${pkgdir}/usr/share/ibus-table/tables"
}
