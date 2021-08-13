# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Andrea Feletto <andrea@andreafeletto.com>
# Contributor: David Phillips <dbphillipsnz@gmail.com>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

_gemname=rest-client
pkgname=ruby-${_gemname}
pkgver=2.1.0
pkgrel=3
pkgdesc="A simple HTTP and REST client for Ruby"
arch=(any)
url=https://github.com/rest-client/rest-client
license=(MIT)
depends=(ruby ruby-http-accept ruby-http-cookie ruby-mime-types ruby-netrc)
checkdepends=(ruby-bundler ruby-rake ruby-rspec ruby-webmock ruby-rexml)
makedepends=(git rubygems ruby-rdoc)
options=(!emptydirs)
source=(git+https://github.com/rest-client/rest-client.git?tag=v$pkgver)
sha256sums=('SKIP')

prepare() {
  cd ${_gemname}
  sed -i 's|~>|>=|g' ${_gemname}.gemspec
  sed -i '/pry/d' ${_gemname}.gemspec
  sed -i '/rubocop/d' ${_gemname}.gemspec
  sed -i "s/, '< 6.0'//" ${_gemname}.gemspec # remove rdoc upper bound
  sed -i "s/, '< 2.0'//" ${_gemname}.gemspec # remove http-accept upper bound
  sed -i "/require 'rubocop/,+6d" Rakefile
  echo 'gem "rexml"' >> Gemfile

  # rdoc can't load rdoc/markup/table and so it fails to parse this table when
  # building the documentation during package()
  cp README.md README.original
  sed -i '/## Credits/,+6d' README.md
}

build() {
  cd ${_gemname}
  gem build ${_gemname}.gemspec
}

check() {
  cd ${_gemname}
  rake spec
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

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.original "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 history.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

# vim: set ts=2 sw=2 et:
