# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=mastodon-git
pkgver=3.3.0_75_gefffdd3778
_branch=master
pkgrel=1
pkgdesc='Free software social network server based on ActivityPub and OStatus'
arch=(i686 x86_64)
url=https://joinmastodon.org
license=(AGPL3)
depends=(ffmpeg
         imagemagick
         libpqxx
         libxml2
         libxslt
         nodejs
         postgresql
         redis
         ruby-bundler
         protobuf)
makedepends=(yarn python2 rsync)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "${pkgname%-git}-docker" "${pkgname%-git}-docker-git")
install=mastodon.install
source=("git://github.com/tootsuite/${pkgname%-git}.git#branch=$_branch"
        "mastodon-web.service"
        "mastodon-sidekiq.service"
        "mastodon-streaming.service"
        "mastodon.target"
    )
# backup=("etc/mastodon/env.production")
sha512sums=('SKIP'
            'b7b197e4badc4efd0e1ac5c41a8505c2c3ca03b6f2b690b6e78b66365bfab4c168b4034feb693787a3ab48cc29a0e6448895394db670a146399e7f91c6b473f1'
            '603a7877288c762855a29fd2399d3ff7d218a7f1b7d6378cad7f30048cdbfe2a13f2ed2b5c94cb683bdcaead8cd47243e564a2ae70d7f21fa33f295c5396f4f7'
            '90a0761b7709659bec6f29c366c503fdd348226cbb585cf4f6eaa065854e2027d08ab3b352eb13ad7c0e327d662f13bc00fb4163ea0c583ef55b1795ab2e0b31'
            'c9820c2a83d08bd5d842a78e924682db97ebd5c7291b682603ad30dafcdcc5816c13e717ad39554f042b9d9ed71ab902ce3f604952264a900a72612ee8060acb')
_user=mastodon
_homedir=/var/lib/"${pkgname%-git}"
_shell=/bin/false

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/-/_/g'
}

build() {
  cd "${pkgname%-git}"
  bundle install --deployment --without development test
  yarn install
}

package() {
  install -Dm 644 -t "$pkgdir"/usr/lib/systemd/system mastodon-{web,sidekiq,streaming}.service mastodon.target
  install -d "$pkgdir/$_homedir"
  rsync -av --exclude '.git' "${pkgname%-git}"/ "$pkgdir/$_homedir/"

  # install -Dm 644 .env.production.sample ${pkgdir}/etc/mastodon/env.production
}
