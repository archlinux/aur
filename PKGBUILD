# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname='database_cleaner-active_record'
pkgname="ruby-${_gemname}"
pkgver=2.0.1
pkgrel=1
pkgdesc='Strategies for cleaning databases using ActiveRecord. Can be used to ensure a clean state for testing'
arch=('any')
url="https://github.com/DatabaseCleaner/${_gemname}"
license=('MIT')
options=(!emptydirs)
depends=('ruby' 'ruby-activerecord' 'ruby-database_cleaner-core')
makedepends=('ruby-bundler' 'ruby-rake' 'ruby-rspec')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('f08ab3413be5fe1b17913d629054971997f95ac6551d7a5c07b5169367d0dcc4c0709487bbdae23c659c0b61548097c30110b6b0850ba6d96e92fa6814e8e926')

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
