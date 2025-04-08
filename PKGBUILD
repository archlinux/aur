# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>
_gemname='database_cleaner-core'
pkgname="ruby-${_gemname}"
pkgver=2.1.0
pkgrel=1
pkgdesc='Strategies for cleaning databases. Can be used to ensure a clean slate for testing'
arch=('any')
url='https://github.com/DatabaseCleaner/database_cleaner'
license=('MIT')
options=(!emptydirs)
depends=('ruby')
makedepends=('ruby-bundler' 'ruby-rake' 'ruby-rspec')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('7bcceba63399698a98d299e5b15480682885c360e0177cb521c435ce087d8b53e09c0acd0d32a051551208a6cb0f5e926ffd44e7d641e35d438fddb9535acf6c')

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
