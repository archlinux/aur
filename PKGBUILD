# Maintainer: Anthony Wang <a at exozy dot me>
# Contributor: ny-a <nyaarch64 at gmail dot com>
# Contributor: Daniel Moch <daniel@danielmoch.com>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: Fredrick Brennan <copypaste@kittens.ph>

pkgname=mastodon
pkgver=4.2.10
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
         redis
         ruby-bundler
         sudo
         yarn
         zlib)
backup=(etc/mastodon.conf)
install=mastodon.install
options=(!strip)
source=(https://github.com/mastodon/mastodon/archive/v$pkgver.tar.gz
        mastodon.target
        mastodon.sysusers.d
        mastodon.tmpfiles.d)
sha512sums=('1fe5417136bc020a83b83eaccef7f1f46c13fc8318681f12ba556b1b6b03e25ef7b6335c28f4e6722101e97b63020cbd0d3fbacdaf9b3b5a4b73c3cf3e230813'
            'bbce4ff9142265fc7d5f7669637c112240bc6d1b39dedf212faf8acb09fb9b4b2acc07038df5e790c60baff51bc44ffef9318f9fce043c6831ae5e5f02fea5a6'
            '4ee4210bde391e6dc782cb7c14f2cb968c95ad541aa0efcf843a811f8cc5f0d1067ee3c8346bb412aa9fd1dd5a8bd05a4524df7dc4a106957009853dd237074a'
            '27c4eb01d462c525b59e5808a3b2501b63a34425752128388fbde82f7eb5944b20d2f8d8b1be8ed8adb165cab4cfb8e13f90215f20989ca671a0422ffa37001f')

build() {
  cd mastodon-$pkgver
  sed -i '/husky install/d' package.json # Stop husky from hijacking git hooks
  bundle config deployment 'true'
  bundle config without 'development test'
  bundle config with 'pam_authentication'
  bundle install -j$(getconf _NPROCESSORS_ONLN)
  yarn install --pure-lockfile
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
