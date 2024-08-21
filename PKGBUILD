# Maintainer: Anthony Wang <a at exozy dot me>
# Contributor: ny-a <nyaarch64 at gmail dot com>
# Contributor: Daniel Moch <daniel@danielmoch.com>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: Fredrick Brennan <copypaste@kittens.ph>

pkgname=mastodon
pkgver=4.2.12
pkgrel=1
pkgdesc='Your self-hosted, globally interconnected microblogging community'
arch=(any)
url=https://github.com/mastodon/mastodon
license=(AGPL3)
depends=(ffmpeg
         git
         imagemagick
         libidn
         libpqxx
         libxml2
         libxslt
         libyaml
         nodejs
         postgresql
         protobuf
         ruby-bundler
         sudo
         valkey
         yarn
         zlib)
backup=(etc/mastodon.conf)
install=mastodon.install
options=(!strip)
source=(https://github.com/mastodon/mastodon/archive/v$pkgver.tar.gz
        mastodon.target
        mastodon.sysusers.d
        mastodon.tmpfiles.d)
sha512sums=('511ce2df1860150c7544581628937cc91a1441de58656c8064702ccffc59197406b0c5df083ffa7e836c4e4354d0183778c1caa0561e0ab4a43ebb4c4afe765f'
            'ce9fe810654f3a641bbc1ea9707fa1b149e3955bfc55da20ed27e58f9c768dd65534fa43c9d67042fff40c48ef33c660efac8ef11c60f1111173326e2a93814c'
            '4ee4210bde391e6dc782cb7c14f2cb968c95ad541aa0efcf843a811f8cc5f0d1067ee3c8346bb412aa9fd1dd5a8bd05a4524df7dc4a106957009853dd237074a'
            '27c4eb01d462c525b59e5808a3b2501b63a34425752128388fbde82f7eb5944b20d2f8d8b1be8ed8adb165cab4cfb8e13f90215f20989ca671a0422ffa37001f')

build() {
  cd mastodon-$pkgver
  sed -i '/husky install/d' package.json # Stop husky from hijacking git hooks
  bundle config set deployment true
  bundle config without 'development test'
  bundle config with 'pam_authentication'
  bundle config set frozen false
  bundle add erb
  bundle install -j$(getconf _NPROCESSORS_ONLN)
  yarn install --pure-lockfile
  # https://aur.archlinux.org/packages/mastodon?O=0#comment-986425
  cd vendor/bundle/ruby/*/gems/ox-*/ext/ox
  make
  cp ox.so ../../lib
}

package() {
  install -d "$pkgdir"/{var/lib,etc}
  cp -a mastodon-$pkgver "$pkgdir"/var/lib/mastodon

  # Put the config file in /etc and link to it
  touch "$pkgdir"/etc/mastodon.conf
  ln -s /etc/mastodon.conf "$pkgdir"/var/lib/mastodon/.env.production
  ln -s /usr/bin/node "$pkgdir"/var/lib/mastodon/node

  install -Dm 644 mastodon.target -t "$pkgdir"/usr/lib/systemd/system
  install -Dm 644 mastodon.sysusers.d "$pkgdir"/usr/lib/sysusers.d/mastodon.conf
  install -Dm 644 mastodon.tmpfiles.d "$pkgdir"/usr/lib/tmpfiles.d/mastodon.conf

  cd mastodon-$pkgver/dist

  # Fix path discrepancies
  sed -e 's/home\/mastodon\/live/var\/lib\/mastodon/g' \
    -e 's/home\/mastodon\/.rbenv\/shims/usr\/bin/' \
    -i mastodon-*.service
  sed -e 's/home\/mastodon\/live/var\/lib\/mastodon/g' \
    -i nginx.conf

  install -Dm 644 mastodon-*.service -t "$pkgdir"/usr/lib/systemd/system
}
