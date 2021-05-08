# Maintainer: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Tim Meusel <tim@bastelfreak.de>

_gemname='rspec-its'
pkgname="ruby-${_gemname}"
pkgver=1.3.0
pkgrel=4
pkgdesc='RSpec extension gem for attribute matching'
arch=('any')
url='https://github.com/rspec/rspec-its'
license=('MIT')
makedepends=('ruby-rdoc')
checkdepends=('ruby-rake' 'ruby-minitest' 'ruby-test-unit')
depends=('ruby' 'ruby-rspec')
options=(!emptydirs)
source=("${url}/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz"
        'disable-cucumber.patch')
sha512sums=('97be9ba1f46db44a3d60676056d5ad66ee84585ff133ffaf25c42fc1e899c33d9841a9440336a8bd52c58685d8b2b5505c5cef7bfb5d634bcbc370c4b1a8a287'
            'b70417982922bbef379c5245c1c97a5b18771a5fc1884146c1c297fc54ae29f55d143e24e5e4d81e775de53d95bbe86fc80087be3ac3ea7669b1bbf1f44fd2ef')

prepare() {
  cd "${srcdir}/${_gemname}-${pkgver}"

  # we build with a tar archive, so `git` won't work
  sed --in-place 's|`git ls-files`.split($/)|`find`.split("\\n")|' "${_gemname}.gemspec"

  # disable unneeded dependencies
  patch --forward --verbose --strip=1 --input='../disable-cucumber.patch'
  sed --in-place '/.*dependency.*cucumber/d' "${_gemname}.gemspec"
  sed --in-place '/aruba/d' "${_gemname}.gemspec"
  sed --in-place '/bundler/d' "${_gemname}.gemspec"
}

build() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  gem build "${_gemname}.gemspec"
}

check() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  rake spec
}

package() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  local _gemdir="$(gem env gemdir)"
  gem install --verbose --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"

  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  rm -rf "${pkgdir}/${_gemdir}/cache"
}

# vim: ts=2 sw=2 et:
