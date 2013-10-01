# Maintainer: carstene1ns <arch carsten-teibes de>
# Contributor: Evangelos Foutras <foutrelis gmail com>
# Contributer: Matthew Bauer <mjbauer95 gmail com>

pkgname=smw-svn
pkgver=6
pkgrel=3
pkgdesc="Super Mario War multiplayer game (development version)"
arch=('i686' 'x86_64')
url="http://smw.supersanctuary.net/"
license=('GPL2')
depends=('sdl_mixer' 'sdl_image' 'desktop-file-utils')
makedepends=('dos2unix' 'subversion')
provides=('smw')
conflicts=('smw')
install="${pkgname}.install"
source=("smw::svn+http://supermariowar.googlecode.com/svn/trunk/"
        "smw.desktop"
        "smw.png"
        "gcc.patch"
        "libpng.patch")
md5sums=('SKIP'
         '609f98c3bb5ef4961ae5eb12ea36d569'
         'b7f5ef181e41eb0339be746ea03ff628'
         '586cf917af0a81912d8c5c0fcfddb64b'
         'ee4c6fd9e7f6f9a4dd699cdcd028b72f')
sha256sums=('SKIP'
            'c01da67abdc1c7bd46fd2c0420ca2795d77d143df1da7ce0ad95260816d2b80d'
            '28299d22e9ed8ebdecc8d936bfebef4a13381d20afda881c87661debe33f17d6'
            '7509d33b70b11742fc83cb62dd3e70a51d35596f20eb3a38b3553946261fe986'
            'be105515dbc850fcc8f73d894555ba71a7b89c52d7af2aa329a40f8088c2c75d')

build() {
  cd "${srcdir}/smw"

  # Fix line breaks and permission
  dos2unix configure
  chmod +x configure

  # Fixes for gcc warnings and libpng >1.5
  patch --forward -p0 -i ../gcc.patch
  patch --forward -p0 -i ../libpng.patch

  ./configure

  # Change data directory
  sed -i "s|usr/share/games/smw|usr/share/smw|" configuration

  # Build
  make
}

package() {
  cd "${srcdir}/smw"

  # Not using "make install" because of different data directory

  # Install binaries
  msg2 "Installing binaries"
  mkdir -p "${pkgdir}/usr/bin"
  install -D smw "${pkgdir}/usr/bin"
  install -D leveledit "${pkgdir}/usr/bin/smw-leveledit"
  install -D worldedit "${pkgdir}/usr/bin/smw-worldedit"

  # Install data folders
  msg2 "Installing data folders"
  mkdir -p "${pkgdir}/usr/share/smw/"
  for _datadir in gfx maps music sfx tours worlds; do
    cp -r ${_datadir} "${pkgdir}/usr/share/smw/"
  done

  # Set sane permissions
  find "${pkgdir}/usr/share/smw" -type d -exec chmod 755 {} \;
  find "${pkgdir}/usr/share/smw" -type f -exec chmod 644 {} \;

  # Install application shortcut and icon
  install -D -m644 "${srcdir}/smw.desktop" "${pkgdir}/usr/share/applications/smw.desktop"
  install -D -m644 "${srcdir}/smw.png" "${pkgdir}/usr/share/pixmaps/smw.png"
}
