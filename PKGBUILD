# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Co-Maintainer: xiretza <xiretza+aur@xiretza.xyz>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='pgbackrest'
pkgver='2.48'
pkgrel='1'
pkgdesc='Reliable PostgreSQL Backup & Restore'
arch=('x86_64')
url="https://github.com/${pkgname}/${pkgname}"
license=('MIT')
depends=('openssl' 'libxml2' 'icu' 'gcc-libs' 'bzip2' 'lz4'
         'xz' 'zstd' 'perl' 'postgresql-libs')
makedepends=('libyaml')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/release/${pkgver}.tar.gz")
sha256sums=('ec470e8dc401f746bfe6dd65f5b720e53ca4db0d9310537f0efc6ee54edb649d')
backup=("etc/${pkgname}/${pkgname}.conf")

prepare() {
  cd "${pkgname}-release-${pkgver}/src"
  ./configure \
    --prefix="/usr"
}

build() {
  cd "${pkgname}-release-${pkgver}/src"
  make
}

package() {
  cd "${pkgname}-release-${pkgver}/src"
  make DESTDIR="${pkgdir}" install

  mkdir -p "${pkgdir}/etc/${pkgname}"
  echo "# Placeholder configuration file" > "${pkgdir}/etc/${pkgname}/${pkgname}.conf"
  echo "# See the documentation at https://${pkgname}.org/configuration.html" >> \
    "${pkgdir}/etc/${pkgname}/${pkgname}.conf"

  install -Dm644 "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
