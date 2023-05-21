# Maintainer: Alexander Bocken <alexander@bocken.org>
# Contributor: Posi <posi1981@gmail.com>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Timm Preetz <timm@preetz.us>
# Contributor: Michael 'manveru' Fellinger <m.fellinger@gmail.com>
# Contributor: Dave Pretty <david dot pretty at gmail dot com>

pkgname=anki-qt5
pkgver=2.1.63
_tag=064ea0ee08715edae868b84e48b29bd7e15d7b49 #git rev-parse $pkgver
pkgrel=2
pkgdesc="Helps you remember facts (like words/phrases in a foreign language) - Qt5 Build"
url="https://apps.ankiweb.net/"
license=('AGPL3')
arch=('x86_64')
provides=('anki')
conflicts=('anki' 'anki-bin' 'anki-git' 'anki-official-binary-bundle')
depends=(
    # anki & aqt
    'python>=3.9'
    'python-beautifulsoup4'
    'python-waitress>=2.0.0'
    'python-requests'

    # anki
    'python-decorator'
    'python-markdown'
    'python-orjson'
    'python-protobuf>=4.21'
    'python-pysocks'
    'python-distro'

    #aqt
    'python-flask-cors' # python-flask required for anki & aqt but a dependency of -cors
    'python-jsonschema'
    'python-send2trash'
    'python-certifi'
    'python-pyqt5>=5.14'
    'qt5-svg'
)

makedepends=(
    'rsync'
    'git'
    'ninja'
    'cargo'
    'python-installer'
    'libxcrypt-compat'
    'nodejs'
    'yarn'
    'mold'
)
optdepends=(
    'lame: record sound'
    'mpv: play sound. prefered over mplayer'
    'mplayer: play sound'
    'texlive-most: render LaTex in cards'
)

# using the tag tarballs does not work with the new (>= 2.1.55) build process.
# the '.git' folder is not included in those but is required for a sucessful build
source=("$pkgname::git+https://github.com/ankitects/anki#tag=${_tag}?signed"
"no-update.patch"
"optimize_more.patch"
"force_qt5.patch"
)
sha256sums=('SKIP'
'f934553a5ce9e046a0b8253e10da16e661b27375e2b54d6bb915267f32aff807'
'213a7c6ab75dc332e79f089364f10bc7fe0c0bb6860a549a42b7e3d75970bc7d'
'c5e6e1b2ed7999e9ef7f855aed4c97c4ace846237421507f408a64a8258a09fd'
)

validpgpkeys=(
   814EA4E90C34AF39A712DE703F5566A2D16899FB # Anki Signatures <gpg@ankiweb.net>
)

prepare(){
    cd "$pkgname"
    # pro-actively prevent "module not found" error
    [ -d ts/node_modules ] && rm -r ts/node_modules
    patch -p1 < "$srcdir/force_qt5.patch"
    patch -p1 < "$srcdir/no-update.patch"
    patch -p1 < "$srcdir/optimize_more.patch"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname"
    #use local binaries instead of downloading them
    export PYTHON_BINARY=$(which python)
    export PROTOC_BINARY=$(which protoc)
    export NODE_BINARY=$(which node)
    export YARN_BINARY=$(which yarn)

    export RELEASE=1
    mold -run ./ninja wheels # use mold as linker to allow for LTO
}

pkgver(){
	cd "$pkgname"
	git describe
}

package() {
    cd "$pkgname"
    for file in out/wheels/*.whl; do
    	python -m installer --destdir="$pkgdir" $file
    done

    install -Dm644 qt/bundle/lin/anki.desktop "$pkgdir"/usr/share/applications/anki.desktop
    install -Dm644 qt/bundle/lin/anki.png "$pkgdir"/usr/share/pixmaps/anki.png
    # TODO: verify whether still required
    find $pkgdir -iname __pycache__ | xargs -r rm -rf
    find $pkgdir -iname direct_url.json | xargs -r rm -rf
}
