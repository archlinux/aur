# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgbase=quodlibet
pkgname=(quodlibet exfalso)
pkgver=4.4.0
pkgrel=1
pkgdesc="Music player and music library manager"
arch=(any)
url="https://quodlibet.readthedocs.io/"
license=(GPL2)
depends=(gtk3 python-mutagen python-gobject python-cairo python-feedparser)
makedepends=(gst-plugins-base gst-plugins-bad gst-plugins-good gst-plugins-ugly
             python-sphinx_rtd_theme xine-lib)
# python-raven python-senf are currently vendored
checkdepends=(python-pytest python-xvfbwrapper)
source=("https://github.com/${pkgbase}/${pkgbase}/releases/download/release-${pkgver}/${pkgbase}-${pkgver}.tar.gz"{,.sig})
sha256sums=(a03318d2767e4959551763d0a87fad977387af712608fe572714176a24bbf367 SKIP)
validpgpkeys=(0EBF782C5D53F7E5FB02A66746BD761F7A49B0EC) # Christoph Reiter <reiter.christoph@gmail.com>

prepare() {
  cd ${pkgbase}-${pkgver}
  # Fix zsh completions dir
  sed -e 's|vendor-completions|site-functions|' -i gdist/zsh_completions.py
}

build() {
  cd ${pkgbase}-${pkgver}
  python setup.py build
}

check() {
  cd ${pkgbase}-${pkgver}
  export PYTHONPATH="build:${PYTHONPATH}"
  # not running useless linter checks
  pytest -v -k 'not TFlake8'
}

package_quodlibet() {
  depends+=(gst-plugins-base xine-lib)
# python-raven python-senf are currently vendored
  optdepends=('gst-libav: WMA support'
              'gst-plugins-bad: mp3, mp4 and opus support and acoustid plugin'
              'gst-plugins-good: flac, jack and pulseaudio support and replaygain plugin'
              'gst-plugins-ugly: alternative mp3 support'
              'gtksourceview3: undo and redo support in multiline text fields'
              'kakasi: Kana Kanji Simple Inverter plugin'
              'libappindicator-gtk3: tray icon plugin'
              'libkeybinder3: Multimedia keys support'
              'libmodplug: MOD support'
              'python-dbus: DBus interface, multimedia key support and several plugins'
              'python-musicbrainzngs: musicbrainz plugin'
              'python-pyinotify: auto library update plugin'
              'rygel: uPnP media server'
              'webkit2gtk: lyrics window plugin')

  cd ${pkgbase}-${pkgver}
  python setup.py install --root="${pkgdir}" --skip-build --optimize=1
  install -Dm644 {README,NEWS}.rst -t "${pkgdir}"/usr/share/doc/${pkgbase}
}

package_exfalso() {
  optdepends=('gst-plugins-bad: for acoustid plugin'
              'gst-plugins-good: for replaygain plugin'
              'kakasi: for "Kana/Kanji Simple Inverter" plugin'
              'python-dbus: for "Browse Folders" plugin'
              'python-musicbrainzngs: for "MusicBrainz Lookup" plugin')
  conflicts=("${pkgbase}")

  cd ${pkgbase}-${pkgver}
  python setup.py install --root="${pkgdir}" --skip-build --optimize=1

  # Remove Quod Libet
  internal_name="io.github.${pkgbase}.QuodLibet"
  rm    "${pkgdir}"/usr/bin/${pkgbase}
  rm    "${pkgdir}"/usr/share/appdata/${internal_name}.appdata.xml
  rm    "${pkgdir}"/usr/share/applications/${internal_name}.desktop
  rm    "${pkgdir}"/usr/share/bash-completion/completions/${pkgbase}
  rm -r "${pkgdir}"/usr/share/dbus-1/
  rm -r "${pkgdir}"/usr/share/gnome-shell/
  for i in 16 24 32 48 64 128 256
  do
      rm "${pkgdir}"/usr/share/icons/hicolor/${i}x${i}/apps/${internal_name}.png
  done
  rm    "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/${internal_name}.svg
  rm    "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/${internal_name}-symbolic.svg
  rm    "${pkgdir}"/usr/share/man/man1/${pkgbase}.1
  rm -r "${pkgdir}"/usr/share/zsh/

  # Remove plugins
  site_packages="$(find ${pkgdir} -type d -name site-packages)"

  rm -r "${site_packages}"/${pkgbase}/plugins/listenbrainz

  for package in _shared covers events gstreamer playlist playorder query
  do
      rm -r "${site_packages}"/${pkgbase}/ext/${package}
  done

  find "${site_packages}"/${pkgbase}/ext/songsmenu \
      -type f \( \
          -name "bookmarks.*" \
          -o -name "duplicates.*" \
          -o -name "editplaycount.*" \
          -o -name "exact_rating.*"\
          -o -name "filterall.*" \
          -o -name "filterbrowser.*" \
          -o -name "forcewrite.*" \
          -o -name "html.*" \
          -o -name "ifp.*" \
          -o -name "importexport.*" \
          -o -name "k3b.*" \
          -o -name "lastfmsync.*" \
          -o -name "migratemetadata.*" \
          -o -name "playlist.*" \
          -o -name "refresh.*" \
      \) -delete
}
