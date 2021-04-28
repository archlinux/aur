# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
#              Scott Percival <code@moral.net.au>
#              Felix Schindler <felix at schindlerfamily dot de>
#              Christoph Haag <haagch@studi,informatik.uni-stuttgart.de>
#              WorMzy Tykashi <wormzy.tykashi@gmail.com>
pkgname=steamos-compositor
pkgver=1.35
pkgrel=2
pkgdesc="Compositor used by SteamOS \"based on xcompmgr by Keith Packard et al.\""
arch=('i686' 'x86_64')
url="http://repo.steampowered.com/steamos/pool/main/s/steamos-compositor/"
license=('GPL')
depends=('libxfixes' 'libxext' 'libxcomposite' 'libxdamage' 'libxrender' 'libxxf86vm' 'sdl_image' 'libgl' 'xorg-xrandr')
makedepends=('mesa')
_msver=1.10
source=("http://repo.steampowered.com/steamos/pool/main/s/steamos-compositor/steamos-compositor_${pkgver}.tar.xz"
        "http://repo.steampowered.com/steamos/pool/main/s/steamos-modeswitch-inhibitor/steamos-modeswitch-inhibitor_${_msver}.tar.xz")
md5sums=('7615da46332153b2e5f17aeb674214b1'
         'ab8b731fb917aff183aa338bf3298495')

build() {
  export LIBS="-lXext -lXdamage -lXfixes"
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
  cd "$srcdir/steamos-modeswitch-inhibitor-$_msver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -m 755 "usr/bin/steamos-session" "$pkgdir/usr/bin"
  sed -i "s|x86_64-linux-gnu/||g" "$pkgdir/usr/bin/steamos-session"
  sed -i "s|lib/i386-linux-gnu/|lib32/|g" "$pkgdir/usr/bin/steamos-session"
  mkdir -p "$pkgdir/usr/bin/steamos" "$pkgdir/usr/share/xsessions" "$pkgdir/usr/share/icons/steam"
  install -m 755 "usr/bin/steamos/set_hd_mode.sh" "$pkgdir/usr/bin/steamos"
  install -m 644 "usr/share/xsessions/steamos.desktop" "$pkgdir/usr/share/xsessions"
  install -m 644 "usr/share/icons/steam/arrow.png" "$pkgdir/usr/share/icons/steam"
  cd "$srcdir/steamos-modeswitch-inhibitor-$_msver"
  make DESTDIR="$pkgdir/" install
}

