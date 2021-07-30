# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=shellany
pkgname=ruby-${_gemname}
pkgver=0.0.1
pkgrel=1
pkgdesc="Portable shell command output capturing"
arch=(any)
depends=(ruby)
checkdepends=(ruby-bundler ruby-rspec ruby-rake ruby-nenv)
makedepends=(git rubygems ruby-rdoc)
url=https://github.com/guard/shellany
license=(MIT)
options=(!emptydirs)
source=(git+https://github.com/guard/shellany.git?tag=v${pkgver})
sha256sums=('SKIP')

prepare() {
  cd $_gemname
  sed -i '/codeclimate/d' Gemfile
  sed -i 's|~>|>=|g' ${_gemname}.gemspec
  sed -i 's|~>|>=|g' Gemfile
  sed -i '/codeclimate/Id' spec/spec_helper.rb
}

build() {
  cd $_gemname
  gem build ${_gemname}.gemspec
}

check() {
  cd $_gemname
  rake spec
}

package() {
  cd $_gemname
  local _gemdir="$(gem env gemdir)"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm -rf "$pkgdir/$_gemdir/cache"

  install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=2 sw=2 et:
