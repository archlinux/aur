# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=polyendtracker-midi-export
pkgver=0.3.2
pkgrel=2
pkgdesc='MIDI exporter for Polyend Tracker project files'
arch=('any')
url='https://github.com/DataGreed/polyendtracker-midi-export'
license=('MIT')
depends=('python' 'python-midiutil')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('mediainfo' 'python-installer')
options=('!debug' '!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/DataGreed/polyendtracker-midi-export/archive/v${pkgver}.tar.gz"
  'github-pr-4.patch'
  'github-pr-5-backported.patch'
)

sha512sums=(
  'a5cf2534caee849abf7f417671d8d5fa94f2af3c831b35b30eefd54005f832bf397d1e1632a09a3a8766b1bd44f6b8d275e4f375e83f13609068498d024ef4a3'
  '00a6c545366298c4e3c2fbc354034dc9628204bf2dbb5eceef56ad0a512d99cdd6f1f64359b0cba256fc44da73f4c6ccb69d9838d2d5ccd43d4a5fab62dbeee3'
  '6f41834aa6a5588bcd7104d20cd9857432a41a3bd2772483ad1532695c8b25979ae4097a47cf1893c4ce18e82831bdd8b69970cbc9ca5d8108ce3cdc5687b54e'
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Remove the following patches once upstream has merged PR #4 and
  # PR #5 and included them in a stable release.

  # Apply workaround for setuptools not picking up modules
  # https://github.com/DataGreed/polyendtracker-midi-export/pull/4
  patch -p1 < ../github-pr-4.patch

  # Apply workarounds for bugs in `python-midiutil`
  # https://github.com/DataGreed/polyendtracker-midi-export/pull/5
  patch -p1 < ../github-pr-5-backported.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

_check_parser() {
  # Given
  ln -fns "${srcdir}/${pkgname}-${pkgver}/reverse-engineering" .

  # When
  echo >&2 'Testing parser'
  python "${srcdir}/${pkgname}-${pkgver}/main.py" > test_output.txt

  # Then
  if [ "$(awk '/BPM:/ { print $2 }' test_output.txt)" != '90.0' ]; then
    printf >&2 '%s\n' 'Unexpected test output:' '==='
    cat >&2 test_output.txt
    printf >&2 '\n%s\n' '==='
    exit 1
  fi
}

_check_exporter() {
  # Given
  ln -fns "${srcdir}/${pkgname}-${pkgver}/reverse-engineering`
    `/test data/chords and arps/1 chord arp test data project" \
    test-project

  # When
  echo >&2 'Testing exporter'
  ./usr/bin/polymidiexport test-project/patterns/pattern_01.mtp \
    pattern_01.mid

  # Then
  mediainfo --Details=1 pattern_01.mid > mediainfo.txt
  if ! grep -q MTrk mediainfo.txt; then
    printf >&2 '%s\n' 'Unexpected test output:' '==='
    cat >&2 mediainfo.txt
    printf >&2 '\n%s\n' '==='
    exit 1
  fi
}

check() {
  cd "$(mktemp -d)"

  echo >&2 'Installing wheel into a temporary directory'
  python -m installer --destdir=. \
    "${srcdir}/${pkgname}-${pkgver}/dist"/*.whl
  PYTHONPATH="${PWD}/$(
    python -c 'import site; print(site.getsitepackages()[0])'
  )"
  export PYTHONPATH

  _check_parser
  _check_exporter
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    'README.md'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}/reverse-engineering" \
    'reverse-engineering'/*.{png,md}

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    'LICENSE.txt'
}
