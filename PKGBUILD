# Maintainer: Alexander Bocken <alexander@bocken.org>

# Contributor: Posi <posi1981@gmail.com>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Timm Preetz <timm@preetz.us>
# Contributor: Michael 'manveru' Fellinger <m.fellinger@gmail.com>
# Contributor: Dave Pretty <david dot pretty at gmail dot com>

pkgname=anki-qt5
pkgver=2.1.55
pkgrel=2
pkgdesc="Helps you remember facts (like words/phrases in a foreign language) - Qt5 Build"
url="https://apps.ankiweb.net/"
license=('AGPL3')
arch=('x86_64')
provides=('anki')
conflicts=('anki' 'anki-bin' 'anki-git' 'anki-official-binary-bundle')
options=('!ccache')
depends=(
    # anki & aqt
    'python-beautifulsoup4'
    'python-flask'
    'python-waitress'

    # anki
    'python-decorator'
    'python-markdown'
    'python-orjson'
    'python-protobuf'
    'python-pysocks'
    'python-distro'

    #aqt
    'python-flask-cors'
    'python-jsonschema'
    'python-requests'
    'python-send2trash'
    'python-flask'
    'python-flask-cors'
    'python-waitress'
    'python-pyqt5'
)
makedepends=(
    'rsync'
    'git'

    'ninja'
    'python-installer'
    'libxcrypt-compat'
)
optdepends=(
    'lame: record sound'
    'mpv: play sound. prefered over mplayer'
    'mplayer: play sound'
)
source=("anki-${pkgver}::git+https://github.com/ankitects/anki#tag=${pkgver}"
"no-update.patch"
"force_qt5.patch"
)
sha256sums=('SKIP'
'137827586d2a72adddaaf98599afa9fc80cdd73492d7f5cbcf4d2f6082e5f797'
'c5e6e1b2ed7999e9ef7f855aed4c97c4ace846237421507f408a64a8258a09fd'
)


prepare(){
    cd "anki-$pkgver"
    # pro-actively prevent "module not found" error
    [ -d ts/node_modules ] && rm -r ts/node_modules
    patch -p1 < "$srcdir/no-update.patch"
    patch -p1 < "$srcdir/force_qt5.patch"
}

build() {
    cd "anki-$pkgver"
    ./tools/build
}

package() {
    cd "anki-$pkgver"

    for file in out/wheels/*.whl; do
    	python -m installer --destdir="$pkgdir" $file
    done

    find $pkgdir -iname __pycache__ | xargs -r rm -rf
    find $pkgdir -iname direct_url.json | xargs -r rm -rf
}
