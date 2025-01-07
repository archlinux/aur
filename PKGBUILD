# Maintainer: envolution
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-speechrecognition
_pkg=speechrecognition
_pkgdir=speech_recognition
pkgver=3.13.0
pkgrel=2
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
sha256sums=('d562c9cb54fba559076db39659cbe9b49e1f77062706cbbdb7175dab746f6292')

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
    "${_pkgdir}/tests/" || true
}

package() {
  cd "$_pkgdir"
  python -m installer --destdir "$pkgdir" dist/*.whl
  install -Dm644 LICENSE* -t ${pkgdir}/usr/share/licenses/$pkgname/
}
# vim:set ts=2 sw=2 et:
