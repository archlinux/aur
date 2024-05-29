# Maintainer: brauliobo <brauliobo at gmail dot com>

gemname=ruby-livesync
pkgname=ruby-livesync
pkgver=1.0.0.rc1
pkgrel=1
pkgdesc='Live sync solution using ssh + rsync'
url=https://github.com/brauliobo/ruby-livesync
license=(GPL-3.0-only)
arch=('any')
depends=(
  ruby
  ruby-pry
  ruby-activesupport
  ruby-rb-inotify
)
backup=('etc/livesync/config.rb')

if [ "$LOCAL" == "1" ]; then
  source=("${pkgname}-${pkgver}.gem")
else
  source=("https://rubygems.org/downloads/${pkgname}-${pkgver}.gem")
sha256sums=('3d4b1f17e519e3ad374e4d5f583191f17463a4cb9e354b4227711212a43524de')
fi
noextract=("${pkgname}-${pkgver}.gem")

prepare() {
  if type rvm &>/dev/null; then rvm use system; fi
}

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "${pkgname}-${pkgver}.gem"

  gem unpack ${pkgname}-${pkgver}.gem --target $srcdir
  local gemsrc="$srcdir/${pkgname}-${pkgver}"

  # service
  install -Dm644 -t "$pkgdir/usr/lib/systemd/system" "$gemsrc/livesync.service"
  # config
  install -d "$pkgdir/etc/livesync"
  install -Dm640 "$gemsrc/config/sample.rb" "$pkgdir/etc/livesync/config.rb"

  rm -fr $gemsrc
  rm "$pkgdir/$_gemdir/cache/${pkgname}-${pkgver}.gem"
}

