# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgbase=quodlibet
pkgname=(exfalso)
pkgver=4.4.0
pkgrel=3
pkgdesc="Music player and music library manager"
arch=(any)
url="https://quodlibet.readthedocs.io/"
license=(GPL2)
depends=(dbus-python gtk3 python-cairo python-feedparser python-gobject python-mutagen)
makedepends=(python-sphinx_rtd_theme)
# python-raven python-senf are currently vendored
checkdepends=(gst-plugins-base gst-plugins-good python-pytest python-xvfbwrapper)
source=(
	"https://github.com/${pkgbase}/${pkgbase}/releases/download/release-${pkgver}/${pkgbase}-${pkgver}.tar.gz"{,.sig}
	python310.patch
)
sha256sums=(a03318d2767e4959551763d0a87fad977387af712608fe572714176a24bbf367 SKIP SKIP)
validpgpkeys=(0EBF782C5D53F7E5FB02A66746BD761F7A49B0EC) # Christoph Reiter <reiter.christoph@gmail.com>

prepare() {
  cd ${pkgbase}-${pkgver}
  # Fix zsh completions dir
  sed -e 's|vendor-completions|site-functions|' -i gdist/zsh_completions.py
  patch -p5 < ../python310.patch
}

build() {
  cd ${pkgbase}-${pkgver}
  python setup.py build
}

#check() {
#  cd ${pkgbase}-${pkgver}
#  export PYTHONPATH="build:${PYTHONPATH}"
#  # not running useless linter checks
#  pytest -v -k 'not TFlake8'
#}

package_exfalso() {
  optdepends=('gst-plugins-bad: Submit Acoustic Fingerprints plugin'
              'gst-plugins-good: Replay Gain plugin'
              'kakasi: Kana/Kanji Simple Inverter plugin'
              'python-musicbrainzngs: MusicBrainz Lookup, MusicBrainz Sync plugins')
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
