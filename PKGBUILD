# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Co-Maintainer: xiretza <xiretza+aur@xiretza.xyz>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='pgbackrest'
pkgver='2.54.1'
pkgrel='1'
pkgdesc='Reliable PostgreSQL Backup & Restore'
arch=('x86_64' 'aarch64')
url="https://github.com/${pkgname}/${pkgname}"
license=('MIT')
depends=('openssl' 'libxml2' 'icu' 'gcc-libs' 'bzip2' 'lz4'
         'xz' 'zstd' 'perl' 'postgresql-libs')
makedepends=('meson' 'libyaml')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/release/${pkgver}.tar.gz")
sha256sums=('33244127a341d54ebe6a9d2e13f7b313dbf80d4fd99eae998ca28572bd5cc622')
backup=("etc/${pkgname}/${pkgname}.conf")

prepare() {
  arch-meson "${pkgname}-release-${pkgver}" "build"
}

build() {
  meson compile -C "build"
}

package() {
  meson install -C "build" --destdir "${pkgdir}"

  install -Dm0755 -d "${pkgdir}/etc/${pkgname}"
  echo "# Placeholder configuration file" > "${pkgdir}/etc/${pkgname}/${pkgname}.conf"
  echo "# See the documentation at https://${pkgname}.org/configuration.html" >> \
    "${pkgdir}/etc/${pkgname}/${pkgname}.conf"

  install -Dm0644 "${pkgname}-release-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
