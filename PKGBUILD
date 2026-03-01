# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: envolution
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-speechrecognition
pkgver=3.14.4
pkgrel=2
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
  'git'
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
source=("git+${url}.git#tag=${pkgver}")
sha256sums=('8e0faf51aa924510a58406f57c937d9f01b4fb45b2d7269b4fe2bbd68784e72e')

build() {
  cd "${srcdir}/speech_recognition"

  python -m build --wheel --no-isolation
}

check() {
  cp -r "${srcdir}/speech_recognition/tests" "${srcdir}/tests"
  cd "${srcdir}"
  PYTHONPATH="${srcdir}/speech_recognition" python -m pytest \
    -k "not test_google_cloud" \
    --ignore=tests/recognizers/test_google_cloud.py \
    --ignore=tests/recognizers/test_groq.py \
    --ignore=tests/test_special_features.py \
    --ignore=tests/recognizers/whisper_api/test_groq.py \
    tests/ || true
  rm -rf "${srcdir}/tests"
}

package() {
  cd "${srcdir}/speech_recognition"

  python -m installer --destdir "${pkgdir}" dist/*.whl

  install -Dm644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
