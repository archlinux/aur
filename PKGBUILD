# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Maintainer: schan <mail@schan.cc>
# Contributor: Adrian Sampson <adrian@radbox.org>
# Contributor: Johannes Löthberg <demizide@gmail.com>

pkgname=beets-git
pkgver=2.8.0.r111.g4aaf58bac
pkgrel=1
pkgdesc="Flexible music library manager and tagger - git version"
arch=('any')
url="https://beets.io/"
license=('MIT')
depends=(
  python
  python-confuse
  python-jellyfish
  python-lap
  python-mediafile
  python-numpy
  python-packaging
  python-platformdirs
  python-requests
  python-requests-ratelimiter
  python-typing_extensions
  python-unidecode
  python-yaml
)
makedepends=(
  git
  python-build
  python-docutils
  python-installer
  python-poetry-core
  python-poetry-dynamic-versioning
  python-pydata-sphinx-theme
  python-sphinx
  python-wheel
)
checkdepends=(
  bash-completion
  chromaprint
  ffmpeg
  gst-libav
  gst-plugins-bad
  gst-plugins-base
  gst-plugins-good
  gst-plugins-ugly
  gst-python
  imagemagick
  python-beautifulsoup4
  python-dbus
  python-discogs-client
  python-flask
  python-flask-cors
  python-gobject
  python-langdetect
  python-librosa
  python-mpd2
  python-mutagen
  python-numba
  python-pillow
  python-py7zr
  python-pyacoustid
  python-pylast
  python-pytest
  python-pytest-flask
  python-rarfile
  python-reflink
  python-requests-mock
  python-requests-oauthlib
  python-resampy
  python-responses
  python-scipy
  python-soco
  python-titlecase
  python-xdg
)
optdepends=(
  'bash-completion: Bash completion'
  'chromaprint: Chromaprint/Acoustid plugin'
  'ffmpeg: Convert, ReplayGain plugins'
  'gst-plugins-bad: Chromaprint/Acoustid, BPD, ReplayGain plugins'
  'gst-plugins-base: Chromaprint/Acoustid, BPD, ReplayGain plugins'
  'gst-plugins-good: Chromaprint/Acoustid, BPD, ReplayGain plugins'
  'gst-plugins-ugly: Chromaprint/Acoustid, BPD, ReplayGain plugins'
  'gst-libav: Chromaprint/Acoustid, BPD, ReplayGain plugins'
  'gst-python: Chromaprint/Acoustid, BPD, ReplayGain plugins'
  'imagemagick: Thumbnails plugin'
  'python-beautifulsoup4: Lyrics plugin'
  'python-dbus: Metasync plugin'
  'python-discogs-client: Discogs plugin'
  'python-flask: Web plugin'
  'python-flask-cors: Web, AURA plugins'
  'python-gobject: BPD, ReplayGain plugins'
  'python-langdetect: Lyrics plugin'
  'python-librosa: AutoBPM plugin'
  'python-mpd2: MPDStats plugin'
  'python-mutagen: Scrub plugin'
  'python-pillow: AURA, EmbedArt, FetchArt, Thumbnails plugins'
  'python-pyacoustid: Chromaprint/Acoustid plugin'
  'python-pylast: LastGenre, LastImport plugins'
  'python-rarfile: Import plugin (RAR archive support)'
  'python-resampy: AutoBPM plugin'
  'python-requests-oauthlib: Beatport plugin'
  'python-reflink: Reflink options for import plugin'
  'python-scipy: AutoBPM plugin'
  'python-soco: Sonosupdate plugin'
  'python-titlecase: Titlecase plugin'
  'python-xdg: Thumbnails plugin'
)
provides=("beets=$pkgver")
conflicts=('beets')
source=('git+https://github.com/beetbox/beets.git')
md5sums=('SKIP')

pkgver() {
  cd beets
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd beets
  python -m build --wheel --no-isolation

  # docs building process requires (imports) beets
  # install beets into a temporary directory; virtualenv by hand
  # (easier this way because we need to override $PYTHONPATH directly)
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  python -m installer --destdir=test-env dist/*.whl

  # Remove sphinx extensions not needed for man pages
  sed -i '/sphinx_toolbox\|sphinx_design\|sphinx_copybutton\|viewcode/d' docs/conf.py

  PYTHONPATH="$PWD/test-env/$site_packages" \
  make -C docs man
}

check() {
  cd beets
  pytest \
    --override-ini="addopts=" \
    --deselect test/plugins/test_bpd.py::BPDReflectionTest::test_cmd_decoders
}

package() {
  cd beets
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 extra/_beet -t "${pkgdir}"/usr/share/zsh/site-functions/
  install -Dm 644 docs/_build/man/beet.1 -t "${pkgdir}"/usr/share/man/man1/
  install -Dm 644 docs/_build/man/beetsconfig.5 -t "${pkgdir}"/usr/share/man/man5/
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/beets/
  rm -rfv "${pkgdir}"/usr/lib/python*/site-packages/test/
}
