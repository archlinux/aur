# Maintainer: RubenKelevra <cyrond@gmail.com>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Michele Schäuble <mschaeuble@swissonline.ch>

pkgname=josm-stable
_name=josm
_app_id="org.openstreetmap.${_name}"
pkgver=22.09
pkgrel=1
_commit_id=18565
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
b2sums=('86e3ba627ad17dd492dde3b68619842e999151d4ecbccb04311f2fec4298922c3519af8dc470cafe96109db32d1273762497e0047b681dd5e3f8d648be957af1'
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
