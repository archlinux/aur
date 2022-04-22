# Maintainer: Markus Pesch <markus.pesch@cryptic.systems>

pkgname=ubuntu-backgrounds-jammy
pkgver=22.04.4
pkgrel=1
pkgdesc="The backgrounds included in Ubuntu 22.04 jammy"
license=('Commons Attribution-ShareAlike 3.0 Unported')
arch=('any')
url="http://archive.ubuntu.com/ubuntu/pool/main/u/ubuntu-wallpapers"
source=("${url}/ubuntu-wallpapers_${pkgver}.orig.tar.gz")
sha256sums=('83a9469e84c908d29f9fb2484029575a2d05548f9d984dca556740b622c5dd1e')

package() {
  # move only wallpapers which are new in jammy
  wallpapers=(
    "Blue_flower_by_Elena_Stravoravdi.jpg"
    "canvas_by_roytanck.jpg"
    "Cherry_Tree_in_Lakones_by_elenastravoravdi.jpg"
    "DSC2943_by_kcpru.jpg"
    "jj_dark_by_Hiking93.jpg"
    "jj_light_by_Hiking93.jpg"
    "Mirror_by_Uday_Nakade.jpg"
    "Optical_Fibers_in_Dark_by_Elena_Stravoravdi.jpg"
    "ubuntu2_by_arman1992.jpg"
    "ubuntu_by_arman1992.jpg"
  )

  for wallaper in ${wallpapers[@]}; do
    install -D --mode 644 ${srcdir}/ubuntu-wallpapers-${pkgver}/${wallaper} ${pkgdir}/usr/share/backgrounds/${pkgname}/${wallaper}
  done

  # edit xml
  # - replace directory, use a more detailed directory path
  # - fix xml tag
  sed \
    --in-place \
    --expression "s#/usr/share/backgrounds/contest/jammy.xml#/usr/share/gnome-background-properties/jammy-wallpapers.xml#" \
    --expression "s#/usr/share/backgrounds#/usr/share/backgrounds/${pkgname}#g" \
    ${srcdir}/ubuntu-wallpapers-${pkgver}/jammy-wallpapers.xml.in

  # move xml
  property_dirs=(
    "cinnamon-background-properties"
    "gnome-background-properties"
    "mate-background-properties"
  )

  for property_dir in ${property_dirs[@]}; do
    install -D --mode 644 ${srcdir}/ubuntu-wallpapers-${pkgver}/jammy-wallpapers.xml.in ${pkgdir}/usr/share/${property_dir}/jammy-wallpapers.xml
  done

  # license
  install -D --mode 644 ${srcdir}/ubuntu-wallpapers-${pkgver}/COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
