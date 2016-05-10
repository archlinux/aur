# Maintainer: James An <james@jamesan.ca>

_gemname=bdb
pkgname=ruby-$_gemname
pkgver=0.2.6
pkgrel=1
pkgdesc='Ruby Berkeley DB'
arch=(i686 x86_64)
url='http://github.com/$pkgname/$_gemname'
license=()
depends=(ruby ruby-tuple db4.8)
options=(!emptydirs)
source=(https://github.com/$pkgname/$_gemname/archive/master.zip)
md5sums=('c05e4d065335f6ddbdc90d5f913c8954')

prepare() {
  cd $_gemname-master
  sed --in-place 's#<db.h>#<db4.8/db.h>#' ext/bdb.h ext/extconf.rb
}

build() {
  cd $_gemname-master
  gem build $_gemname.gemspec
}

package() {
  cd $_gemname-master
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --install-dir "$pkgdir/$_gemdir" --bindir "$pkgdir/usr/bin" --local $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
