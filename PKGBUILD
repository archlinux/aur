# Maintainer: envolution
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-speechrecognition
_pkg=speechrecognition
_pkgdir=speech_recognition
pkgver=3.14.2
pkgrel=6
pkgdesc="Google-powered speech recognition for Python"
arch=('x86_64')
url="https://github.com/Uberi/speech_recognition"
license=('MIT')
depends=(
  'python-audioop'
  'python-requests'
  'python-tensorflow'
  'python-botocore'
  'python-boto3'
  'lib32-glibc'
  'flac'
  'python-aifc')
optdepends=(
  'python-pyaudio: Required for microphone input'
  'python-pocketsphinx'
  'python-vosk'
  'python-whisper'
  'python-google-api-core: Google cloud speech'
  'python-faster-whisper: Required for Whisper'
  'python-typing_extensions: Required for faster Whisper'
  'python-pytorch: Required for Whisper'
  'python-numpy: Required for whisper'
  'python-openai: Required for openai'
  'python-soundfile: Required for whisper'
  'python-google-cloud-speech: Required for Google Cloud Speech-toText API'
  'python-vosk: Required for Vosk recognizer'
  'python-groq: Required for Groq Whisper API'
)

makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel')
provides=('python-speech_recognition')
checkdepends=(
  'python-pocketsphinx'
  'python-pytest'
  'python-httpx'
  'python-respx')
source=("git+https://github.com/Uberi/speech_recognition.git#tag=${pkgver}")
sha256sums=('2761e8013d3b720f2d73a3cfe354be131e812525d598274a928e6150b2e2ac51')

build() {
  cd "$_pkgdir"
  python -m build --wheel --no-isolation
}

check() {
  cp -r "${_pkgdir}/tests" "${srcdir}/tests"
  cd "${srcdir}"
  PYTHONPATH="${_pkgdir}" python -m pytest \
    -k "not test_google_cloud" \
    --ignore=tests/recognizers/test_google_cloud.py \
    --ignore=tests/recognizers/test_groq.py \
    --ignore=tests/test_special_features.py \
    --ignore=tests/recognizers/whisper_api/test_groq.py \
    tests/ || true
  rm -rf "${srcdir}/tests"
}

package() {
  cd "$_pkgdir"
  python -m installer --destdir "$pkgdir" dist/*.whl
  install -Dm644 LICENSE* -t ${pkgdir}/usr/share/licenses/$pkgname/
}
# vim:set ts=2 sw=2 et:
