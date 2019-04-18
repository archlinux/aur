# Maintainer: Alesh Slovak <aleshslovak@gmail.com>
# Contributor: Scott Percival <code@moral.net.au>
#              Felix Schindler <felix at schindlerfamily dot de>
#              Christoph Haag <haagch@studi,informatik.uni-stuttgart.de>
#              WorMzy Tykashi <wormzy.tykashi@gmail.com>
pkgname=steamos-compositor-plus
pkgver=1.1.2
pkgrel=1
pkgdesc="Compositor used by SteamOS with some added tweaks and fixes"
arch=('i686' 'x86_64')
url="https://github.com/alkazar/steamos-compositor"
license=('custom')
depends=('libxfixes' 'libxext' 'libxcomposite' 'libxdamage' 'libxrender' 'libxxf86vm' 'sdl_image' 'libgl' 'ttf-dejavu' 'steam')
makedepends=('mesa')
conflicts=('steamos-compositor')
_msver=1.10
source=("https://github.com/alkazar/steamos-compositor/archive/${pkgver}.tar.gz"
        "http://repo.steamstatic.com/steamos/pool/main/s/steamos-modeswitch-inhibitor/steamos-modeswitch-inhibitor_${_msver}.tar.xz")
md5sums=('196999f16a32cbd6e42197a56ec08dc2'
         'ab8b731fb917aff183aa338bf3298495')

prepare() {
  cd "$srcdir/steamos-compositor-$pkgver"
  autoreconf -i
}

build() {
  export LIBS="-lXext -lXdamage -lXfixes"
  cd "$srcdir/steamos-compositor-$pkgver"
  ./configure --prefix=/usr
  make
  cd "$srcdir/steamos-modeswitch-inhibitor-$_msver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/steamos-compositor-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -m 755 "usr/bin/steamos-session" "$pkgdir/usr/bin"
  sed -i "s|x86_64-linux-gnu/||g" "$pkgdir/usr/bin/steamos-session"
  sed -i "s|lib/i386-linux-gnu/|lib32/|g" "$pkgdir/usr/bin/steamos-session"
  mkdir -p "$pkgdir/usr/bin/steamos" "$pkgdir/usr/share/xsessions" "$pkgdir/usr/share/icons/steam" "$pkgdir/usr/share/pixmaps"
  install -m 755 "usr/bin/steamos/set_hd_mode.sh" "$pkgdir/usr/bin/steamos"
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

