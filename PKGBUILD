# Maintainer: lantw44 (at) gmail (dot) com

pkgname=ibus-table-hkim
pkgver=1.1.88
pkgrel=1
pkgdesc='Taiwan Hakka input method for IBus Table / 教育部臺灣客家語拼音輸入法'
arch=('any')
url='https://ws.moe.edu.tw/001/Upload/6/relfile/6507/7818/73d03702-3903-4123-9801-f8264d623443.pdf'
license=('custom')
depends=('ibus-table')
makedepends=('scim-tables')
source=(
  'https://language.moe.gov.tw/001/Upload/FileUpload/3677-15601/Documents/hkim_1188.tar.gz'
  'hkim.sed')
sha256sums=(
  '011e5fad3c3cc22fb5392664f47ade558e6191a1f8357918c985d5d61eb9038b'
  'c4b2d9678926b606426eecd1823cb46f9263068b13578168a7fb89a7205ab800')

build() {
  cd "${srcdir}/hkim"
  local scim_table_binary
  for scim_table_binary in *.bin; do
    local name="${scim_table_binary%.bin}"
    local scim_table_text="${name}-scim.txt"
    local ibus_table_text="${name}-ibus.txt"
    local ibus_database="${name}.db"
    scim-make-table "${scim_table_binary}" -o "${scim_table_text}"
    sed -f "${srcdir}/hkim.sed" "${scim_table_text}" > "${ibus_table_text}"
    case "${name}" in
      *-1)
        sed -i \
          '/^BEGIN_CHAR_PROMPTS_DEFINITION$/,/^END_CHAR_PROMPTS_DEFINITION$/d' \
          "${ibus_table_text}"
        ;;
    esac
    ibus-table-createdb -s "${ibus_table_text}" -n "${ibus_database}"
  done
}

package() {
  cd "${srcdir}/hkim"
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/ibus-table/icons"
  mkdir -p "${pkgdir}/usr/share/ibus-table/tables"
  install -m 644 README "${pkgdir}/usr/share/${pkgname}"
  install -m 644 hkim.png "${pkgdir}/usr/share/ibus-table/icons"
  install -m 644 -- *.db "${pkgdir}/usr/share/ibus-table/tables"
}
