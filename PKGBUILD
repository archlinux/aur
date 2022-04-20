# Maintainer: Alexander Bocken <alexander@bocken.org>

# Contributor: Posi <posi1981@gmail.com>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Timm Preetz <timm@preetz.us>
# Contributor: Michael 'manveru' Fellinger <m.fellinger@gmail.com>
# Contributor: Dave Pretty <david dot pretty at gmail dot com>

pkgname=anki
pkgver=2.1.50
pkgrel=1
pkgdesc="Helps you remember facts (like words/phrases in a foreign language) efficiently"
url="https://apps.ankiweb.net/"
license=('AGPL3')
arch=('x86_64')
provides=('anki')
conflicts=('anki-bin' 'anki-git' 'anki-official-binary-bundle')
options=('!ccache')
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
    'python-pip'
)
optdepends=(
    'lame: record sound'
    'mpv: play sound. prefered over mplayer'
    'mplayer: play sound'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/ankitects/anki/archive/refs/tags/${pkgver}.tar.gz"
"no-update.patch"
"inc_timeout_time.patch"
)
sha256sums=('2d36d54ce1ec70b615fc889ccac3726e6b8221819afb05b614dc6150d5d04a4c'
'137827586d2a72adddaaf98599afa9fc80cdd73492d7f5cbcf4d2f6082e5f797'
'281e12217f6b60ff64ad66e58aaf0cdb8bed16ffe2a3e6ab9e6ff5e773b4cabf'
)

prepare(){
    cd "anki-$pkgver"
    # pro-actively prevent "module not found" error
    [ -d ts/node_modules ] && rm -r ts/node_modules
    patch -p1 < "$srcdir/no-update.patch"
    patch -p1 < "$srcdir/inc_timeout_time.patch"
    rm .bazelversion
}

build() {
    cd "anki-$pkgver"
    #fixes linker for clang users
    if [ "$CC" = clang ] && [ "$CXX" = 'clang++' ]; then
        export LDSHARED="/usr/bin/clang -shared"
    fi
    # build requires java 11 to work, does not compile with java 17
    export JAVA_HOME="/usr/lib/jvm/java-11-openjdk"
    bazel build -c opt wheels
}

package() {
    cd "anki-$pkgver"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps .bazel/out/k8-opt/bin/qt/aqt/aqt-*.whl .bazel/out/k8-opt/bin/pylib/anki/anki-*.whl

    install -Dm755 qt/runanki.py "$pkgdir"/usr/bin/anki
    install -Dm644 qt/bundle/lin/anki.desktop "$pkgdir"/usr/share/applications/anki.desktop
    install -Dm644 qt/bundle/lin/anki.png "$pkgdir"/usr/share/pixmaps/anki.png
    find $pkgdir -iname __pycache__ | xargs -r rm -rf
    find $pkgdir -iname direct_url.json | xargs -r rm -rf
}
