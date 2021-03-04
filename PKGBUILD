# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname='database_cleaner-active_record'
pkgname="ruby-${_gemname}"
pkgver=2.0.0
pkgrel=2
pkgdesc='Strategies for cleaning databases using ActiveRecord. Can be used to ensure a clean state for testing.'
arch=('any')
url="https://github.com/DatabaseCleaner/${_gemname}"
license=('MIT')
options=(!emptydirs)
depends=('ruby' 'ruby-activerecord' 'ruby-database_cleaner-core')
makedepends=('git' 'ruby-bundler' 'ruby-rake' 'ruby-rspec')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('399ed6fe0374ba463cbb113cbd21e504dc1358bce5ebb64c58fc9e1c8f2fc5441e69c206966123e8c31f27551a5b163a845245dc29866a020c01fdc5a94f58ca')

prepare() {
  cd "${_gemname}-${pkgver}"

  # we built based on a tar archive, not a git repo
  sed --in-place 's/git ls-files -z/find . -print0/' "${_gemname}.gemspec"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_gemname}.gemspec" Gemfile
}

build() {
  cd "${_gemname}-${pkgver}"

  rake build
}

package() {
  cd "${_gemname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem install --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "pkg/${_gemname}-${pkgver}.gem"

  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}
