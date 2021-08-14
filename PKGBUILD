# Maintainer: George Rawlinson <grawlinson@archlinux.com>
# Co-Maintainer: Bert Peters <bert@bertpts.nl>
# Contributor: Shengyu Zhang <la@archlinuxcn.org>

_gemname=em-websocket
pkgname=ruby-$_gemname
pkgver=0.5.2
pkgrel=3
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
sha512sums=('46df705e2af93082884c7ca521df4f6cf33309c441eb3ba96be609b2cf280e3b72c689810d55279db6dbbc178ed843d64ccdaf9d4b39d52ddac7d84956065b06')

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
