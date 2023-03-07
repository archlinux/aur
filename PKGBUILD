# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-speechrecognition
_pkg=SpeechRecognition
pkgver=3.9.0
pkgrel=1
pkgdesc="Google-powered speech recognition for Python"
arch=('any')
url="https://github.com/Uberi/speech_recognition"
license=('MIT')
depends=('flac' 'python-pyaudio' 'python-requests')
optdepends=('pocketsphinx' 'python-vosk' 'python-whisper')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=('python-speech_recognition')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('a2f992acda6314a3fa574bf84c2e075ce75f2b4c143b4435d7cbc98f66565ee7')

prepare() {
	cd "$_pkg-$pkgver"
	sed -i '18,37d;44d' setup.py
	rm speech_recognition/flac-*
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$_pkg-$pkgver.dist-info/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
