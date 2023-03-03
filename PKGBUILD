# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=yardstick
pkgname=ruby-$_gemname
pkgver=0.9.9
pkgrel=1
pkgdesc="Measure YARD documentation coverage"
arch=(any)
url=https://github.com/dkubb/yardstick
license=(MIT)
depends=(ruby ruby-yard ruby-concord ruby-ice_nine ruby-adamantium
         ruby-abstract_type)
checkdepends=(ruby-rspec ruby-rspec-its)
makedepends=(rubygems ruby-rdoc)
options=(!emptydirs)
source=(${url}/archive/v${pkgver}.tar.gz)
sha256sums=('67bec98bcb06f21b2e02d5fd26fcaf096f6c8eeaab01ebbf6ca5b6d78dae1d3c')

prepare() {
  cd $_gemname-$pkgver

  # we use a tarball, not a git checkout
  sed -i 's/git ls-files --/find/' ${_gemname}.gemspec
  sed -i 's/git ls-files/find/' ${_gemname}.gemspec

  # sed -i -e "/require 'devtools/d" spec/spec_helper.rb
  # echo 'require "rspec/its"' >> spec/spec_helper.rb
  # echo 'require "./spec/shared/measured_itself_behavior"' >> spec/spec_helper.rb
}

build() {
  cd $_gemname-$pkgver
  gem build ${_gemname}.gemspec
}

check() {
  cd $_gemname-$pkgver
  # disabled for now as there is a mega-dependency on (ruby-)devtools
  # rspec
}

package() {
  cd $_gemname-$pkgver
  local _gemdir="$(gem env gemdir)"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm -rf "$pkgdir/$_gemdir/cache"

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=2 sw=2 et:
