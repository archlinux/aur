# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Balló György <ballogyor+arch@gmail.com>

pkgname=indicator-sound
pkgver=12.10.1
pkgrel=5
pkgdesc='A unified sound menu'
arch=('i686' 'x86_64')
url="https://launchpad.net/${pkgname}"
license=('GPL')
depends=('ido' 'libdbusmenu-gtk3' 'libgee06' 'libindicator-gtk3' 'libpulse' 'libnotify')
makedepends=('intltool' 'vala')
install="${pkgname}.install"
source=("${url}/${pkgver%.*}/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz"
        "http://pkgbuild.com/~bgyorgy/sources/${pkgname}-translations-20130310.tar.gz")
sha256sums=('d3ae4e8a9e2bac6f9098e617364aba1ddca15ee118d5aa89ae85d0a1f3371af6'
            '7830a7bf49b86f92558ad4bc1499db4e0c8680b0aa31d046262d8169b0bafcd2')

prepare() {
  cd ${pkgname}-${pkgver}

# Install updated language files
  rename ${pkgname}- '' ../po/${pkgname}-*.po
  mv -f -t po ../po/*
  printf "%s\n" po/*.po | sed -e 's/po\///g' -e 's/\.po//g' >po/LINGUAS
}

build() {
  cd ${pkgname}-${pkgver}

  export CFLAGS="$CFLAGS -Wno-deprecated-declarations"
  ./configure --prefix='/usr' --sysconfdir='/etc' --localstatedir='/var' --libexecdir="/usr/lib/${pkgname}" --disable-{schemas-compile,static}
  make
}

package() {
  cd ${pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install

# Fix icon names to provide the playlist icon
  install -dm 755 "${pkgdir}"/usr/share/libindicator/icons/hicolor/{16x16,scalable}/mimetypes
  mv "${pkgdir}"/usr/share/libindicator/icons/hicolor/16x16/{status/sound-icon.png,mimetypes/playlist.png}
  mv "${pkgdir}"/usr/share/libindicator/icons/hicolor/scalable/{status/sound-icon.svg,mimetypes/playlist.svg}
  rm -r "${pkgdir}"/usr/share/libindicator/icons/hicolor/{16x16,scalable}/status
}

# vim: ts=2 sw=2 et:
