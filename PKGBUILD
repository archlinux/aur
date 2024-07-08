# Maintainer: Peter Blackman <peter at pblackman dot plus dot com>
# 8-Jul-2024
#

pkgname=c-evo-dh
pkgver=2.0
pkgrel=1
pkgdesc="C-evo: Distant Horizon, Empire Building Game"
arch=('x86_64' 'aarch64')
url="https://git.code.sf.net/p/c-evo-eh/code"
license=('GPL-2.0-or-later' 'CC-BY-3.0')
makedepends=('git' 'fpc' 'lazarus-gtk2')
depends=('gtk2' 'gdk-pixbuf2' 'glib2' 'glibc' 'pango' 'libx11' 'at-spi2-core' 'cairo' 'bash' 'hicolor-icon-theme')
optdepends=('sox: Needed for sounds if ffmpeg not installed')
source=("$pkgname-$pkgver"::git+$url#tag=$pkgver)
sha256sums=('ba73e88f5705be971c00976321adfb3fc27c5fe0e68f18826c1330a97a660c34')

# Arch does not use games or libexec folders
prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i "s|share/games|share|"   Linux/c-evo-launch-gtk2
  sed -i "s|/usr/games|/usr/bin|" Linux/c-evo-launch-gtk2
  sed -i "s|/usr/libexec|/usr/lib|" Linux/c-evo-launch-gtk2
  
  # currently cannot build with -pie as the RTL is not built with pie
  sed -i 's/-k-pie/-k-z shstk/' Pascal/Release.cfg
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make -B LAZDIR=--lazarusdir=/usr/lib/lazarus DESTDIR="$pkgdir/"
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
