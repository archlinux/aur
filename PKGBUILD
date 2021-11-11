# Maintainer: George Rawlinson <grawlinson@archlinux.com>
# Co-Maintainer: Bert Peters <bert@bertpts.nl>
# Contributor: Shengyu Zhang <la@archlinuxcn.org>

_gemname=em-websocket
pkgname=ruby-$_gemname
pkgver=0.5.3
pkgrel=1
pkgdesc='EventMachine based WebSocket server'
arch=('any')
url='https://github.com/igrigorik/em-websocket'
license=('MIT')
depends=('ruby'
    'ruby-eventmachine>=0.12.9'
    'ruby-http_parser.rb>=0.6.0'
    )
provides=("$pkgname=$pkgver")
options=(!emptydirs)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/igrigorik/em-websocket/archive/v${pkgver}.tar.gz)
sha512sums=('28d5cf042899319f50ff0d3b140d75fb281b7e0635118a63df243151c4f442dbabf7dbe15b26b44167d925ed00819b01eeeef110107e4058d8a534f84913b232')

prepare() {
  cd ${_gemname}-${pkgver}
  sed -r 's|~>|>=|g' -i ${_gemname}.gemspec # don't give a fuck about rubys bla bla
  sed 's|git ls-files|find -type f\|sed "s,\\\\./,,g"|' -i ${_gemname}.gemspec
  # test_files and executables use black magic, but we don't need them
  sed '/test_files/d' -i ${_gemname}.gemspec
  sed '/executables/d' -i ${_gemname}.gemspec
}

build() {
  cd ${_gemname}-${pkgver}
  gem build ${_gemname}.gemspec
}

package() {
  cd ${_gemname}-${pkgver}
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
