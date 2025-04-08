# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname='database_cleaner-active_record'
pkgname="ruby-${_gemname}"
pkgver=2.2.0
pkgrel=1
pkgdesc='Strategies for cleaning databases using ActiveRecord. Can be used to ensure a clean state for testing'
arch=('any')
url="https://github.com/DatabaseCleaner/${_gemname}"
license=('MIT')
options=(!emptydirs)
depends=('ruby' 'ruby-activerecord' 'ruby-database_cleaner-core')
makedepends=('ruby-bundler' 'ruby-rake' 'ruby-rspec')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('0910d281a573b3f0c142aec382e3f4b5fbfeb6ee5ae117dd10e5ddf3ef82479263629a379481a8b6b15eee813ac1d6e6f58e3713bf5e0f597e91c860c9e01b06')

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
