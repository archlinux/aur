# Maintainer: Michał Lisowski <lisu@riseup.net>
pkgname=whatmask
pkgver=1.0.9
pkgrel=1
epoch=1
pkgdesc="Small program that will help you with network settings"
arch=('i686' 'x86_64')
url="https://github.com/geezyx/whatmask"
license=('GPL3')
depends=()
makedepends=('ruby')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/geezyx/whatmask/archive/v$pkgver.tar.gz"
  'gem_files.patch'
)
md5sums=('06a1b669cc7ab211397d68bb944db7a0'
         '606617d2668045dd6898f181c9a18068')

prepare() {
  cd "${pkgname}-${pkgver}"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${pkgname}.gemspec"

  patch --forward --strip=1 --input="${srcdir}/gem_files.patch"
}

build() {
  cd "${pkgname}-${pkgver}"

  gem build "${pkgname}.gemspec"
}

package() {
  cd "${pkgname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "${pkgdir}/${_gemdir}" \
    --bindir "${pkgdir}/usr/bin" \
    "${pkgname}-${pkgver}.gem"
}
