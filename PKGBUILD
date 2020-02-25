# Maintainer: Francesco Verdoja <f dot verdoja at gmail dot com>
# Contributor: Henning Mueller <henning at orgizm dot net>

pkgname=transmission-rss
pkgver=1.2.0
pkgrel=1
pkgdesc='Adds torrents from rss feeds to transmission web frontend.'
arch=(any)
license=(GPL)
url=http://rubygems.org/gems/transmission-rss
depends=(
  ruby
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

sha256sums=('825d4af14928e5fe3cf30bb8dffa06ef6a1a9e2782eeda348ba901031e7781cd'
            'afc4ef4b6b80627f9bd02990cdff1f5ff1442830ee9f4ed39742dd927d69f338'
            '8d88a4858d6ce3f84fe851534d4bbf2e0ca8ecb81e25c095e128046d08fb764e')
