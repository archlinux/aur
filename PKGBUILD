# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=rubocop-rails
pkgname=ruby-${_gemname}
pkgver=2.11.3
pkgrel=1
pkgdesc="Automatic Rails code style checking tool"
arch=(any)
depends=(ruby ruby-rubocop ruby-activesupport ruby-rack)
checkdepends=(ruby-bundler ruby-rake ruby-rspec ruby-yard ruby-bump
              ruby-rubocop-performance ruby-rubocop-rspec ruby-test-queue)
makedepends=(git rubygems ruby-rdoc)
url=https://docs.rubocop.org/rubocop-rails/
license=(MIT)
options=(!emptydirs)
source=(git+https://github.com/rubocop/${_gemname}.git?tag=v${pkgver})
sha256sums=('SKIP')

prepare() {
  cd $_gemname
  sed -i '/yard/d' Gemfile
  sed -i '/simplecov/d' Gemfile
  sed -i "s/, github: 'rubocop\/rubocop'//" Gemfile
  # rubocop-rspec on the aur is _old_
  sed -i "s/, '~> 2.4.0'//" Gemfile
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
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm -rf "$pkgdir/$_gemdir/cache"

  install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

# vim: set ts=2 sw=2 et:
