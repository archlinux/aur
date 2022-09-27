# Maintainer: jmcb <joelsgp@protonmail.com>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Michele Schäuble <mschaeuble@swissonline.ch>

pkgname=josm-tested
pkgver=18463
pkgrel=1
pkgdesc="An editor for OpenStreetMap written in Java"
arch=('any')
url="https://josm.openstreetmap.de/"
license=('GPL')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'java-runtime>=11' 'libxtst' 'ttf-font')
makedepends=('subversion')
provides=('josm')
conflicts=('josm')
backup=('etc/conf.d/josm')
source=(https://josm.openstreetmap.de/download/${pkgname%-tested}-snapshot-$pkgver.jar
        ${pkgname%-tested}.conf.d
        ${pkgname%-tested}::svn+https://josm.openstreetmap.de/svn/trunk#revision=$pkgver)
noextract=(${pkgname%-tested}-snapshot-$pkgver.jar)
sha256sums=('fbef17b73032909fbce4abf3cb7c60699a0a695949c33f82b75c5bfd0902d467'
            '29377ce55c50951b1bd0e39003a977d8ea558c0657d613cea5f0056ce255e60e'
            'SKIP')

package() {
  cd "${srcdir}"

  install -Dm644 ${pkgname%-tested}-snapshot-$pkgver.jar "${pkgdir}"/usr/share/java/${pkgname%-tested}/${pkgname%-tested}.jar

#.desktop and icon file
  install -Dm644 ${pkgname%-tested}/native/linux/tested/usr/share/applications/org.openstreetmap.josm.desktop \
        "${pkgdir}"/usr/share/applications/org.openstreetmap.josm.desktop
  install -Dm644 ${pkgname%-tested}/native/linux/tested/usr/share/man/man1/josm.1 \
        "${pkgdir}"/usr/share/man/man1/josm.1
  install -Dm644 ${pkgname%-tested}/native/linux/tested/usr/share/metainfo/org.openstreetmap.josm.appdata.xml \
        "${pkgdir}"/usr/share/metainfo/org.openstreetmap.josm.appdata.xml
  install -Dm644 ${pkgname%-tested}/native/linux/tested/usr/share/icons/hicolor/scalable/apps/org.openstreetmap.josm.svg \
        "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/org.openstreetmap.josm.svg

  for _icon in 8 16 22 24 32 36 40 42 48 64 72 80 96 128 192 256 512; do
      install -Dm644 ${pkgname%-tested}/native/linux/tested/usr/share/icons/hicolor/${_icon}x${_icon}/apps/org.openstreetmap.josm.png \
        "${pkgdir}"/usr/share/icons/hicolor/${_icon}x${_icon}/apps/org.openstreetmap.josm.png
  done

#executable file
  install -d "${pkgdir}"/usr/bin
  cat <<"EOF" >"${pkgdir}"/usr/bin/${pkgname%-tested} 
#!/bin/sh
# source application-specific settings
while true; do
    JOSM_ARGS=
    [ -f /etc/conf.d/josm ] && . /etc/conf.d/josm
    CLASSPATH="/usr/share/java/josm/josm.jar"
    java ${JOSM_ARGS} -cp "${CLASSPATH}" -Djosm.restart=true org.openstreetmap.josm.gui.MainApplication "$@"
    [ $? -eq 9 ] || break
done
EOF
  chmod 755 "${pkgdir}"/usr/bin/${pkgname%-tested}
  install -Dm644 "${srcdir}"/${pkgname%-tested}.conf.d "${pkgdir}"/etc/conf.d/${pkgname%-tested}
}
