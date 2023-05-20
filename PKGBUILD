# Maintainer: LA-MJ < 4mr.minj a t gmail >

_pkgbase=quodlibet
pkgname=(exfalso)
pkgver=4.5.0
pkgrel=1
pkgdesc="Music player and music library manager"
arch=(any)
url="https://quodlibet.readthedocs.io/"
license=(GPL2)
depends=(dbus-python gtk3 libsoup python-cairo python-feedparser python-gobject python-mutagen)
makedepends=(python-sphinx_rtd_theme)
# python-raven python-senf are currently vendored
checkdepends=(gst-plugins-base gst-plugins-good python-pytest python-xvfbwrapper)
source=(
	"https://github.com/${_pkgbase}/${_pkgbase}/releases/download/release-${pkgver}/${_pkgbase}-${pkgver}.tar.gz"{,.sig}
)
sha256sums=('301615829f652cbafedb35539237162a58bc1ee71a567d249f7789d9268245bc'
            'SKIP')
validpgpkeys=(0EBF782C5D53F7E5FB02A66746BD761F7A49B0EC) # Christoph Reiter <reiter.christoph@gmail.com>

prepare() {
  cd ${_pkgbase}-${pkgver}
  # Fix zsh completions dir
  sed -e 's|vendor-completions|site-functions|' -i gdist/zsh_completions.py
}

build() {
  cd ${_pkgbase}-${pkgver}
  python setup.py build
}

check() {
  cd ${_pkgbase}-${pkgver}
  export PYTHONPATH="${PWD}/build"
  # not running useless linter checks
  # TOperonEdit.test_remove_all: https://github.com/quodlibet/quodlibet/issues/3966
  # TCoverManager.test_invalid_glob: https://github.com/quodlibet/quodlibet/issues/4021
  pytest -v --color=yes -k 'not TFlake8' \
    --deselect tests/test_operon.py::TOperonEdit::test_remove_all \
    --deselect tests/test_util_cover.py::TCoverManager::test_invalid_glob
}

package_exfalso() {
  optdepends=('gst-plugins-bad: Submit Acoustic Fingerprints plugin'
              'gst-plugins-good: Replay Gain plugin'
              'kakasi: Kana/Kanji Simple Inverter plugin'
              'python-musicbrainzngs: MusicBrainz Lookup, MusicBrainz Sync plugins')
  conflicts=("${_pkgbase}")


  cd ${_pkgbase}-${pkgver}
  python setup.py install --root="${pkgdir}" --skip-build --optimize=1


  # Remove Quod Libet
  internal_name="io.github.${_pkgbase}.QuodLibet"
  rm    "${pkgdir}"/usr/bin/${_pkgbase}
  rm    "${pkgdir}"/usr/share/appdata/${internal_name}.appdata.xml
  rm    "${pkgdir}"/usr/share/applications/${internal_name}.desktop
  rm    "${pkgdir}"/usr/share/bash-completion/completions/${_pkgbase}
  rm -r "${pkgdir}"/usr/share/dbus-1/
  rm -r "${pkgdir}"/usr/share/gnome-shell/
  for i in 16 24 32 48 64 128 256
  do
      rm "${pkgdir}"/usr/share/icons/hicolor/${i}x${i}/apps/${internal_name}.png
  done
  rm    "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/${internal_name}.svg
  rm    "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/${internal_name}-symbolic.svg
  rm    "${pkgdir}"/usr/share/man/man1/${_pkgbase}.1
  rm -r "${pkgdir}"/usr/share/zsh/

  # Remove plugins
  site_packages="$(find ${pkgdir} -type d -name site-packages)"

  rm -r "${site_packages}"/${_pkgbase}/plugins/listenbrainz

  for package in _shared covers events gstreamer playlist playorder query
  do
      rm -r "${site_packages}"/${_pkgbase}/ext/${package}
  done

  find "${site_packages}"/${_pkgbase}/ext/songsmenu \
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
