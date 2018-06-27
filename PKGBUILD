# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=mastodon
pkgver=2.4.2
pkgrel=5
pkgdesc='Your self-hosted, globally interconnected microblogging community'
arch=(i686 x86_64)
url=https://joinmastodon.org
license=(AGPL-3.0)
depends=(ffmpeg
         imagemagick
         libpqxx
         libxml2
         libxslt
         nodejs-lts-boron
         postgresql
         redis
         ruby-bundler
         protobuf)
makedepends=(yarn python2)
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
            532929aeeda9a0ccf72de0695a3381547cc389344e1e67f05ef1d7ce5c1ad57278b647423bb52d4a87069ad85479452533fbe3786e5e5c4b62730c6ef72ff267
            603a7877288c762855a29fd2399d3ff7d218a7f1b7d6378cad7f30048cdbfe2a13f2ed2b5c94cb683bdcaead8cd47243e564a2ae70d7f21fa33f295c5396f4f7
            90a0761b7709659bec6f29c366c503fdd348226cbb585cf4f6eaa065854e2027d08ab3b352eb13ad7c0e327d662f13bc00fb4163ea0c583ef55b1795ab2e0b31
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
