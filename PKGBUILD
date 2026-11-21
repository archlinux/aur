# Maintainer: Local package build
pkgname=qy-printer-bin
pkgver=2.1.0.3
pkgrel=2
pkgdesc='QY thermal/label printer CUPS PPDs and proprietary raster filters'
arch=('x86_64' 'aarch64')
url='https://ms.printsupport.cn/?mo=M100'
license=('custom:proprietary')
depends=('cups' 'libcups' 'gcc-libs' 'zlib')
optdepends=('cups-filters: additional CUPS filter conversion support')
source=('QY_Printer_Driver_Linux.zip::https://oss.qu-in.ltd/Phomemo/QY_Printer_Driver_Linux.zip')
sha512sums=('53d6994bb46062bcdd6702adf754893e3fa66cc1a52001055e710cb57896468ff643f1614fa95289f13aa883901d43863e26a1735c455d2d83d378b2be160e0e')
prepare() {
  local archive
  local -a archives

  # makepkg extracts the outer ZIP automatically; unpack its nested tarball.
  mapfile -d '' archives < <(find "${srcdir}" -type f \
    -name "QY_Printer-${pkgver}.tar.gz" -print0)
  if (( ${#archives[@]} != 1 )); then
    printf 'ERROR: Expected one QY_Printer-%s.tar.gz inside the ZIP; found %s\n' \
      "${pkgver}" "${#archives[@]}" >&2
    return 1
  fi
  archive=${archives[0]}
  tar -xzf "${archive}" -C "${srcdir}"
}

package() {
  local srcdir_driver="${srcdir}/QY_Printer-${pkgver}"
  local filter ppd

  install -d "${pkgdir}/usr/lib/cups/filter" \
             "${pkgdir}/usr/share/cups/model/qy"

  for filter in rastertoD480 rastertoM08F rastertolabelmxxx; do
    install -m755 "${srcdir_driver}/${CARCH}/${filter}" \
      "${pkgdir}/usr/lib/cups/filter/${filter}"
  done

  for ppd in "${srcdir_driver}"/ppds/*.ppd; do
    install -m644 "${ppd}" "${pkgdir}/usr/share/cups/model/qy/"
  done
}
