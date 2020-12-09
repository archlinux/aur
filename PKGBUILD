# Maintainer: Martin Dünkelmann<nc-duenkekl3@netcologne.de>
# Contributor: Shaoyu Tseng<zandimna@autistici.org>
# Contributor: Daniel Egeberg <daniel.egeberg@gmail.com
# Contributor: Sławomir Kowalski <suawekk+aur@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Timm Preetz <timm@preetz.us>
# Contributor: Michael 'manveru' Fellinger <m.fellinger@gmail.com>
# Contributor: Dave Pretty <david dot pretty at gmail dot com>

pkgname=anki-git
pkgver=r5491.c505894b8
pkgrel=2
pkgdesc="Helps you remember facts (like words/phrases in a foreign language) efficiently"
url="http://ankisrs.net/"
license=('AGPL3')
arch=('any')
provides=('anki')
conflicts=('anki' 'anki20' 'anki-official-binary-bundle')
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
    'git'
    'rsync'

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
source=(
    $pkgname::git+https://github.com/dae/anki.git

    #ankitects-anki-core-i18n-master.tar.gz::https://github.com/ankitects/anki-core-i18n/tarball/master
    #ankitects-anki-desktop-ftl-master.tar.gz::https://github.com/ankitects/anki-desktop-ftl/tarball/master
    #ankitects-anki-desktop-i18n-master.tar.gz::https://github.com/ankitects/anki-desktop-i18n/tarball/master

    #0001-Move-aqt_data-to-sys.prefix-share.patch
    #0002-Remove-bad-build-steps-from-makefiles.patch
    #0003-Compile-.py-s-before-building-wheel.patch
    0004-Disable-auto-updates.patch
    #0005-Make-pyenv-target-just-create-venv.patch
)
sha512sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"
    #patch -p1 <"$srcdir"/0001-Move-aqt_data-to-sys.prefix-share.patch
    #patch -p1 <"$srcdir"/0002-Remove-bad-build-steps-from-makefiles.patch
    #patch -p1 <"$srcdir"/0003-Compile-.py-s-before-building-wheel.patch
    patch -p1 <"$srcdir"/0004-Disable-auto-updates.patch
    #patch -p1 <"$srcdir"/0005-Make-pyenv-target-just-create-venv.patch

    # Put translations in place.
    #ln -sf "$srcdir"/ankitects-anki-core-i18n-*/ rslib/ftl/repo
    #ln -sf "$srcdir"/ankitects-anki-desktop-ftl-*/ qt/ftl/repo
    #ln -sf "$srcdir"/ankitects-anki-desktop-i18n-*/ qt/po/repo
}

build() {
    cd "$pkgname"
    # Built into the shared libraries so that the Python component can check
    # that it has the same value.
    #echo arch-linux-$pkgver-$pkgrel > meta/buildhash

    # Installs development modules in venv, which is required by scripts used
    # by various make targets.  The dependencies between targets are completely broken.
    #make develop

    #make build

    export CC=/usr/bin/clang
    export CXX=/usr/bin/clang++
    bazel build -c opt //pylib/anki:wheel
    bazel build -c opt //qt/aqt:wheel
}

package() {
    cd "$pkgname"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps bazel-bin/pylib/anki/anki-*.whl bazel-bin/qt/aqt/aqt-*.whl

    install -Dm755 qt/runanki "$pkgdir"/usr/bin/anki
    install -Dm644 qt/anki.desktop "$pkgdir"/usr/share/applications/anki.desktop
    install -Dm644 qt/anki.png "$pkgdir"/usr/share/pixmaps/anki.png
}
