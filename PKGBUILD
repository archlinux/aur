# Maintainer: agony <27015 at riseup dot net>

pkgname=ruby-simplecov-cobertura
_name=simplecov-cobertura
pkgver=4.0.0
pkgrel=1
pkgdesc='SimpleCov formatter that produces Cobertura XML coverage reports'
arch=('any')
url='https://github.com/jessebs/simplecov-cobertura'
license=('Apache-2.0')
depends=('ruby' 'ruby-rexml' 'ruby-simplecov')
makedepends=('git')
checkdepends=('ruby-bundler' 'ruby-nokogiri' 'ruby-rake' 'ruby-test-unit')
options=('!emptydirs')
source=("${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('af63b0b6bca0d30fe0e95cf1c3ceda4f32ac6bbc43a523655a4600aa3629b5b1')

prepare() {
  cd "${_name}-${pkgver}"
  git init --quiet
  git add --all
}

build() {
  cd "${_name}-${pkgver}"
  export RUBYGEMS_PREVENT_UPDATE_SUGGESTION=1
  gem build "${_name}.gemspec"
  gem install --local --ignore-dependencies --build-root tmp_install "${_name}-${pkgver}.gem"
}

check() {
  cd "${_name}-${pkgver}"
  local _gemdir="$(gem env gemdir)"
  # test_groups and test_no_groups need the source directory named simplecov-cobertura
  # and a path shorter than 80 characters: REXML wraps a longer <source> text.
  GEM_HOME="tmp_install/${_gemdir}" rake test TESTOPTS="--ignore-name=test_groups --ignore-name=test_no_groups"
}

package() {
  cd "${_name}-${pkgver}"
  cp --archive tmp_install/* "${pkgdir}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
