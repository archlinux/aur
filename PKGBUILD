# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: DDoSolitary <DDoSolitary@gmail.com>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=travis
pkgname=ruby-$_gemname
pkgver=1.14.0
pkgrel=3
pkgdesc='Travis CI Client (CLI and Ruby library)'
arch=(any)
url='https://github.com/travis-ci/travis.rb'
license=(MIT)
depends=(ruby-faraday ruby-faraday-rack ruby-highline ruby-json_pure ruby-launchy ruby-pusher-client ruby-rack-test ruby-travis-gh)
makedepends=('ruby-rdoc' 'ruby-rake' 'ruby-bundler')
options=(!emptydirs)
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6fe418bf33b025a106dd99762aa8ebc595b4b549d4087c6921d5565b741f7361')

prepare() {
  cd "travis.rb-${pkgver}"

  # we built based on a tar archive, not a git repo
  sed --in-place 's/git ls-files/find/' "${_gemname}.gemspec"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_gemname}.gemspec"

  sed --in-place --regexp-extended 's|travis-gh|gh|g' "${_gemname}.gemspec"
}

build() {
  cd "travis.rb-${pkgver}"

  rake build
}
package() {
  cd "travis.rb-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem install --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "pkg/${_gemname}-${pkgver}.gem"

  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}
