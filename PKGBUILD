# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname='xpath'
pkgname="ruby-${_gemname}"
pkgver=3.2.0
pkgrel=1
pkgdesc="XPath is a Ruby DSL for generating XPath expressions"
arch=('any')
url='https://github.com/teamcapybara/xpath'
license=('MIT')
options=(!emptydirs)
depends=('ruby' 'ruby-nokogiri')
makedepends=('ruby-bundler' 'ruby-rake' 'ruby-rspec')
checkdepends=('ruby-pry')
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
    remove_yard_dependency.patch
)
sha512sums=('432fd92c66aefa1ef13f276dffbd6d196e0a38f1d3337a9aaf8356f25d61884616fb140bc74b425466634648533dc221c5b369810bc344a9d48968bd51d6af31'
            '2a77db41ff6652a10149b9a188f6cced85dac66504b82234f4b0b7e0bc73bb71fb79849485fc56253674c039ec087c0bad76007082b54e359ac73e39ad171ef2')

prepare() {
  cd "${_gemname}-${pkgver}"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_gemname}.gemspec"

  # remove unneeded dependencies
  patch --strip=1 --input=../remove_yard_dependency.patch
}

build() {
  cd "${_gemname}-${pkgver}"

  rake build
}

check() {
  cd "${_gemname}-${pkgver}"

  rake spec
}

package() {
  cd "${_gemname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem install --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "pkg/${_gemname}-${pkgver}.gem"

  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 CHANGELOG.md README.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}
