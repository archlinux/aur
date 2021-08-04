# Maintainer: Alexander Bocken <alexander@bocken.org>

pkgname=anki-release-source
pkgver=2.1.46
pkgrel=1
pkgdesc="The latest release building from source locally"
url="https://apps.ankiweb.net/"
license=('AGPL3')
arch=('x86_64')
provides=('anki')
conflicts=('anki' 'anki20' 'anki-git' 'anki-official-binary-bundle')
depends=(
    # anki and aqt
    'python-beautifulsoup4'
    'python-requests'
    'python-wheel'

    # anki
    'python-pysocks' # requests[socks]
    'python-decorator'
    'python-protobuf'
    'python-orjson'
    'python-distro'
    'python-stringcase'

    # aqt
    'python-send2trash'
    'python-markdown'
    'python-jsonschema'
    'python-pyaudio'
    'python-pyqtwebengine'
    'python-flask'
    'python-flask-cors'
    'python-waitress'
    'python-pyqt5'
)
makedepends=(
    'rsync'
    'git'

    'bazel40-bin'
    'clang'

    'maturin'
    'rust'

    'python-pip'
    'python-mypy-protobuf'
    'npm'
    'typescript'
)
optdepends=(
    'lame: record sound'
    'mpv: play sound. prefered over mplayer'
    'mplayer: play sound'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/ankitects/anki/archive/refs/tags/${pkgver}.tar.gz"
"no-update.patch"
)
sha256sums=('4b3113510804475020196071271e2c19984506c5c8a5e86049eac19feb2827cf'
'137827586d2a72adddaaf98599afa9fc80cdd73492d7f5cbcf4d2f6082e5f797'
)

prepare(){
    cd "anki-$pkgver"
    patch -p1 < "$srcdir/no-update.patch"
}

build() {
    cd "anki-$pkgver"
    export CC=/usr/bin/clang
    export CXX=/usr/bin/clang++
    bazel build -c opt dist
}

package() {
    cd "anki-$pkgver"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps bazel-bin/pylib/anki/anki-*.whl bazel-bin/qt/aqt/aqt-*.whl

    install -Dm755 qt/runanki.py "$pkgdir"/usr/bin/anki
    install -Dm644 qt/linux/anki.desktop "$pkgdir"/usr/share/applications/anki.desktop
    install -Dm644 qt/linux/anki.png "$pkgdir"/usr/share/pixmaps/anki.png
}
