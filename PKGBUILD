# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Valentin Hăloiu <vially.ichb+aur@gmail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Kevin Zuber <uKev@knet.eu>
# Contributor: Vsevolod Balashov <vsevolod@balashov.name>
# Contributor: David Runge <dave@sleepmap.de>

pkgname=uwsgi-plugin-php71
pkgdesc="Plugin for PHP 7.1 support"
pkgver=2.0.17
pkgrel=1
arch=(x86_64)
url="http://projects.unbit.it/$pkgbase"
license=(GPL2)
depends=(uwsgi php71-embed libyaml jansson)
makedepends=(python2)
source=(
  "https://projects.unbit.it/downloads/uwsgi-$pkgver.tar.gz"
  uwsgiplugin.py::https://raw.githubusercontent.com/unbit/uwsgi/9787f6882c2475aa9873e400988160b17dd04545/plugins/systemd_logger/uwsgiplugin.py
  archlinux.ini
  uwsgi_trick_chroot.patch
)
sha1sums=(
  'cfa2e072f290f63bad235fc6fc92a8f5c27f1ab5'
  '4f89e407fd95ee740764ec3623a4b07977f96d9b'
  '5d20faadab172ed2f03adc35e2e8062c4a1488f5'
  '5a9b549a42e2ad2b45edd3eab9fd359919df6ce9'
)

prepare() {
  cd "$srcdir/uwsgi-$pkgver"
  cp "$srcdir/archlinux.ini" buildconf/archlinux.ini
  patch -Np1 -i $srcdir/uwsgi_trick_chroot.patch

  cp $srcdir/uwsgiplugin.py plugins/systemd_logger/uwsgiplugin.py
}

build() {
  cd "$srcdir/uwsgi-$pkgver"
  UWSGICONFIG_PHPDIR=/opt/php71/usr python2 uwsgiconfig.py --plugin plugins/php archlinux php71
}

package() {
  install -Dm 755 "$srcdir/uwsgi-$pkgver/php71_plugin.so" "$pkgdir/usr/lib/uwsgi/php71_plugin.so"
}
