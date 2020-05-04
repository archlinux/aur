# Maintainer: Chipster Julien <julien dot chipster @ archlinux dot fr>

pkgname=camalarm
pkgver=0.0.1
pkgrel=1
pkgdesc="lua script + nginx to manage raspberry pi camera or others"
arch=('any')
url="https://github.com/Chipsterjulien/camalarm"
license=('WTFPL')
depends=('nginx' 'luajit' 'lua51-socket' 'nginx-mainline-mod-lua')
# depends=('nginx' 'luajit' 'lua51-socket' 'nginx-mainline-mod-lua' 'python-picamera' 'streameye')
backup=('etc/camalarm/camalarm.toml')
source=("$pkgname-$pkgver.tar.gz")
install=camalarm.install

_builddir="$pkgname-$pkgver"

package() {
  cd "$_builddir"

  ######
  # camalarm.toml
  ###############
  install -Dm644 cfg/"$pkgname"_sample.toml \
    "$pkgdir"/etc/$pkgname/"$pkgname"_sample.toml || return 1

  ######
  # Create log directory
  ######################
  install -dm755 "$pkgdir"/var/log/$pkgname || return 1

  # camalarm.service
  install -Dm644 systemd/"$pkgname".service \
    "$pkgdir"/usr/lib/systemd/system/"$pkgname".service || return 1

  ######
  # nginx config
  ##############
  install -Dm644 nginx/"$pkgname"_sample \
    "$pkgdir"/etc/nginx/sites-available/"$pkgname" || return 1

  install -dm755 "$pkgdir"/etc/nginx/sites-enabled || return 1

  ln -s "$pkgdir"/etc/nginx/sites-available/"$pkgname" "$pkgdir"/etc/nginx/sites-enabled || return 1

  ######
  # install all script
  ####################
  install -dm755 -o http -g http "$pkgdir"/etc/nginx/lua/"$pkgname" || return 1

  install "$srcdir"/$pkgname-$pkgver/*.lua \
    "$pkgdir"/etc/nginx/lua/"$pkgname"/ || return 1
}

sha512sums=('402d49fb3f54ce13d2008f982061a48908b50bde19a613f8f3ee603790589a27a86c5606be1ca0781f7374581198d283752f369caa4b150c0344440c9b06b277')
