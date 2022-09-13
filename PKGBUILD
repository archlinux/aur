# Maintainer: Alexander Kobel <a-kobel@a-kobel.de>
# based on the torcs AUR package by
# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Shahar Weiss <sweiss4@gmx.net>

_pkgname=torcs
pkgname=torcs-can
pkgver=1.3.7
pkgrel=7
pkgdesc="A 3D racing cars simulator using OpenGL (Enrico Pozzobon's fork with CAN support)"
url="http://torcs.sourceforge.net"
license=("GPL")
arch=('x86_64' 'i686')
depends=('freeglut' 'libpng' 'freealut' 'libxi' 'libxmu' 'libxrandr' 'libvorbis' 'glu')
makedepends=('plib' 'mesa' 'dbcc')
conflicts=('torcs' 'torcs-data')
options=('!makeflags')
source=(git+https://github.com/epozzobon/torcs-1.3.7)
md5sums=('SKIP')

prepare() {
  cd "$srcdir"/$_pkgname-${pkgver/_/-}
  # for p in $srcdir/*.patch
  # do
  #   patch -p1 -i "$p"
  # done
  # gunzip -c format-argument.patch.gz | patch -p1

  sed -ie 's/printf(title);/printf("%s", title);/' src/tools/texmapper/maintexmapper.cpp
  sed -ie 's/fprintf (save_fd, surf);/fprintf (save_fd, "%s", surf);/' src/tools/trackgen/objects.cpp

  cd src/drivers/can_server
  make
}

build() {
  cd "$srcdir"/$_pkgname-${pkgver/_/-}
  unset LDFLAGS
  ./configure --prefix=/usr --x-includes=/usr/include --x-libraries=/usr/lib
  make
}

package() {
  cd "$srcdir"/$_pkgname-${pkgver/_/-}
  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" datainstall
  install -D -m644 Ticon.png "$pkgdir"/usr/share/pixmaps/torcs.png
  install -D -m644 torcs.desktop "$pkgdir"/usr/share/applications/torcs.desktop
  find "$pkgdir" -type d -exec chmod 755 {} \;
}
