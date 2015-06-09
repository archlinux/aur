# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Balló György <ballogyor+arch@gmail.com>

pkgname=indicator-sound
pkgver=12.10.1
pkgrel=5
pkgdesc='A unified sound menu'
arch=('i686' 'x86_64')
url='https://launchpad.net/indicator-sound'
license=('GPL')
groups=('pantheon' 'pantheon-unstable')
depends=('ido' 'libdbusmenu-gtk3' 'libgee' 'libindicator-gtk3' 'libpulse'
         'libnotify')
makedepends=('intltool' 'vala')
install='indicator-sound.install'
source=("https://launchpad.net/indicator-sound/${pkgver%.*}/${pkgver}/+download/indicator-sound-${pkgver}.tar.gz")
sha256sums=('d3ae4e8a9e2bac6f9098e617364aba1ddca15ee118d5aa89ae85d0a1f3371af6')

prepare() {
  cd indicator-sound-${pkgver}

  sed 's/gee-1.0/gee-0.8/' -i configure.ac src/Makefile.{am,in}
  sed 's/rhythmbox/noise-player/g' -i data/com.canonical.indicator.sound.gschema.xml

  autoreconf -fi
}

build() {
  cd indicator-sound-${pkgver}

  export CFLAGS="$CFLAGS -Wno-deprecated-declarations"

  ./configure \
    --prefix='/usr' \
    --localstatedir='/var' \
    --libexecdir='/usr/lib/indicator-sound' \
    --sysconfdir='/etc' \
    --disable-schemas-compile \
    --disable-static
  make
}

package() {
  cd indicator-sound-${pkgver}

  make DESTDIR="${pkgdir}" install

# Fix icon names to provide the playlist icon
  install -dm 755 "${pkgdir}"/usr/share/libindicator/icons/hicolor/{16x16,scalable}/mimetypes
  mv "${pkgdir}"/usr/share/libindicator/icons/hicolor/16x16/{status/sound-icon.png,mimetypes/playlist.png}
  mv "${pkgdir}"/usr/share/libindicator/icons/hicolor/scalable/{status/sound-icon.svg,mimetypes/playlist.svg}
  rm -r "${pkgdir}"/usr/share/libindicator/icons/hicolor/{16x16,scalable}/status
}

# vim: ts=2 sw=2 et:
