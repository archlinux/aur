# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Aoibhinn Nic Aoidh <oibindnicaoidh@gmail.com>
# Contributor: Barry Smith <brrtsm@gmail.com>
# Contributor: Florent H. CARRÉ <colundrum@gmail.com>

_gemname=thread_safe
pkgname=ruby-$_gemname
pkgver=0.3.6
pkgrel=3
pkgdesc='(Deprecated) Thread-safe collections and utilities for Ruby'
arch=(any)
url="https://github.com/ruby-concurrency/${_gemname}"
license=('Apache-2.0')
depends=('ruby')
makedepends=(
  'ruby-rdoc'
  'rubygems'
)
checkdepends=(
  'ruby-bundler'
  'ruby-rake'
  'ruby-rspec'
  'ruby-rspec-core'
  'ruby-yard'
)
options=(!emptydirs)
_tarname="${_gemname}-${pkgver}"
source=("${_tarname}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('32719abb80a126cb228dbd84b3f83fe418507609144a0e062cd0c0cd9c5c92db3ac7c093796378fae98acded9f91a7c3aae96965580fccdc4a35f323925ddca1')

prepare() {
  cd "${_tarname}"
  sed -e 's|~>|>=|g' \
    -e "s|, '[<=]\+ [0-9.]\+'||g" \
    -i "${_gemname}.gemspec"
  sed -e 's|~>|>=|g' \
    -e "s|, '[<=]\+ [0-9.]\+'||g" \
    -i Gemfile

  # we use a tarball, not a git checkout
  sed -e 's/git ls-files --/find/' -i ${_gemname}.gemspec
  sed -e 's/git ls-files/find/' -i ${_gemname}.gemspec

  # remove unneeded code coverage plugins
  sed -e "/require 'simplecov'/d" -i ./spec/spec_helper.rb
  sed -e "/require 'coveralls'/d" -i ./spec/spec_helper.rb
  sed -e "/^SimpleCov/,/^end/d" -i ./spec/spec_helper.rb

  # fix hasbang line to allow passing the arguments to ruby
  sed -e "s|#!/usr/bin/env ruby |#!/usr/bin/env -S ruby |" -i ./examples/bench_cache.rb
}

build() {
  cd "${_tarname}"
  gem build ${_gemname}.gemspec
}

check() {
  cd "${_tarname}"
  rake test
}

package() {
  cd "${_tarname}"
  local _gemdir="$(gem env gemdir)"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "${pkgdir}/${_gemdir}" \
    -n "${pkgdir}/usr/bin" \
    "${_tarname}.gem"

  rm -rf "${pkgdir}/${_gemdir}/cache"

  install -Dm0644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
