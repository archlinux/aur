# Maintainer: Markus Pesch <markus.pesch@cryptic.systems>

pkgname=ubuntu-backgrounds-focal
pkgver=20.04.2
pkgrel=1
pkgdesc="The backgrounds included in Ubuntu 20.04 focal"
license=('Commons Attribution-ShareAlike 3.0 Unported')
arch=('any')
url="https://launchpad.net/ubuntu/+source/ubuntu-wallpapers/${pkgver}-0ubuntu1"
source=("https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/ubuntu-wallpapers/${pkgver}-0ubuntu1/ubuntu-wallpapers_${pkgver}.orig.tar.gz")
sha256sums=('c89d53a769967edce106fb6b431e35ee1e3a14a91aa50545ff72b5c8159737ee')

package() {

  # move only wallpapers which are new in focal
  wallpapers=(
    "brad-huchteman-stone-mountain.jpg"
    "joshua-coleman-something-yellow.jpg"
    "matt-mcnulty-nyc-2nd-ave.jpg"
    "ryan-stone-skykomish-river.jpg"
    "hardy_wallpaper_uhd.png"
  )

  for wallaper in ${wallpapers[@]}; do
    install -D --mode 644 ${srcdir}/ubuntu-wallpapers-${pkgver}/${wallaper} ${pkgdir}/usr/share/backgrounds/${pkgname}/${wallaper}
  done

  # edit xml
  # - replace directory, use a more detailed directory path
  # - fix xml tag
  sed \
    --in-place \
    --expression "s#/usr/share/backgrounds/contest/focal.xml#/usr/share/gnome-background-properties/focal-wallpapers.xml#" \
    --expression "s#/usr/share/backgrounds#/usr/share/backgrounds/${pkgname}#g" \
    --expression "s#_name#name#g" \
    ${srcdir}/ubuntu-wallpapers-${pkgver}/focal-wallpapers.xml.in

  # move xml
  property_dirs=(
    "cinnamon-background-properties"
    "gnome-background-properties"
    "mate-background-properties"
  )

  for property_dir in ${property_dirs[@]}; do
    install -D --mode 644 ${srcdir}/ubuntu-wallpapers-${pkgver}/focal-wallpapers.xml.in ${pkgdir}/usr/share/${property_dir}/focal-wallpapers.xml
  done

  # license
  install -D --mode 644 ${srcdir}/ubuntu-wallpapers-${pkgver}/COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
