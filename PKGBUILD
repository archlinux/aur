# Maintainer: Peter Blackman <peter at pblackman dot plus dot com>
# 24-Jul-2024
#
# use makepkg -C on upgrades
# Old saved games may be incompatible with versions >= 2.1

pkgname=c-evo-dh
pkgver=2.1.1
pkgrel=1
pkgdesc="C-evo: Distant Horizon, Empire Building Game"
arch=('x86_64' 'aarch64')
url="https://git.code.sf.net/p/c-evo-eh/code"
license=('GPL-2.0-or-later' 'CC-BY-3.0')
makedepends=('git' 'fpc' 'lazarus-gtk2')
depends=('gtk2' 'gdk-pixbuf2' 'glib2' 'glibc' 'pango' 'libx11' 'at-spi2-core' 'cairo' 'bash' 'hicolor-icon-theme')
optdepends=('sox: Needed for sounds if ffmpeg not installed')
source=("$pkgname-$pkgver"::git+$url#tag=$pkgver)
sha256sums=('eb70edf64cf9bd9662225d56eb28a253d57550418459a1228ecfd9281b9589f9')

# Arch does not use games or libexec folders
prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i "s|share/games|share|"     Linux/c-evo-launch-gtk2
  sed -i "s|/usr/games|/usr/bin|"   Linux/c-evo-launch-gtk2
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
