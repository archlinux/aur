# Maintainer: RubenKelevra <cyrond@gmail.com>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Michele Schäuble <mschaeuble@swissonline.ch>

pkgname=josm-stable
_name=josm
_app_id="org.openstreetmap.${_name}"
pkgver=22.07
pkgrel=1
_commit_id=18531
pkgdesc="An editor for OpenStreetMap written in Java. Stable releases"
arch=('any')
url="https://josm.openstreetmap.de/"
license=('GPL')
depends=('hicolor-icon-theme' 'java-runtime>=11' 'ttf-font' 'sh')
conflicts=('josm')
provides=('josm')
makedepends=('subversion')
changelog=$pkgname.changelog
backup=('etc/conf.d/josm')
source=(https://josm.openstreetmap.de/download/${_name}-snapshot-${_commit_id}.jar
        ${_name}.conf.d
        ${_name}::svn+https://josm.openstreetmap.de/svn/trunk#revision=${_commit_id})
noextract=(${_name}-snapshot-${_commit_id}.jar)
b2sums=('29dc3ea0684509abbb9c588f92b2cb8fb613dee2fe44186ad71e5caff03b56427ddd7cdfb82170a2d5c567c91b649add6b13440049eab922f92f9b1005c2c354'
        '368a8116c9b2be9906bc76fc5a51c20321137747ddf463ae029a235ec75c1a420f477dc53bce38fd0a68c2f6fdb05dae2f700cf0e65e464f17e28e3439a3d7cf'
        'SKIP')

package() {
  cd "${srcdir}"

  install -Dm644 ${_name}-snapshot-${_commit_id}.jar "${pkgdir}"/usr/share/java/${_name}/${_name}.jar

#.desktop and icon file
  install -Dm644 ${_name}/native/linux/tested/usr/share/applications/${_app_id}.desktop \
        "${pkgdir}"/usr/share/applications/${_app_id}.desktop
  install -Dm644 ${_name}/native/linux/tested/usr/share/man/man1/${_name}.1 \
        "${pkgdir}"/usr/share/man/man1/${_name}.1
  install -Dm644 ${_name}/native/linux/tested/usr/share/metainfo/${_app_id}.appdata.xml \
        "${pkgdir}"/usr/share/metainfo/${_app_id}.appdata.xml
  install -Dm644 ${_name}/native/linux/tested/usr/share/icons/hicolor/scalable/apps/${_app_id}.svg \
        "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/${_app_id}.svg

  for _icon in 8 16 22 24 32 36 40 42 48 64 72 80 96 128 192 256 512; do
      install -Dm644 ${_name}/native/linux/tested/usr/share/icons/hicolor/${_icon}x${_icon}/apps/${_app_id}.png \
        "${pkgdir}"/usr/share/icons/hicolor/${_icon}x${_icon}/apps/${_app_id}.png
  done

#executable file
  install -d "${pkgdir}"/usr/bin
  cat <<"EOF" >"${pkgdir}"/usr/bin/${_name}
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
  chmod 755 "${pkgdir}"/usr/bin/${_name}
  install -Dm644 "${srcdir}"/${_name}.conf.d "${pkgdir}"/etc/conf.d/${_name}
}
