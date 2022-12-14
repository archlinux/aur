# Maintainer: Pavan RIkhi <pavan.rikhi@gmail.com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

# NOTE: This is broken with the latest inkscape CLI & you will have to comment
# out the renderpngs.py script for now, using docker to run the script in a
# debian environment.
#
# Start by extracting & preparing the source files, this command will fail:
# $ makepkg
#
# Run these commands to generate icon PNGs from the base SVG file:
# $ docker build -t adwaita:latest .
# $ docker run --mount type=bind,source=./src/adwaita-icon-theme-43,target=/app adwaita
#
# Then comment out the ./renderpngs.py line in build() & finish building the
# package with:
# $ makepkg --noextract --noprepare --install

# To Change the Colors of the Generated Cursor Files, Edit the FILL_COLOR &
# OUTLINE_COLOR Variables in the `build()` Function.

pkgname=adwaita-custom-cursor-colors
pkgver=43
pkgrel=1
pkgdesc="GNOME's Adwaita Theme with Customizable Cursor Colors"
url="https://git.gnome.org/browse/adwaita-icon-theme"
arch=(any)
license=(LGPL3 CCPL:cc-by-sa)
depends=(hicolor-icon-theme gtk-update-icon-cache librsvg)
#makedepends=(intltool git gtk3 gnome-common python python-pillow inkscape xorg-xcursorgen)
makedepends=(intltool git gtk3 gnome-common docker)
provides=(adwaita-icon-theme adwaita-cursors)
conflicts=(adwaita-icon-theme adwaita-cursors)
source=(
    "https://github.com/GNOME/adwaita-icon-theme/archive/$pkgver.tar.gz"
    "Dockerfile"
    "makepngs.sh"
)
sha256sums=(
    '15c635c227f85d78121841e40815ed5277c7580c9c80e01f1613a807d931b4c1'
    'SKIP'
    'SKIP'
)

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
  # NOTE: This is broken, see comment at top of PKGBUILD
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
