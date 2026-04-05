# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Maintainer: schan <mail@schan.cc>
# Contributor: Adrian Sampson <adrian@radbox.org>
# Contributor: Johannes Löthberg <demizide@gmail.com>

pkgname=beets-git
pkgver=2.8.0.r100.ga6af177be
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
  ffmpeg
  gst-python
  imagemagick
  python-beautifulsoup4
  python-discogs-client
  python-flask
  python-flask-cors
  python-langdetect
  python-librosa
  python-mpd2
  python-mutagen
  python-numba
  python-pillow
  python-py7zr
  python-pylast
  python-pyacoustid
  python-pytest
  python-rarfile
  python-reflink
  python-requests-mock
  python-requests-oauthlib
  python-responses
  python-titlecase
  python-xdg
)
optdepends=(
  'bash-completion: Bash completion'
  'chromaprint: Chromaprint/Acoustid plugin'
  'ffmpeg: Convert, ReplayGain plugins'
  'gst-plugins-bad: Chromaprint/Acoustid, BPD, ReplayGain plugins'
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
    --ignore test/plugins/test_player.py \
    --ignore test/plugins/test_autobpm.py \
    --ignore test/plugins/test_aura.py \
    --deselect test/test_ui.py::CompletionTest::test_completion \
    --deselect test/test_importer.py::ImportDuplicateAlbumTest::test_merge_duplicate_album \
    --deselect test/test_ui.py::ConfigTest::test_cli_config_paths_resolve_relative_to_user_dir \
    --deselect test/plugins/test_bpd.py::BPDReflectionTest::test_cmd_decoders \
    --deselect test/plugins/test_replaygain.py::ReplayGainGstCliTest::test_backend \
    --deselect test/plugins/test_replaygain.py::ReplayGainGstCliTest::test_cli_does_not_skip_wrong_tag_type \
    --deselect test/plugins/test_replaygain.py::ReplayGainGstCliTest::test_cli_saves_album_gain_to_file \
    --deselect test/plugins/test_replaygain.py::ReplayGainGstCliTest::test_cli_saves_track_gain \
    --deselect test/plugins/test_replaygain.py::ReplayGainGstCliTest::test_cli_skips_calculated_tracks \
    --deselect test/plugins/test_replaygain.py::ReplayGainGstCliTest::test_cli_writes_only_r128_tags \
    --deselect test/plugins/test_replaygain.py::ReplayGainGstCliTest::test_per_disc \
    --deselect test/plugins/test_replaygain.py::ReplayGainGstCliTest::test_r128_targetlevel_has_effect \
    --deselect test/plugins/test_replaygain.py::ReplayGainGstCliTest::test_targetlevel_has_effect \
    --deselect test/plugins/test_replaygain.py::ReplayGainGstImportTest::test_backend \
    --deselect test/plugins/test_replaygain.py::ReplayGainGstImportTest::test_import_converted
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
