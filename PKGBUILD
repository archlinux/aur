# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname='html2haml'
pkgname="ruby-${_gemname}"
pkgver=2.2.0
pkgrel=1
pkgdesc="Converts HTML into Haml"
arch=('any')
url='https://haml.info/'
license=('MIT')
options=(!emptydirs)
depends=('ruby' 'ruby-erubis' 'ruby-haml' 'ruby-nokogiri' 'ruby-ruby_parser')
makedepends=('ruby-bundler' 'ruby-rake')
checkdepends=('ruby-minitest')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/haml/html2haml/archive/v${pkgver}.tar.gz")
sha512sums=('ff5d1fbd3c1c3b769d67da8d8dc34a545041e47f3b443867b91bd504c28dae59a343a2db7ef0d88c2dd3cded468c6ed6b1b157436acbbcc3c8bc0934035c4d68')

prepare() {
  cd "${_gemname}-${pkgver}"

  # we built based on a tar archive, not a git repo
  sed --in-place 's/git ls-files/find/' "${_gemname}.gemspec"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_gemname}.gemspec"

  # ignore code coverage
  sed --in-place '/simplecov/d' "${_gemname}.gemspec"
}

build() {
  cd "${_gemname}-${pkgver}"

  rake build
}

check() {
  cd "${_gemname}-${pkgver}"

  rake test
}

package() {
  cd "${_gemname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem install --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "pkg/${_gemname}-${pkgver}.gem"

  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

  install -Dm 644 MIT-LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 Changelog.markdown README.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}
