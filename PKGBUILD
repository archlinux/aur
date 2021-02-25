# Maintainer: Markus Pesch <markus.pesch@cryptic.systems>

pkgname=ubuntu-backgrounds-groovy
pkgver=20.10.3
pkgrel=1
pkgdesc="The backgrounds included in Ubuntu 20.10 groovy"
license=('Commons Attribution-ShareAlike 3.0 Unported')
arch=('any')
url="http://archive.ubuntu.com/ubuntu/pool/main/u/ubuntu-wallpapers"
source=("${url}/ubuntu-wallpapers_${pkgver}.orig.tar.gz")
sha256sums=('03582c2ffbdfff7d7e2f5a2b714221ae4aacc59e688306c1edf495ede258269d')

_ubunturelver=20.10
_ubunturelname=groovy

package() {

  mv "${srcdir}/ubuntu-wallpapers-${pkgver}/Abstract_Painting_Photo_by_Pierre_Châtel-Innocenti.jpg" "${srcdir}/ubuntu-wallpapers-${pkgver}/Abstract_Painting_Photo_by_Pierre_Chatel-Innocenti.jpg"

  # move only wallpapers which are new
  wallpapers=(
    "Abstract_Painting_Photo_by_Pierre_Chatel-Innocenti.jpg"
    "Camera_Film_by_Markus_Spiske.jpg"
    "Colored_Pencils_by_Jess_Bailey.jpg"
    "Landscape_Photography_Of_Mountains_by_Simon_Berger.jpg"
    "Silver_Back_Gorilla_by_Mike_Arney.jpg"
  )

  for wallaper in ${wallpapers[@]// /_}; do
    install -D --mode 644 ${srcdir}/ubuntu-wallpapers-${pkgver}/${wallaper} ${pkgdir}/usr/share/backgrounds/${pkgname}/${wallaper}
  done

  # edit xml
  # - replace directory, use a more detailed directory path
  # - fix xml tag
  sed \
    --in-place \
    --expression "s#/usr/share/backgrounds/contest/${_ubunturelname}.xml#/usr/share/gnome-background-properties/${_ubunturelname}-wallpapers.xml#" \
    --expression "s#/usr/share/backgrounds#/usr/share/backgrounds/${pkgname}#g" \
    --expression "s#_name#name#g" \
    --expression "s# Châtel#_Chatel#g" \
    ${srcdir}/ubuntu-wallpapers-${pkgver}/${_ubunturelname}-wallpapers.xml.in

  # move xml
  property_dirs=(
    "cinnamon-background-properties"
    "gnome-background-properties"
    "mate-background-properties"
  )

  for property_dir in ${property_dirs[@]}; do
    install -D --mode 644 ${srcdir}/ubuntu-wallpapers-${pkgver}/${_ubunturelname}-wallpapers.xml.in ${pkgdir}/usr/share/${property_dir}/${_ubunturelname}-wallpapers.xml
  done

  # license
  install -D --mode 644 ${srcdir}/ubuntu-wallpapers-${pkgver}/COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
