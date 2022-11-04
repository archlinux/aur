# Maintainer: RubenKelevra <cyrond@gmail.com>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Michele Schäuble <mschaeuble@swissonline.ch>

pkgname=josm-stable
_name=josm
_app_id="org.openstreetmap.${_name}"
pkgver=22.10
pkgrel=2
_commit_id=18583
pkgdesc="An editor for OpenStreetMap written in Java. Stable releases"
arch=('any')
url="https://josm.openstreetmap.de/"
license=('GPL')
depends=('hicolor-icon-theme' 'java-runtime>=11' 'ttf-font' 'sh')
conflicts=('josm' 'josm-tested')
provides=('josm')
makedepends=()
changelog=$pkgname.changelog
backup=('etc/conf.d/josm')
source=("https://josm.openstreetmap.de/download/${_name}-snapshot-${_commit_id}.jar"
        "${_name}.conf.d"
        "https://josm.openstreetmap.de/export/${_commit_id}/josm/trunk/native/linux/tested/usr/share/applications/${_app_id}.desktop"
        "https://josm.openstreetmap.de/export/${_commit_id}/josm/trunk/native/linux/tested/usr/share/man/man1/${_name}.1"
        "https://josm.openstreetmap.de/export/${_commit_id}/josm/trunk/native/linux/tested/usr/share/metainfo/${_app_id}.appdata.xml"
        "https://josm.openstreetmap.de/export/${_commit_id}/josm/trunk/native/linux/tested/usr/share/icons/hicolor/scalable/apps/${_app_id}.svg")
noextract=(${_name}-snapshot-${_commit_id}.jar)
b2sums=('1f661090db02278a05f457093ac6ff8aff060c00ead6347e283892e114ea7bf5c0a96279dd645cf97cbb45a3bf8f8919b5523cc847f52b703b19c4bfa909f463'
        '6ab22295febf20e8124da5f224d28722210345b33a091b948dd02e1897ab7767cdf6b65ee42bf777f3d52dfb88e14b7af9a013ee60e6949964618bb33416b6ee'
        'd3a5e0204d0188e72eed65e71edd079b5aa025b82f13c515605f7d5bb9f96fc93e4a24c9eea76c6c4027f54f1c449cda811f5c59e0f2ab54975ab3b1bf221ee7'
        '095c9a52e8efaf90a41d322c89cee6828ff05a20999a864f438e1b8c101382588e58f455f8339235493a27a16326b9114add69aeab9709e9bf8a28d1ce5594d5'
        '59eafa8c80f4ab55406ff909851fceacdd9c6f956017ead50bb3ee47c4d439f4e1e35406823a00f1654178244aec26be1f0de7703ea00cdda6d40cbf0b0d9235'
        'b0ec92c4e97500d5461200f698fbfccc53c275169c25db3139a4c97826fffa96ec6104d21ab9a16d4221b98725faea09e6a2b7d99ed48a782becab6dd9de8d4f')

package() {
  cd "${srcdir}"

  install -Dm644 ${_name}-snapshot-${_commit_id}.jar "${pkgdir}"/usr/share/java/${_name}/${_name}.jar

#.desktop and icon file
  install -Dm644 ${_app_id}.desktop \
        "${pkgdir}"/usr/share/applications/${_app_id}.desktop
  install -Dm644 ${_name}.1 \
        "${pkgdir}"/usr/share/man/man1/${_name}.1
  install -Dm644 ${_app_id}.appdata.xml \
        "${pkgdir}"/usr/share/metainfo/${_app_id}.appdata.xml
  install -Dm644 ${_app_id}.svg \
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
