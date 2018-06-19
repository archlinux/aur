# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=mastodon
pkgver=2.4.2
pkgrel=1
pkgdesc='Your self-hosted, globally interconnected microblogging community'
arch=(i686 x86_64)
url=https://joinmastodon.org
license=(AGPL-3.0)
depends=(ffmpeg imagemagick libpqxx libxml2 libxslt nodejs postgresql redis ruby)
makedepends=(yarn ruby-bundler protobuf git python2)
conflicts=(mastodon-git)
backup=(var/lib/mastodon/.env.production)
install=mastodon.install
source=(https://github.com/tootsuite/mastodon/archive/v$pkgver.zip
        mastodon-web.service
        mastodon-sidekiq.service
        mastodon-streaming.service
        mastodon.target
        mastodon.install)
sha512sums=(429f7f6513ae0a0bdb96c9fa5a30bb4cf446410227e092cef14fd29022865732cad65551bf789a28737236560c9228e9c2729a0210ea4af542eee6a710694c82
            fd3caabd6f15510b963002d767b44ef0bd2c68d5bfb4de79af50ae29090cee9f0b464f0cc786311367b0c45a98445c9caea79da4cbd7edbf5237fdcc091a7886
            e656a3e06f1a50301477bea141915bd0a07525dc419d460d5fe3775c3332c890ea9594c034f7550eebc00e6766216bf0c09a991a0a6ea0a1e4a39b86fbb6ea09
            b072901e7143f403ed52d960af134f5cc047af6cc0a8fbf9b7c8594aa7465d94afb2d3088c1c8278e6c649b83863c4246b71ff324723207f0d496d44024a0aca
            25c59dc2eab340f92962c6881c2b2d0214bc63a088a4432e20831632a29c4dab54fcdc1b06b3eafc01ed1790dcfaf21900a1d32e9ac40bdbf737b773b7abb7ee
            f335537a7a1669f75c83e55157667fa3cae7fc4d1c0075e61e81801cbcfd9f312f3e475cba8d73ff460bdb4ac4114979f0de0f2eed2d91417c8460f5c3d14182)

build() {
  cd $srcdir/mastodon-$pkgver
  bundle install --deployment --without development test
  yarn install --pure-lockfile

  msg "Enable and start the Redis server now, and create the Mastodon PostgreSQL user now using 'sudo -u postgres createuser -d mastodon', or the next step will fail."
  RAILS_ENV=production bundle exec rails mastodon:setup
}

package() {
  install -d $pkgdir/{var/lib,usr/lib/systemd/system}
  cp -r $srcdir/mastodon-$pkgver $pkgdir/var/lib/mastodon
  cp $srcdir/mastodon-{web,sidekiq,streaming}.service mastodon.target $pkgdir/usr/lib/systemd/system
}
