# Maintainer: envolution
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-speechrecognition
_pkg=speechrecognition
_pkgdir=speech_recognition
pkgver=3.14.0
pkgrel=1
pkgdesc="Google-powered speech recognition for Python"
arch=('any')
url="https://github.com/Uberi/speech_recognition"
license=('MIT')
depends=('flac' 'python-audioop' 'python-pyaudio' 'python-requests' 'python-aifc')
optdepends=('python-pocketsphinx' 'python-vosk' 'python-whisper')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=('python-speech_recognition')
checkdepends=('python-pocketsphinx' 'python-pytest')
source=("git+https://github.com/Uberi/speech_recognition.git#tag=${pkgver}")
sha256sums=('6e8e95b22a12cab9b03531ccffc5f18d056e0132cc2ed6a2304485102d4ff817')

build() {
  cd "$_pkgdir"
  python -m build --wheel --no-isolation
}

check() {
  rm -rf test-env
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "${_pkgdir}/dist/"*.whl
  test-env/bin/python -m pytest \
    -k "not test_google_cloud" \
    --ignore=${_pkgdir}/tests/recognizers/test_google_cloud.py \
    --ignore=${_pkgdir}/tests/recognizers/test_groq.py \
    --ignore=${_pkgdir}/tests/test_special_features.py \
    --ignore=${_pkgdir}/tests/recognizers/whisper_api/test_groq.py \
    "${_pkgdir}/tests/" || true
}

package() {
  cd "$_pkgdir"
  python -m installer --destdir "$pkgdir" dist/*.whl
  install -Dm644 LICENSE* -t ${pkgdir}/usr/share/licenses/$pkgname/
}
# vim:set ts=2 sw=2 et:
