# Maintainer: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Tim Meusel <tim@bastelfreak.de>
# Contributor: Simon Kohlmeyer <simon.kohlmeyer@gmail.com>

_gemname='crack'
pkgname="ruby-${_gemname}"
pkgver=0.4.4
pkgrel=2
pkgdesc='Really simple JSON and XML parsing, ripped from Merb and Rails.'
arch=('any')
url='https://github.com/jnunemaker/crack/'
license=('MIT')
makedepends=('ruby-rdoc')
depends=('ruby' 'ruby-safe_yaml' 'ruby-rexml')
checkdepends=('ruby-minitest')
options=(!emptydirs)
source=("${url}/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha512sums=('3f86c76718a3c2a65ee11b15434035396c2355a8562bdb642432a659b52c3e811e930318e0dc2df3ff06bd53ac14d0694471e425420ae3b7971f5d4f818bba87')

prepare() {
  cd "${srcdir}/${_gemname}-${pkgver}"

  # we build with a tar ball, so `git` won't work
  sed --in-place 's|git ls-files|find|' "${_gemname}.gemspec"

  # `rake` isn't an actual dependency, so we can remove it
  sed --in-place '/rake/d' Gemfile
}

build() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  gem build "${_gemname}.gemspec"
}

check() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  # the project doesn't use rake tasks for test
  # this is based on:
  # https://github.com/jnunemaker/crack/blob/4ecf9cf5f721dea61b8fa86280180142ead35312/script/test#L23
  ruby -I lib -I test -r rubygems -e 'Dir["test/**/*_test.rb"].each { |f| load f }'
}
package() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  local _gemdir="$(gem env gemdir)"
  gem install --verbose --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"

  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm 644 README.md History -t "${pkgdir}/usr/share/doc/${pkgname}"
  rm -rf "${pkgdir}/${_gemdir}/cache"
}

# vim: ts=2 sw=2 et:
