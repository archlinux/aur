# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=notiffany
pkgname=ruby-${_gemname}
pkgver=0.1.3
pkgrel=1
pkgdesc="Wrapper libray for most popular notification libraries"
arch=(any)
depends=(ruby)
checkdepends=(ruby-bundler ruby-rspec ruby-rake ruby-nenv ruby-guard-rspec ruby-listen ruby-shellany)
makedepends=(git rubygems ruby-rdoc)
url=https://github.com/guard/notiffany
license=(MIT)
options=(!emptydirs)
source=(git+https://github.com/guard/notiffany.git?tag=v${pkgver})
sha256sums=('SKIP')

prepare() {
  cd $_gemname
  sed -i '/rubocop/d' Gemfile
  sed -i 's|~>|>=|g' ${_gemname}.gemspec

  # it literally fails the dumbest test...
  # https://github.com/guard/notiffany/pull/31
  sed -i "1irequire 'notiffany'" spec/notiffany_spec.rb
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
