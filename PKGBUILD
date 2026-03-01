# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: envolution
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-speechrecognition
pkgver=3.14.4
pkgrel=3
pkgdesc='Speech recognition module for Python, supporting several engines and APIs'
arch=('i686' 'x86_64') # embedded FLAC binaries for these platforms
url='https://github.com/Uberi/speech_recognition'
license=('BSD-3-Clause AND GPL-2.0-or-later') # FLAC binaries released under GPLv2
depends=(
  'python-audioop'
  'python-requests'
  'python-tensorflow'
  'python-botocore'
  'python-boto3'
  'lib32-glibc'
  'flac'
  'python-aifc'
)
optdepends=(
  'python-pyaudio: required for microphone input'
  'python-pocketsphinx'
  'python-vosk'
  'python-whisper'
  'python-google-api-core: Google cloud speech'
  'python-faster-whisper: required for Whisper'
  'python-typing_extensions: required for faster Whisper'
  'python-pytorch: Required for Whisper'
  'python-numpy: required for Whisper'
  'python-openai: required for OpenAI'
  'python-soundfile: required for Whisper'
  'python-google-cloud-speech: required for Google Cloud Speech-toText API'
  'python-vosk: required for Vosk recognizer'
  'python-groq: required for Groq Whisper API'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pocketsphinx'
  'python-pytest'
  'python-httpx'
  'python-respx'
)
source=("${pkgname}-${pkgver}.tgz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('b7dea453352f6cb6721ebb67cdaa9da09d522d0500b2c7286f11067b1566abe15b23b5a3c1654af1fc7db4b90bb26b09685f78de77c2b04f3adc31a7f7438408')

build() {
  cd "${srcdir}/speech_recognition-${pkgver}"

  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/speech_recognition-${pkgver}"

  python -m pytest \
    -k "not test_google_cloud" \
    --ignore=tests/recognizers/test_google_cloud.py \
    --ignore=tests/recognizers/test_groq.py \
    --ignore=tests/test_special_features.py \
    --ignore=tests/recognizers/whisper_api/test_groq.py \
    tests/ || true
}

package() {
  cd "${srcdir}/speech_recognition-${pkgver}"

  python -m installer --destdir "${pkgdir}" dist/*.whl
  # See <https://wiki.archlinux.org/title/Python_package_guidelines#Test_directory_in_site-package>
  rm -r "${pkgdir}"/usr/lib/python*/site-packages/tests

  install -Dm644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
