# Maintainer: Alexander Bocken <alexander@bocken.org>

pkgname=anki-release-source
pkgver=2.1.49
pkgrel=2
pkgdesc="Helps you remember facts efficiently. Latest release building locally"
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

    'bazel'
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
sha256sums=('0a072f9a2babdde67b233104c73450e297c7feff41e0a43b76dd590bafcef5d5'
'137827586d2a72adddaaf98599afa9fc80cdd73492d7f5cbcf4d2f6082e5f797'
)

prepare(){
    cd "anki-$pkgver"
    # pro-actively prevent "module not found" error
    [ -d ts/node_modules ] && rm -r ts/node_modules
    patch -p1 < "$srcdir/no-update.patch"
    rm .bazelversion
}

build() {
    cd "anki-$pkgver"
    export CC=/usr/bin/clang
    export CXX=/usr/bin/clang++
    env PATH="/usr/lib/jvm/java-11-openjdk/bin/:$PATH" bazel build -c opt dist
}

package() {
    cd "anki-$pkgver"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps bazel-bin/pylib/anki/anki-*.whl bazel-bin/qt/aqt/aqt-*.whl

    install -Dm755 qt/runanki.py "$pkgdir"/usr/bin/anki
    install -Dm644 qt/linux/anki.desktop "$pkgdir"/usr/share/applications/anki.desktop
    install -Dm644 qt/linux/anki.png "$pkgdir"/usr/share/pixmaps/anki.png
}
