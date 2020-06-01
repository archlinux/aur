# Maintainer: Yiyao Yu <yuydevel at protonmail dot com>
# Contributor: Maxr1998 <max.rumpf1998@gmail.com>
# Author: Ondrej Čerman

pkgname=zenmonitor
pkgver=1.4.0
pkgrel=2
pkgdesc='Zen monitor is monitoring software for AMD Zen-based CPUs'
arch=('x86_64' 'i686')
url='https://github.com/ocerman/zenmonitor'
license=('MIT')
depends=('zenpower' 'gtk3')
conflicts=('zenmonitor')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ocerman/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('8e057c15ea67ccb8b1b3bfe22235e032199b83527982f89642adcb9d4dd8bb27')

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
}

# vim:set et ts=2 sw=2 tw=79
