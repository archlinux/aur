# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Michal Kimle <kimle.michal@gmail.com>

_gemname=tty-logger
pkgname=ruby-$_gemname
pkgver=0.6.0
pkgrel=1
pkgdesc="A readable, structured and beautiful logging for the terminal"
arch=(any)
url=https://github.com/piotrmurach/tty-logger
license=(MIT)
options=(!emptydirs)
depends=(ruby ruby-pastel)
checkdepends=(ruby-bundler ruby-rake ruby-rspec)
makedepends=(rubygems ruby-rdoc)
source=(${url}/archive/v${pkgver}.tar.gz)
sha256sums=('352285d4fb5516e97e1134072b697c8d0bc058c52c2256d68c2e77278b8286cb')

prepare() {
  cd $_gemname-$pkgver

  # we don't care about performance or metrics
  echo 'source "https://rubygems.org"' > Gemfile
  echo 'gemspec' >> Gemfile
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
