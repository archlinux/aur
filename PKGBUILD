# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: envolution
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-speechrecognition
pkgver=3.14.6
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
  'python-vosk' # test_vosk.py
  'python-httpx' # whisper_api/ tests
  'python-openai' # test_openai.py
  'python-groq' # test_groq.py
  'python-google-cloud-speech' # test_google_cloud.py
  'python-cryptography' # test_google_cloud.py
)
source=("${pkgname}-${pkgver}.tgz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        'https://alphacephei.com/vosk/models/vosk-model-small-en-us-0.15.zip')
b2sums=('36073d4358182d141ed7865bdbcbaa3e4949975a882048a9a7744ae82b5d0da1b4e80ac5881d2764ba9ba29c3a2bc667ada3215f598b2e0c2ff7530872332ed3'
        'a0b871f1598d933d613d26e7a09c1c7f2e26af7ef83cbb58b6eb06581fe61ed7fab248a8e892a68470e217082bf705865ebae9118f85e0c136fb43aa310f2841')

build() {
  cd "${srcdir}/speech_recognition-${pkgver}"

  # Remove packaged FLAC binaries in favor of the Arch Linux package.
  rm speech_recognition/flac-* LICENSE-FLAC.txt
  # 'sprc download vosk' will not work in /usr/lib, so this package provides
  # the default model for basic functionality with the Vosk backend.
  mv "${srcdir}/vosk-model-small-en-us-0.15" speech_recognition/models/vosk

  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/speech_recognition-${pkgver}"

  python -m pytest --doctest-modules speech_recognition/recognizers/ tests/
}

package() {
  cd "${srcdir}/speech_recognition-${pkgver}"

  python -m installer --destdir "${pkgdir}" dist/*.whl
  # See <https://wiki.archlinux.org/title/Python_package_guidelines#Test_directory_in_site-package>
  rm -r "${pkgdir}"/usr/lib/python*/site-packages/tests

  install -Dm644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
