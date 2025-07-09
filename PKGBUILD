# Maintainer: Francesco Verdoja <f dot verdoja at gmail dot com>
# Contributor: Henning Mueller <henning at orgizm dot net>

pkgname=transmission-rss
pkgver=1.2.3
pkgrel=1
pkgdesc='Adds torrents from rss feeds to transmission web frontend.'
arch=(any)
license=(GPL)
url=http://rubygems.org/gems/transmission-rss
depends=(
  ruby
  ruby-rss
  'ruby-open_uri_redirections>=0.2.1'
  'ruby-rb-inotify>=0.9.10'
)
backup=(etc/transmission-rss.conf)
source=(
  https://rubygems.org/downloads/$pkgname-$pkgver.gem
  $pkgname.service
  $pkgname.install
)

package() {
  cd $srcdir

  export RBENV_VERSION=system

  local _gemdir="$(ruby -e 'puts Gem.default_dir')"
  local _gemdata="$pkgdir/$_gemdir/gems/$pkgname-$pkgver"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    --no-document \
    -i "$pkgdir$_gemdir" \
    $pkgname-$pkgver.gem

  mkdir -p $pkgdir/usr/bin
  ln -s $_gemdir/bin/$pkgname \
    $pkgdir/usr/bin/$pkgname
  ln -s $_gemdir/bin/transmission-add-file \
    $pkgdir/usr/bin/transmission-add-file

  install -D $_gemdata/README.md \
    $pkgdir/usr/share/doc/$pkgname/README

  install -D $_gemdata/$pkgname.conf.example \
    $pkgdir/etc/$pkgname.conf

  install -D $srcdir/$pkgname.service \
    $pkgdir/usr/lib/systemd/system/$pkgname.service

  find $pkgdir -type d -empty | xargs rmdir
}

sha256sums=('9944e343769bde48b383fd8131d688f0faa99d017c2e15b6cacb65b3d1e73bed'
            'afc4ef4b6b80627f9bd02990cdff1f5ff1442830ee9f4ed39742dd927d69f338'
            '8d88a4858d6ce3f84fe851534d4bbf2e0ca8ecb81e25c095e128046d08fb764e')
