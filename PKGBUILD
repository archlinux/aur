# Maintainer: SchemaSmith Contributors <support@schemasmith.com>
# Version and the two linux tarball SHA-256s are filled in by packaging/aur/render.sh at release time.
pkgname=schemasmith-bin
pkgver=2.7.3
pkgrel=1
pkgdesc='State-based database schema deployment for SQL Server, PostgreSQL, MySQL and MariaDB (CLI tools)'
arch=('x86_64' 'aarch64')
url='https://github.com/Schema-Smith/SchemaSmith'
license=('custom:SSCL-2.0')
provides=('schemasmith' 'schemaquench' 'schematongs' 'datatongs' 'schemashears')
conflicts=('schemasmith')
# Self-contained single-file .NET binaries with bundled ICU — do not strip or scan .so deps.
options=('!strip' '!debug')
_icuver=72.1.0.3
source_x86_64=("SchemaSmith-${pkgver}-linux-x64.tar.gz::${url}/releases/download/v${pkgver}/SchemaSmith-${pkgver}-linux-x64.tar.gz")
source_aarch64=("SchemaSmith-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/SchemaSmith-${pkgver}-linux-arm64.tar.gz")
source=("LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
sha256sums=('SKIP')
sha256sums_x86_64=('8d79e5545c4435ac04c23c9e16829ce87e8c15bc11865fdbf6bb1d3948f3d0d0')
sha256sums_aarch64=('9d39d6d272113063547cff384d2538534a688ed6b5cc22fc9af9f207a7ba4653')

package() {
  install -dm755 "${pkgdir}/usr/lib/schemasmith" "${pkgdir}/usr/bin"

  local tool lc
  for tool in SchemaQuench SchemaTongs DataTongs SchemaShears; do
    lc="${tool,,}"
    install -Dm755 "${srcdir}/${tool}" "${pkgdir}/usr/lib/schemasmith/${lc}"
    ln -s "/usr/lib/schemasmith/${lc}" "${pkgdir}/usr/bin/${lc}"
  done

  # ICU libraries the self-contained binaries load from their own directory.
  install -m644 "${srcdir}"/libicu*.so.* -t "${pkgdir}/usr/lib/schemasmith/"

  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
