# Maintainer: SCDevel <root@scdevel.net>

pkgname=imrad-git
pkgver=r560.gcc85b51
pkgrel=1
pkgdesc="GUI builder for Dear ImGui"
arch=('x86_64')
url="https://github.com/tpecholt/imrad"
license=('GPL-3.0-only')

depends=(
    'gtk3'
    'openssl'
    'zlib'
)

makedepends=(
    'git'
    'cmake'
    'ninja'
)

source=(
    "git+https://github.com/tpecholt/imrad.git"
    "imrad.desktop"
)

sha256sums=(
    'SKIP'
    '9a705251d5d6c2d8ddbd62e6b49ccb929d5db93a327dfc224413e30ea60607cb'
)

pkgver() {
    cd "$srcdir/imrad"

    printf "r%s.g%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$srcdir/imrad"

    git submodule update --init --recursive
}

build() {
    cd "$srcdir/imrad"

    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="$srcdir/install"

    cmake --build build
    cmake --install build
}

package() {
    cd "$srcdir/imrad"

    install -Dm755 \
        "$srcdir/install/latest/imrad" \
        "$pkgdir/usr/lib/imrad/imrad"

    cp -a \
        "$srcdir/install/latest/style" \
        "$pkgdir/usr/lib/imrad/"

    cp -a \
        "$srcdir/install/latest/template" \
        "$pkgdir/usr/lib/imrad/"

    install -d "$pkgdir/usr/bin"
    ln -s /usr/lib/imrad/imrad "$pkgdir/usr/bin/imrad"

    install -Dm644 \
        "$srcdir/install/latest/CHANGELOG.md" \
        "$pkgdir/usr/share/doc/imrad/CHANGELOG.md"

    install -Dm644 \
        "$srcdir/imrad/LICENSE" \
        "$pkgdir/usr/share/licenses/imrad/LICENSE"

    install -Dm644 \
        "$srcdir/imrad/src/icon.png" \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/imrad.png"

    install -Dm644 \
        "$srcdir/imrad.desktop" \
        "$pkgdir/usr/share/applications/imrad.desktop"
}
