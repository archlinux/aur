# Maintainer: Alesh Slovak <aleshslovak@gmail.com>
# Contributor: Wouter Wijsman <wwijsman@live.nl>
#              Scott Percival <code@moral.net.au>
#              Felix Schindler <felix at schindlerfamily dot de>
#              Christoph Haag <haagch@studi,informatik.uni-stuttgart.de>
#              WorMzy Tykashi <wormzy.tykashi@gmail.com>
pkgname=steamos-compositor-plus
pkgver=1.5.0
pkgrel=1
pkgdesc="Compositor used by SteamOS with some added tweaks and fixes"
arch=('i686' 'x86_64')
url="https://github.com/gamer-os/steamos-compositor-plus"
license=('custom')
depends=('libxfixes' 'libxext' 'libxcomposite' 'libxdamage' 'libxrender' 'libxxf86vm' 'sdl_image' 'libgl' 'lsb-release' 'ttf-dejavu' 'xorg-xrandr' 'steam')
makedepends=('mesa')
conflicts=('steamos-compositor')
_msver=1.10
source=("https://github.com/gamer-os/steamos-compositor-plus/archive/${pkgver}.tar.gz"
        "http://repo.steamstatic.com/steamos/pool/main/s/steamos-modeswitch-inhibitor/steamos-modeswitch-inhibitor_${_msver}.tar.xz")
md5sums=('b2b34c47ae82d80d5db2d6d4f484c198'
         'ab8b731fb917aff183aa338bf3298495')

prepare() {
  cd "$srcdir/steamos-compositor-plus-$pkgver"
  autoreconf -i
}

build() {
  export LIBS="-lXext -lXdamage -lXfixes"
  cd "$srcdir/steamos-compositor-plus-$pkgver"
  ./configure --prefix=/usr
  make
  cd "$srcdir/steamos-modeswitch-inhibitor-$_msver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/steamos-compositor-plus-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -m 755 "usr/bin/steamos-session" "$pkgdir/usr/bin"
  sed -i "s|x86_64-linux-gnu/||g" "$pkgdir/usr/bin/steamos-session"
  sed -i "s|lib/i386-linux-gnu/|lib32/|g" "$pkgdir/usr/bin/steamos-session"
  mkdir -p "$pkgdir/usr/share/steamos-compositor-plus/bin" "$pkgdir/usr/share/xsessions" "$pkgdir/usr/share/icons/steam" "$pkgdir/usr/share/pixmaps"
  install -m 755 "usr/share/steamos-compositor-plus/bin/set_hd_mode.sh" "$pkgdir/usr/share/steamos-compositor-plus/bin/set_hd_mode.sh"
  install -m 755 "usr/share/steamos-compositor-plus/bin/dpkg-query" "$pkgdir/usr/share/steamos-compositor-plus/bin/dpkg-query"
  install -m 644 "usr/share/xsessions/steamos.desktop" "$pkgdir/usr/share/xsessions"
  install -m 644 "usr/share/icons/steam/arrow.png" "$pkgdir/usr/share/icons/steam"
  install -m 644 "usr/share/pixmaps/steam-bootstrapper.jpg" "$pkgdir/usr/share/pixmaps"
  cd "$srcdir/steamos-modeswitch-inhibitor-$_msver"
  make DESTDIR="$pkgdir/" install
  rm -rf "$pkgdir/usr/share/doc"

  # font workaround for initial big picture mode startup
  mkdir -p "$pkgdir/usr/share/fonts/truetype/ttf-dejavu"
  ln -s /usr/share/fonts/TTF/DejaVuSans.ttf "$pkgdir/usr/share/fonts/truetype/ttf-dejavu/DejaVuSans.ttf"
}

