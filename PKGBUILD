# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname='database_cleaner-core'
pkgname="ruby-${_gemname}"
pkgver=2.0.1
pkgrel=2
pkgdesc='Strategies for cleaning databases. Can be used to ensure a clean slate for testing.'
arch=('any')
url='https://github.com/DatabaseCleaner/database_cleaner'
license=('MIT')
options=(!emptydirs)
depends=('ruby')
makedepends=('ruby-bundler' 'ruby-rake' 'ruby-rspec')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('b41d5388c74ccaf9e72f9e6ab6b7cc6ead2706409236b38419d7ef3935b90766e04ad2bfef0ee58a07c0b9051452cab314545cd023853985aac46efaf0922eaa')

prepare() {
  cd "database_cleaner-${pkgver}"

  # we built based on a tar archive, not a git repo
  sed --in-place 's/git ls-files -z/find . -print0/' "${_gemname}.gemspec"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_gemname}.gemspec" Gemfile

  # ignore tests for now
  sed --in-place '/cucumber/Id' Rakefile
}

build() {
  cd "database_cleaner-${pkgver}"

  rake build
}

package() {
  cd "database_cleaner-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "pkg/${_gemname}-${pkgver}.gem"

  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 ADAPTERS.md CONTRIBUTE.markdown History.rdoc README.markdown --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}
