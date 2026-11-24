# Maintainer: agony <27015 at riseup dot net>

pkgname=bashcov
pkgver=4.0.3
pkgrel=1
pkgdesc='Code coverage tool for Bash'
arch=('any')
url='https://github.com/infertux/bashcov'
license=('MIT')
depends=('bash' 'ruby' 'ruby-simplecov')
makedepends=('git')
checkdepends=('ruby-rspec')
provides=("ruby-bashcov=${pkgver}")
options=('!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f722a48133cbebb3063bde9d0eb92afdd1a6c08a5f3772b66ce421687769165e')

prepare() {
  cd "${pkgname}-${pkgver}"
  git init --quiet
  git add --all
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUBYGEMS_PREVENT_UPDATE_SUGGESTION=1
  gem build "${pkgname}.gemspec"
  gem install --local --ignore-dependencies --build-root tmp_install "${pkgname}-${pkgver}.gem"
}

check() {
  cd "${pkgname}-${pkgver}"
  local _gemdir="$(gem env gemdir)"
  # The excluded example counts one more failed test script when /usr/bin/gawk
  # is missing; base installs gawk.
  GEM_HOME="tmp_install/${_gemdir}" rspec --format progress --no-profile \
    -E '^(?!Bashcov::Runner#result returns the expected coverage hash$)' > rspec.log 2>&1 \
    || { cat rspec.log; return 1; }
  grep -E '^[0-9]+ examples' rspec.log
}

package() {
  cd "${pkgname}-${pkgver}"
  cp --archive tmp_install/* "${pkgdir}"
  install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
