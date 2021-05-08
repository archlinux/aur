# Maintainer: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Tim Meusel <tim@bastelfreak.de>

_gemname='hashdiff'
pkgname="ruby-${_gemname}"
pkgver=1.0.0
pkgrel=3
pkgdesc='Library to compute the smallest difference between two hashes'
arch=('any')
url='https://github.com/liufengyun/hashdiff'
license=('MIT')
makedepends=('ruby-rdoc' 'ruby-bundler')
checkdepends=('ruby-rake' 'ruby-rspec')
depends=('ruby')
options=(!emptydirs)
source=("${url}/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha512sums=('48cb3284254822b170c46e794cb877272b12335decc867131c4105253d9073968f6fafffcb2907562da70c66e2ca18ab33d98fa14c3bab6b5cc8e6dbe66e5504')

prepare() {
  cd "${srcdir}/${_gemname}-${pkgver}"

  # use `find` instead of `git`, since we have a tar ball and not a VCS repository
  sed --in-place 's/git ls-files.*`/find`/g' "${_gemname}.gemspec"
  sed --in-place '/test_files/d' "${_gemname}.gemspec"

  # rubocop would test if the code works on a legay ruby platform
  sed --in-place '/rubocop/d' Rakefile
  sed --in-place '/RuboCop/d' Rakefile

  # loading bundler isn't required and often triggers side effects
  # because it wants *all* gems from gemspec + Gemfile
  sed --in-place '/Bundler/d' Rakefile
  sed --in-place '/Bundler/d' Rakefile

  # the project has a few dependencies for releasing
  sed --in-place '/bluecloth/d' "${_gemname}.gemspec"
  sed --in-place '/rubocop/d' "${_gemname}.gemspec"
  sed --in-place '/yard/d' "${_gemname}.gemspec"
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

  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  rm -rf "${pkgdir}/${_gemdir}/cache"
}

# vim: ts=2 sw=2 et:
