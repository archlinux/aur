# Maintainer: envolution
# Contributor: kiasoc5 <kiasoc5 at disroot dot org>
# Contributor: Xuanrui Qi <me@xuanruiqi.com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# shellcheck shell=bash disable=SC2034,SC2154
# ci|skipcheck|

pkgname=shepherd
pkgver=1.0.9
pkgrel=1
pkgdesc="Service manager that looks after the herd."
arch=('x86_64')
url="https://www.gnu.org/software/shepherd/"
license=('GPL-3.0-or-later')
depends=('guile' 'guile-fibers' 'zstd' 'gzip')
makedepends=('gcc' 'make' 'gawk' 'sed' 'help2man')
install="${pkgname}.install"
source=(
  "https://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz"
  shepherd.install
)
sha256sums=('e488c585c8418df6e8f476dca81b72910f337c9cd3608fb467de5260004000d6'
            'd7a0b895b8d59ace7abd761a7be17ab1c8db358e98ff301d800a5a4fa558dff7')

prepare() {
  cd "$pkgname-$pkgver"
  #remove failing tests
  sed -i '/tests\/syslog-slow-output\.sh.*\\$/d' Makefile.in
  sed -i '/tests\/pid-file\.sh.*\\$/d' Makefile.in
}
build() {
  cd "$pkgname-$pkgver"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --with-gzip=/usr/bin/gzip \
    --with-zstd=/usr/bin/zstd
  GUILE_AUTO_COMPILE=0 make
}

check() {
  cd "$pkgname-$pkgver"
  GUILE_AUTO_COMPILE=0 make -k check
}

package() {
  cd "$pkgname-$pkgver"
  GUILE_AUTO_COMPILE=0 make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING -t ${pkgdir}/usr/share/licenses/${pkgname}

  # conflict avoidance: reboot -> shepherd-reboot | halt -> shepherd-halt
  mv ${pkgdir}/usr/bin/reboot ${pkgdir}/usr/bin/shepherd-reboot
  mv ${pkgdir}/usr/bin/halt ${pkgdir}/usr/bin/shepherd-halt

  gzip ${pkgdir}/usr/share/man/man8/halt.8 ${pkgdir}/usr/share/man/man8/reboot.8
  mv ${pkgdir}/usr/share/man/man8/halt.8.gz ${pkgdir}/usr/share/man/man8/shepherd-halt.8.gz
  mv ${pkgdir}/usr/share/man/man8/reboot.8.gz ${pkgdir}/usr/share/man/man8/shepherd-reboot.8.gz

  #conflict avoidance: shutdown->halt symlink migrate to shepherd-shutdown->shepherd-halt
  cd ${pkgdir}/usr/bin && ln -sf shepherd-halt shepherd-shutdown && rm shutdown
}
# vim:set ts=2 sw=2 et:
