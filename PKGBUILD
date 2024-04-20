# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Co-Maintainer: xiretza <xiretza+aur@xiretza.xyz>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='pgbackrest'
pkgver='2.51'
pkgrel='3'
pkgdesc='Reliable PostgreSQL Backup & Restore'
arch=('x86_64' 'aarch64')
url="https://github.com/${pkgname}/${pkgname}"
license=('MIT')
depends=('openssl' 'libxml2' 'icu' 'gcc-libs' 'bzip2' 'lz4'
         'xz' 'zstd' 'perl' 'postgresql-libs')
makedepends=('meson' 'libyaml')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/release/${pkgver}.tar.gz"
	"${pkgname}-2312.patch::${url}/pull/2312.patch")
sha256sums=('9fa6760032927de448251fb1e5b824e2d17caf560796e74947275b72dc20ed2a'
            '06d91331905520397b811cfe62850e614a6371283787ce9ea508044a091380c4')
backup=("etc/${pkgname}/${pkgname}.conf")

prepare() {
  patch -Ntp1 -i "../${pkgname}-2312.patch" -d "${pkgname}-release-${pkgver}" || :
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
