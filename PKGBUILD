# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: envolution
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-speechrecognition
pkgver=3.16.1
pkgrel=1
pkgdesc='Speech recognition module for Python, supporting several engines and APIs'
arch=('any')
url='https://github.com/Uberi/speech_recognition'
license=('BSD-3-Clause')
depends=(
  'flac'
  'python-audioop-lts'
  'python-standard-aifc'
  'python-typing_extensions'
)
optdepends=(
  'python-pyaudio: required for microphone input'
  'python-pocketsphinx: CMU Sphinx backend (local)'
  'python-google-cloud-speech: Google Cloud Speech-to-Text backend'
  'python-google-api-core: required for Google Cloud Speech-to-Text'
  'python-tensorflow: Tensorflow backend (local)'
  'python-vosk: Vosk backend (local)'
  'python-whisper: OpenAI Whisper backend (local)'
  'python-faster-whisper: Faster Whisper backend (local)'
  'python-numpy: required for local Whisper'
  'python-pytorch: required for local Whisper'
  'python-soundfile: required for local Whisper'
  'python-openai: OpenAI Whisper API backend'
  'python-groq: Groq Whisper API backend'
  'python-requests: AssemblyAI Speech-to-Text backend'
  'python-boto3: Amazon Lex and Amazon Transcribe backends'
  'python-botocore: required for Amazon Transcribe'
  'python-cohere: Cohere API backend'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-pytest-randomly'
  'python-respx'
  'python-numpy'
  'python-pytest-httpserver'
  'python-pocketsphinx' # test_recognition.py
  'python-httpx' # whisper_api/ tests
  'python-openai' # test_openai.py
  'python-groq' # test_groq.py
  'python-google-cloud-speech' # test_google_cloud.py
  'python-cryptography' # test_google_cloud.py
)
source=("${pkgname}-${pkgver}.tgz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('23bbf04ba7263273e958005469305db1ec4183dc60a7f3bde872e63fb6b02b677ca51cd54da769464cf55dabf49511f06456bfed3e64caf145d62c80dac30a08')

build() {
  cd "${srcdir}/speech_recognition-${pkgver}"

  # Remove packaged FLAC binaries in favor of the Arch Linux package.
  rm speech_recognition/flac-* LICENSE-FLAC.txt

  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/speech_recognition-${pkgver}"

  python -m pytest \
    --doctest-modules speech_recognition/recognizers/ \
    --ignore tests/recognizers/test_vosk.py \
    tests/
}

package() {
  cd "${srcdir}/speech_recognition-${pkgver}"

  python -m installer --destdir "${pkgdir}" dist/*.whl

  install -Dm644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
