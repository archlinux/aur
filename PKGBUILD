# Maintainer: Anthony Wang <a at exozy dot me>
# Contributor: ny-a <nyaarch64 at gmail dot com>
# Contributor: Daniel Moch <daniel@danielmoch.com>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: Fredrick Brennan <copypaste@kittens.ph>

pkgname=mastodon
pkgver=4.3.1
pkgrel=1
pkgdesc='Your self-hosted, globally interconnected microblogging community'
arch=(any)
url=https://github.com/mastodon/mastodon
license=(AGPL3)
depends=(ffmpeg
         git
         libidn
         libpqxx
         libvips
         libxml2
         libxslt
         libyaml
         nodejs
         postgresql
         protobuf
         ruby-bundler
         sudo
         valkey
         zlib)
backup=(etc/mastodon.conf)
install=mastodon.install
options=(!strip)
source=(https://github.com/mastodon/mastodon/archive/v$pkgver.tar.gz
        mastodon.target
        mastodon.sysusers.d
        mastodon.tmpfiles.d
        devise_pam.patch)
sha512sums=('807111fbfa78f65a14e47b143b724771b3f63dc3220913b8526935202ee451c3980c01780d3113a4597a1bc05f3b937f212330372b983a9ab01b56866eff40ed'
            'ce9fe810654f3a641bbc1ea9707fa1b149e3955bfc55da20ed27e58f9c768dd65534fa43c9d67042fff40c48ef33c660efac8ef11c60f1111173326e2a93814c'
            '4ee4210bde391e6dc782cb7c14f2cb968c95ad541aa0efcf843a811f8cc5f0d1067ee3c8346bb412aa9fd1dd5a8bd05a4524df7dc4a106957009853dd237074a'
            '27c4eb01d462c525b59e5808a3b2501b63a34425752128388fbde82f7eb5944b20d2f8d8b1be8ed8adb165cab4cfb8e13f90215f20989ca671a0422ffa37001f'
            '7b2ac9917a6d077152425ce59e2cd97df11730d197b87da324b1e0dc29042de5c11530e4d530f1775ca75fc4a06bccb6a5154feb42c8503b5830ecb46e306b7a')

prepare() {
  cd mastodon-$pkgver
  patch -p1 < ../devise_pam.patch
}

build() {
  cd mastodon-$pkgver
  sed -i '/husky install/d' package.json # Stop husky from hijacking git hooks
  bundle config set deployment true
  bundle config without 'development test'
  bundle config with 'pam_authentication'
  bundle config set frozen false
  bundle add erb
  bundle install -j$(getconf _NPROCESSORS_ONLN)
  corepack enable --install-directory . yarn
  ./yarn install
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
