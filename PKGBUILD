# Contributor: henning mueller <henning@orgizm.net>

pkgname=transmission-rss
pkgver=0.1.21
pkgrel=1
pkgdesc='Adds torrents from rss feeds to transmission web frontend.'
arch=(any)
license=(GPL)
url=http://rubygems.org/gems/transmission-rss
depends=(ruby 'ruby-open_uri_redirections>=0.1.4')
backup=(etc/transmission-rss.conf)
source=(
  https://rubygems.org/downloads/$pkgname-$pkgver.gem
  $pkgname.service
  $pkgname.install
)

package() {
  cd $srcdir

  export RBENV_VERSION=system

  local _gemdir="$(ruby -rubygems -e 'puts Gem.default_dir')"
  local _gemdata="$pkgdir/$_gemdir/gems/$pkgname-$pkgver"

  gem install \
    --ignore-dependencies \
    --no-user-install \
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

sha256sums=('026f795332d14b35f2b6ca71f1544be5748c5e502d5cd1d70c81ecd1eab68fd2'
            '71da971302657c47708d6213fc92ade7e91917aa69361ddf40cc0e812bf74563'
            '8d88a4858d6ce3f84fe851534d4bbf2e0ca8ecb81e25c095e128046d08fb764e')
