# Maintainer: SchemaSmith Contributors <support@schemasmith.com>
# Version and the two linux tarball SHA-256s are filled in by packaging/aur/render.sh at release time.
pkgname=schemasmith-bin
pkgver=2.8.0
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
sha256sums_x86_64=('8e0771166d97229ce0dd9a4ab64ca078e3bc09487ef54777693c1f8ab5088f4d')
sha256sums_aarch64=('9c041eec8d5f0df6fd1168d495389444429edf2fedee757b9805fd28b1e9a9c2')

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
