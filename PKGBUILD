# Maintainer: Markus Pesch <markus.pesch@cryptic.systems>

pkgname=ubuntu-backgrounds-bionic
pkgver=18.04.1
pkgrel=1
pkgdesc="The backgrounds included in Ubuntu 18.04 bionic"
license=('Commons Attribution-ShareAlike 3.0 Unported')
arch=('any')
url="http://archive.ubuntu.com/ubuntu/pool/main/u/ubuntu-wallpapers"
source=("${url}/ubuntu-wallpapers_${pkgver}.orig.tar.gz")
sha256sums=('e5f3286047f5abe2c2d63ec10cfbcd65ba47dfbe2fce51aede0d1f15b059809f')

package() {

  # encode to uft8
  mv ${srcdir}/ubuntu-wallpapers-${pkgver}/Cathédrale_Marie-Rheine-du-Monde_by_Thierry_Pon.jpg ${srcdir}/ubuntu-wallpapers-${pkgver}/Cathedrale_Marie-Rheine-du-Monde_by_Thierry_Pon.jpg

  # move only wallpapers which are new in bionic
  wallpapers=(
    "Cathedrale_Marie-Rheine-du-Monde_by_Thierry_Pon.jpg"
    "Crocus_Wallpaper_by_Roy_Tanck.jpg"
    "Definitive_Light_Zen_Orange_by_Pierre_Cante.jpg"
    "El_Haouaria_by_Nusi_Nusi.jpg"
    "Halifax_Sunset_by_Vlad_Drobinin.jpg"
    "Manhattan_Sunset_by_Giacomo_Ferroni.jpg"
    "On_top_of_the_Rubihorn_by_Matthias_Niess.jpg"
    "Raindrops_On_The_Table_by_Alex_Fazit.jpg"
    "Ross_Jones_Rockpool_(Sydney)_by_Chris_Carignan.jpg"
    "Spices_in_Athens_by_Makis_Chourdakis.jpg"
    "This_Is_Bionic_Beaver_by_Pierre_Cante.jpg"
    "Wall_with_door_on_Gozo_by_Matthias_Niess.jpg"
  )

  for wallaper in ${wallpapers[@]}; do
    install -D --mode 644 ${srcdir}/ubuntu-wallpapers-${pkgver}/${wallaper} ${pkgdir}/usr/share/backgrounds/${pkgname}/${wallaper}
  done

  # edit xml
  # - replace directory, use a more detailed directory path
  # - fix xml tag
  sed \
    --in-place \
    --expression "s#/usr/share/backgrounds/contest/bionic.xml#/usr/share/gnome-background-properties/bionic-wallpapers.xml#" \
    --expression "s#/usr/share/backgrounds#/usr/share/backgrounds/${pkgname}#g" \
    --expression "s#Cathédrale#Cathedrale#" \
    --expression "s#_name#name#g" \
    ${srcdir}/ubuntu-wallpapers-${pkgver}/bionic-wallpapers.xml.in

  # move xml
  property_dirs=(
    "cinnamon-background-properties"
    "gnome-background-properties"
    "mate-background-properties"
  )

  for property_dir in ${property_dirs[@]}; do
    install -D --mode 644 ${srcdir}/ubuntu-wallpapers-${pkgver}/bionic-wallpapers.xml.in ${pkgdir}/usr/share/${property_dir}/bionic-wallpapers.xml
  done

  # license
  install -D --mode 644 ${srcdir}/ubuntu-wallpapers-${pkgver}/COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
