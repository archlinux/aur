# Maintainer: Yiyao Yu <yuydevel at protonmail dot com>
# Contributor: Maxr1998 <max.rumpf1998@gmail.com>
# Author: Ondrej Čerman

pkgname=zenmonitor
pkgver=1.4.2
pkgrel=2
pkgdesc='Zen monitor is monitoring software for AMD Zen-based CPUs'
arch=('x86_64' 'i686')
url='https://github.com/ocerman/zenmonitor'
license=('MIT')
depends=('zenpower' 'gtk3')
conflicts=('zenmonitor')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ocerman/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('dacf8f335104bc7f6df6cc330ac04d7f10d781e41e75517bea513b1c8b7bb8c1')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  # Fix pkgdir references in desktop files
  sed -i 's/@APP_EXEC@|${DESTDIR}/@APP_EXEC@|/g' makefile
  # Add icon to desktop file
  sed -zi 's/Icon=.*\|$/Icon=utilities-system-monitor\n/' data/zenmonitor.desktop.in

  # Temporary fix until makefile is patched, add -fcommon to compile flags since $CFLAGS is not used
  sed -i '/\scc /s/$/ -fcommon/' makefile
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/zenmonitor/LICENSE"
}

# vim:set et ts=2 sw=2 tw=79
