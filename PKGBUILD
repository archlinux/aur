# Maintainer: Jay Chu <tothesong at gmail dot com>
# Maintainer: Grafcube <grafcube at disroot dot org>

_anki=anki
_aqt=aqt
_py=cp39

pkgname=anki-bin
pkgver=2.1.57
pkgrel=1
pkgdesc='Helps you remember facts (like words/phrases in a foreign language) efficiently.
Installed with wheel.'
arch=('x86_64')
url='https://apps.ankiweb.net/'
license=('AGPL3')
depends=(
	# anki and aqt
	'python-beautifulsoup4'
	'python-requests'

	# aqt
	'python-flask'
	'python-flask-cors'
	'python-jsonschema'
	'python-pyqt6'
	'python-pyqt6-webengine'
	'python-send2trash'
	'python-waitress'

	# anki
	'python-decorator'
	'python-distro'
	'python-markdown'
	'python-orjson'
	'python-protobuf'

	# requests
	'python-pysocks'

	# workaround
	'python-certifi'
)
makedepends=(
	'python-installer'
)
optdepends=(
	'lame: record sound'
	'mpv: play sound. prefered over mplayer'
	'mplayer: play sound'
)
provides=(anki=$pkgver)
conflicts=(anki)
_anki_whl="$_anki-$pkgver-$_py-abi3-manylinux_2_28_$arch.whl"
_aqt_whl="$_aqt-$pkgver-py3-none-any.whl"
source=(
	"https://files.pythonhosted.org/packages/$_py/${_anki::1}/$_anki/$_anki_whl"
	"https://files.pythonhosted.org/packages/py3/${_aqt::1}/$_aqt/$_aqt_whl"
	"runanki-$pkgver.py::https://raw.githubusercontent.com/ankitects/anki/$pkgver/qt/runanki.py"
	"anki-$pkgver.desktop::https://raw.githubusercontent.com/ankitects/anki/$pkgver/qt/bundle/lin/anki.desktop"
	"anki-$pkgver.png::https://raw.githubusercontent.com/ankitects/anki/$pkgver/qt/bundle/lin/anki.png"
)
noextract=("${source[@]##*/}")
sha256sums=(
	'28c5354de3c03b378cbc5e11220c57798822cd84ea06a0fc6662e49b63965685'
	'ae8a5d5bbeffa228f76df8c6e8121b79aeab20745b1953c0f0e3106324d6e36b'
	'9648e7e915f51f08e05c48ef5f39b4015922fe1cf3d7f2895535ef10ef4507ae'
	'53db2e5bfeb00aa249667e09466a34bfacb17b61097875a8cdd93ee1a9380b9a'
	'97ad2134ef1a7686789c7becd8bd05dd8693cf0d3127951ca6ba7b29a80b402a'
)

package() {
	python -m installer --destdir="$pkgdir" $_anki_whl
	python -m installer --destdir="$pkgdir" $_aqt_whl

	install -Dm755 runanki-$pkgver.py "$pkgdir/usr/bin/anki"
	install -Dm644 anki-$pkgver.desktop "$pkgdir/usr/share/applications/anki.desktop"
	install -Dm644 anki-$pkgver.png "$pkgdir/usr/share/pixmaps/anki.png"
}
