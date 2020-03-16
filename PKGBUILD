# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Colin Pitrat <colin dot pitrat at gmail dot com>
pkgname=caprice32-git
pkgver=v4.5.0.r114.g9689d5b
pkgrel=1
pkgdesc="An emulator of the Amstrad CPC 8bit home computer range (CPC 464, 664, 6128)"
arch=('i686' 'x86_64')
url="https://github.com/ColinPitrat/caprice32"
license=('GPL2')
depends=('sdl' 'zlib' 'gcc-libs')
source=(git://github.com/ColinPitrat/caprice32
caprice32.desktop)
sha256sums=('SKIP'
            '6ebca670aad7cf21582297725d242d2fc7b730e6ddf50b6710c3851d5c7cfa15')

pkgver() {
  cd caprice32
  git describe --long | sed 's/^latest-//;s/\([^-]*-g\)/r\1/;s/-/./g'


}

build() {
  cd caprice32
  make RELEASE=true
  sed -i 's,rom_path=.*,rom_path=/usr/share/caprice32/rom/,' cap32.cfg
  sed -i 's,resources_path=.*,resources_path=/usr/share/caprice32/resources/,' cap32.cfg
  sed -i 's,cart_path=.*,cart_path=/usr/share/caprice32/rom/,' cap32.cfg
}

package() {
  cd caprice32
  mkdir -p $pkgdir/usr/share/caprice32/rom
  cp rom/* $pkgdir/usr/share/caprice32/rom/
  mkdir -p $pkgdir/usr/share/caprice32/resources
  cp -r resources/* $pkgdir/usr/share/caprice32/resources
  mkdir -p $pkgdir/usr/share/applications
  cp $srcdir/caprice32.desktop $pkgdir/usr/share/applications/
  install -Dm755 cap32.cfg "$pkgdir/etc/cap32.cfg"
  install -Dm755 cap32 "$pkgdir/usr/bin/cap32"
}
