# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=mastodon
pkgver=2.4.2
pkgrel=6
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
optdepends=('sudo: run commands as other users')
conflicts=(mastodon-git)
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
            c9820c2a83d08bd5d842a78e924682db97ebd5c7291b682603ad30dafcdcc5816c13e717ad39554f042b9d9ed71ab902ce3f604952264a900a72612ee8060acb
            1d301f6ae4725aea6d472f29e06c29caa84c688bde5d48f7ec0693e7b3d63662b04d5234d6ff01a2f93396b4c42a047d8c929886ff7eaa7d8b71768d13f4eb20)

build() {
  cd mastodon-$pkgver
  bundle install --deployment --without development test
  yarn install --pure-lockfile
}

package() {
  install -d $pkgdir/{var/lib,usr/lib/systemd/system}
  cp -r $srcdir/mastodon-$pkgver $pkgdir/var/lib/mastodon
  cp $srcdir/mastodon-{web,sidekiq,streaming}.service mastodon.target $pkgdir/usr/lib/systemd/system
}
