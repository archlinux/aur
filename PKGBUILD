# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname='bootsnap'
pkgname="ruby-${_gemname}"
pkgver=1.13.0
pkgrel=1
pkgdesc="Boot large ruby/rails apps faster"
arch=('any')
url='https://github.com/Shopify/bootsnap'
license=('MIT')
options=(!emptydirs)
depends=('ruby' 'ruby-msgpack')
makedepends=('ruby-bundler' 'ruby-rake-compiler' 'ruby-rake')
checkdepends=('ruby-minitest' 'ruby-mocha')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('ea762680735540d37c98d1fba45bc6d416fc3c176f91626d93b345435bd9690aa439a26ffed43ddbf4810babb91b8cbf87f92546525d536a427cdb57f49262e1')

prepare() {
  cd "${_gemname}-${pkgver}"

  # we built based on a tar archive, not a git repo
  sed --in-place 's/git ls-files -z ext lib/find ext lib -type f -print0/' "${_gemname}.gemspec"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_gemname}.gemspec"

  # ignore code style checks
  sed --in-place '/rubocop/d' Gemfile

  # ignore debugger
  sed --in-place '/byebug/d' Gemfile
}

build() {
  cd "${_gemname}-${pkgver}"

  rake build
}

check() {
  cd "${_gemname}-${pkgver}"

  rake compile
  rake test
}

package() {
  cd "${_gemname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem install --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "pkg/${_gemname}-${pkgver}.gem"

  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 CHANGELOG.md CODE_OF_CONDUCT.md CONTRIBUTING.md README.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}
