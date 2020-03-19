# Maintainer: Pavan RIkhi <pavan.rikhi@gmail.com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

# To Change the Colors of the Generated Cursor Files, Edit the FILL_COLOR &
# OUTLINE_COLOR Variables in the `build()` Function.

pkgname=adwaita-custom-cursor-colors
pkgver=3.36.0
pkgrel=1
pkgdesc="GNOME's Adwaita Theme with Customizable Cursor Colors"
url="https://git.gnome.org/browse/adwaita-icon-theme"
arch=(any)
license=(LGPL3 CCPL:cc-by-sa)
depends=(hicolor-icon-theme gtk-update-icon-cache librsvg)
makedepends=(intltool git gtk3 gnome-common python2 python2-pillow inkscape xorg-xcursorgen)
provides=(adwaita-icon-theme)
conflicts=(adwaita-icon-theme)
source=("https://github.com/GNOME/adwaita-icon-theme/archive/$pkgver.tar.gz")
sha256sums=('813a094e60c375e7ed527ef5f3c02adbeab086b5b7b64a7bda6b2aa9fd4dadf4')

_sourcefolder="adwaita-icon-theme-$pkgver"

prepare() {
  cd "$_sourcefolder"
  autoreconf -fvi
}
  
build() {
  cd "$_sourcefolder"

  # Some Colors from the Molokai colorscheme you can pick
  BACKGROUND="#1B1D1E"
  #BLACK="#232526"
  #WHITE="#F8F8F0"
  #RED="#FF0000"
  #ORANGE="#FD971F"
  MAGENTA="#F92672"
  #CYAN="#66D9EF"
  #GREEN="A6E22E"

  # Set Desired Filll & Outline Colors
  FILL_COLOR="${MAGENTA}"
  OUTLINE_COLOR="${BACKGROUND}"

  # Replace the Colors in the Source SVG
  cd src/cursors/
  TEMP_VAR="42IPROBABLYDONTEXISTINTHESVGFILE9001"
  sed -i -e "s/#ffffff/${TEMP_VAR}/g"   \
         -e "s/#bebebe/${TEMP_VAR}/g"   \
         -e "s/#dedede/${TEMP_VAR}/g"   \
         adwaita.svg
  sed -i -e "s/#000000/${FILL_COLOR}/g" \
         -e "s/#484848/${FILL_COLOR}/g" \
         -e "s/#313131/${FILL_COLOR}/g" \
         adwaita.svg
  sed -i "s/${TEMP_VAR}/${OUTLINE_COLOR}/g" adwaita.svg

  # Generate PNGs from the SVG
  CORE_COUNT="$(grep -c '^core id' /proc/cpuinfo)"
  ./renderpngs.py -r -s -t -o -m 32 -a -c -n "${CORE_COUNT}" adwaita.svg

  # Generate XCursor files from the PNGS
  cd pngs
  mkdir originals
  mv 24x24 32x32 48x48 64x64 96x96 originals/   # Not sure why these are still black...
  cp -r 24x24_s1 24x24
  cp -r 32x32_s1 32x32
  cp -r 48x48_s1 48x48
  cp -r 64x64_s1 64x64
  cp -r 96x96_s1 96x96
  ./make.sh
  cd ../../..

  # Now build the Theme
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_sourcefolder"
  make DESTDIR="$pkgdir" install
}
