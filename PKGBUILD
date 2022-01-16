# Contributor: Tim Meusel <tim@bastelfreak.de>
# Contributor: Remy Adriaanse <remy@adriaanse.it>

_gemname='net-scp'
pkgname="ruby-${_gemname}"
pkgver=3.0.0
pkgrel=1
pkgdesc='A pure Ruby implementation of the SCP client protocol'
arch=('any')
url='https://github.com/net-ssh/net-scp'
license=('MIT')
depends=('ruby' 'ruby-net-ssh')
makedepends=('ruby-rake' 'ruby-bundler' 'ruby-rdoc')
checkdepends=('ruby-minitest' 'ruby-mocha' 'ruby-test-unit')
options=('!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('6d68b75124ccd2d387983f6d66a8b0e040132ba17d942631c806e899dff757ffae7a031a27ea0988166bf56e803c1a6175199845a848b92c7064388564e0ac79')

prepare() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  sed -E 's|~>|>=|g' -i ${_gemname}.gemspec Gemfile
  sed --in-place 's|`git ls-files -z`|`find . -print0`|' "${_gemname}.gemspec"
}

build() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  gem build ${_gemname}.gemspec
}

check() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  rake test
}

package() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  local _gemdir="$(gem env gemdir)"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  install -Dm 644 README.rdoc CHANGES.txt net-scp-public_cert.pem -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}

# vim: ts=2 sw=2 et:
