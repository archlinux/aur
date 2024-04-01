# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Co-Maintainer: xiretza <xiretza+aur@xiretza.xyz>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='pgbackrest'
pkgver='2.51'
pkgrel='2'
pkgdesc='Reliable PostgreSQL Backup & Restore'
arch=('x86_64')
url="https://github.com/${pkgname}/${pkgname}"
license=('MIT')
depends=('openssl' 'libxml2' 'icu' 'gcc-libs' 'bzip2' 'lz4'
         'xz' 'zstd' 'perl' 'postgresql-libs')
makedepends=('meson' 'libyaml')
source=(
	"$pkgname-$pkgver.tar.gz::${url}/archive/release/${pkgver}.tar.gz"
	"fix-meson-install.patch"
)
sha256sums=('9fa6760032927de448251fb1e5b824e2d17caf560796e74947275b72dc20ed2a'
            'd86e3e47ce6d960c8e501b93c691f003f9fe001149c5b099fee0e2297c66f6c3')
backup=("etc/${pkgname}/${pkgname}.conf")

prepare() {
  cd "$pkgname-release-$pkgver"
  patch -p1 < "$srcdir/fix-meson-install.patch"
  meson subprojects download
}

build() {
  arch-meson "$pkgname-release-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  mkdir -p "${pkgdir}/etc/${pkgname}"
  echo "# Placeholder configuration file" > "${pkgdir}/etc/${pkgname}/${pkgname}.conf"
  echo "# See the documentation at https://${pkgname}.org/configuration.html" >> \
    "${pkgdir}/etc/${pkgname}/${pkgname}.conf"

  install -Dm0644 "$pkgname-release-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
