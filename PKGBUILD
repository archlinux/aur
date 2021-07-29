# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Benjamin Chrétien <chretien dot b plus aur at gmail dot com>

_gemname=parallel
pkgname=ruby-$_gemname
pkgver=1.20.1
pkgrel=2
pkgdesc="Ruby: parallel processing made simple and fast"
arch=(any)
url=https://github.com/grosser/parallel
license=(MIT)
depends=(ruby)
checkdepends=(ruby-bundler ruby-rake ruby-rspec ruby-bump ruby-activerecord
              ruby-ruby-progressbar ruby-mysql2 ruby-sqlite3 procps-ng lsof)
makedepends=(git rubygems ruby-rdoc)
options=(!emptydirs)
source=(git+https://github.com/grosser/parallel.git?tag=v$pkgver)
sha256sums=('SKIP')

prepare() {
  cd ${_gemname}
  rm Gemfile.lock
  sed -i '/rspec-rerun/d' Gemfile
  sed -i '/rspec-legacy_formatters/d' Gemfile
}

build() {
  cd ${_gemname}
  gem build ${_gemname}.gemspec
}

check() {
  cd ${_gemname}
  rspec spec
}

package() {
  cd ${_gemname}
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
