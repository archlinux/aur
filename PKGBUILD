# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Michal Kimle <kimle.michal@gmail.com>

_gemname=tty-config
pkgname=ruby-$_gemname
pkgver=0.5.1
pkgrel=1
pkgdesc="A highly customisable application configuration interface"
arch=(any)
url=https://github.com/piotrmurach/tty-config
license=(MIT)
options=(!emptydirs)
depends=(ruby)
checkdepends=(ruby-bundler ruby-rake ruby-rspec ruby-inifile
              ruby-java-properties ruby-rhcl ruby-toml ruby-xml-simple)
makedepends=(rubygems ruby-rdoc)
source=(${url}/archive/v${pkgver}.tar.gz)
sha256sums=('507ddd029750e8fc8bf761984d9fae2aeed95db901569959d6a4f54dd851710f')

prepare() {
  cd $_gemname-$pkgver

  # we don't care about coverage or metrics
  echo 'source "https://rubygems.org"' > Gemfile
  echo gemspec >> Gemfile
}

build() {
  cd $_gemname-$pkgver
  gem build ${_gemname}.gemspec
}

check() {
  cd $_gemname-$pkgver
  rake
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

  install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=2 sw=2 et:
