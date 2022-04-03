# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Benjamin Chrétien <chretien dot b plus aur at gmail dot com>

_gemname=parallel
pkgname=ruby-$_gemname
pkgver=1.22.1
pkgrel=1
pkgdesc="Ruby: parallel processing made simple and fast"
arch=(any)
url=https://github.com/grosser/parallel
license=(MIT)
depends=(ruby)
checkdepends=(ruby-bundler ruby-rake ruby-rspec ruby-bump ruby-activerecord
              ruby-ruby-progressbar ruby-mysql2 ruby-sqlite3 procps-ng lsof)
makedepends=(rubygems ruby-rdoc)
options=(!emptydirs)
source=(${url}/archive/v$pkgver/$_gemname-$pkgver.tar.gz)
sha256sums=('21c457a5b7cf7fba400aefc62758f987a535ec371d1dc80231956ec635d5432a')

prepare() {
  cd $_gemname-$pkgver
  rm Gemfile.lock
  sed -i '/rspec-rerun/d' Gemfile
  sed -i '/rspec-legacy_formatters/d' Gemfile
  sed -i '/rubocop/d' Gemfile
  sed -i 's|git ls-files|find|' ${_gemname}.gemspec
}

build() {
  cd $_gemname-$pkgver
  gem build ${_gemname}.gemspec
}

check() {
  cd $_gemname-$pkgver
  rspec spec
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

  install -Dm0644 MIT-LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 Readme.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=2 sw=2 et:
