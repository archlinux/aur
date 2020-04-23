# Maintainer: Markus Pesch <markus.pesch@cryptic.systems>

pkgname=ubuntu-backgrounds-xenial
pkgver=16.04.1
pkgrel=1
pkgdesc="The backgrounds included in Ubuntu 16.04 xenial"
license=('Commons Attribution-ShareAlike 3.0 Unported')
arch=('any')
url="http://archive.ubuntu.com/ubuntu/pool/main/u/ubuntu-wallpapers"
source=("${url}/ubuntu-wallpapers_${pkgver}.orig.tar.gz")
sha256sums=('a8223eeb95f851bed5b51b40469179c54fb3c468ed5ab48079bb25172c72c423')

package() {

  mv ${srcdir}/ubuntu-wallpapers-${pkgver}/Cielo_estrellado_by_Eduardo_Diez_Viñuela.jpg ${srcdir}/ubuntu-wallpapers-${pkgver}/Cielo_estrellado_by_Eduardo_Diez_Vinuela.jpg
  mv ${srcdir}/ubuntu-wallpapers-${pkgver}/The_Land_of_Edonias_by_Γιωργος_Αργυροπουλος.jpg ${srcdir}/ubuntu-wallpapers-${pkgver}/The_Land_of_Edonias.jpg

  # move only wallpapers which are new in xenial
  wallpapers=(
    "160218-deux-two_by_Pierre_Cante.jpg"
    "Black_hole_by_Marek_Koteluk.jpg"
    "Cielo_estrellado_by_Eduardo_Diez_Vinuela.jpg"
    "clock_by_Bernhard_Hanakam.jpg"
    "Dans_ma_bulle_by_Christophe_Weibel.jpg"
    "Flora_by_Marek_Koteluk.jpg"
    "Icy_Grass_by_Raymond_Lavoie.jpg"
    "Night_lights_by_Alberto_Salvia_Novella.jpg"
    "passion_flower_by_Irene_Gr.jpg"
    "Spring_by_Peter_Apas.jpg"
    "TCP118v1_by_Tiziano_Consonni.jpg"
    "The_Land_of_Edonias.jpg"
  )

  for wallaper in ${wallpapers[@]}; do
    install -D --mode 644 ${srcdir}/ubuntu-wallpapers-${pkgver}/${wallaper} ${pkgdir}/usr/share/backgrounds/${pkgname}/${wallaper}
  done

  # edit xml
  # - replace directory, use a more detailed directory path
  # - fix xml tag
  sed \
    --in-place \
    --expression "s#/usr/share/backgrounds/contest/xenial.xml#/usr/share/gnome-background-properties/xenial-wallpapers.xml#" \
    --expression "s#/usr/share/backgrounds#/usr/share/backgrounds/${pkgname}#g" \
    --expression "s#Viñuela#Vinuela#" \
    --expression "s#_by_Γιωργος_Αργυροπουλος##" \
    --expression "s#_name#name#g" \
    ${srcdir}/ubuntu-wallpapers-${pkgver}/xenial-wallpapers.xml.in

  # move xml
  property_dirs=(
    "cinnamon-background-properties"
    "gnome-background-properties"
    "mate-background-properties"
  )

  for property_dir in ${property_dirs[@]}; do
    install -D --mode 644 ${srcdir}/ubuntu-wallpapers-${pkgver}/xenial-wallpapers.xml.in ${pkgdir}/usr/share/${property_dir}/xenial-wallpapers.xml
  done

  # license
  install -D --mode 644 ${srcdir}/ubuntu-wallpapers-${pkgver}/COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
