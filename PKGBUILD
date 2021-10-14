# Maintainer: Tim Meusel <tim@bastelfreak.de>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: farwayer <farwayer@gmail.com>
# Contributor: Tim Meusel <tim@bastelfreak.de>

_gemname='httpclient'
pkgname="ruby27-${_gemname}"
pkgver=2.8.3
pkgrel=2
pkgdesc='gives something like the functionality of libwww-perl (LWP) in Ruby'
arch=('any')
url="https://github.com/nahi/${_gemname}"
license=('RUBY')
makedepends=('ruby27-rdoc')
depends=('ruby2.7')
options=(!emptydirs)
source=("${url}/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz"
        'disable-broken-TLS-test.patch')
sha512sums=('b65b5adb97af069d7ff6b6f4cccd6a42c6d9c88b797e9495768fe1f36a6bd93defe50190edc201de5e39c4e306ba0bd17a8ff2f8eba4d636dacafa06c172967d'
            'fcdb88f83ea1663f1f21113f7943223ffc1c69dc0f1305d74e8a96b3752f905c1bfa3727f2eb9dae9742db16d222ba5971a072b065a6c7ce535615b51fdb8712')

prepare() {
  cd "${srcdir}/${_gemname}-${pkgver}"

  # Allow latest gem dependencies
  sed --in-place 's|~>|>=|g' Gemfile

  # fix wrong license name in gemspec
  sed --in-place "s/'ruby'/'Ruby'/" "${_gemname}.gemspec"

  # don't load the bundler setup. That would require us to
  # provide all 'development' dependencies
  sed --in-place '/setup/d' Rakefile

  # test_auth.rb does a bunch of windows specific NTLM tests
  # they don't apply to Arch
  rm test/test_auth.rb

  # one test verifies the openssl store.
  # a) this test has nothing to do with the actual httpclient
  # b) the used certificate is expiried so the test fails
  patch --forward --verbose --strip=1 --input='../disable-broken-TLS-test.patch'
}

build() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  gem-2.7 build "${_gemname}.gemspec"
}

package() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  local _gemdir="$(gem-2.7 env gemdir)"
  gem-2.7 install --verbose --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"

  install -Dm 644 README.md CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname}/"

  rm -rf "${pkgdir}/${_gemdir}/cache"

  mv "${pkgdir}/usr/bin/${_gemname}" "${pkgdir}/usr/bin/ruby27-${_gemname}"
}

# vim: ts=2 sw=2 et:
