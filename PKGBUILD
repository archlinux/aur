# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: David Mougey <imapiekindaguy at gmail dot com>

# Set this variable to anything to disable translations.
# Or specify the two-letter language code of the translation you wish to keep.
_localepurge=

pkgname=sigil-git
pkgname_="${pkgname%-git}"
pkgver=1.9.10.r31.g036cd7b27
pkgrel=1
pkgdesc='multi-platform EPUB2/EPUB3 ebook editor'
arch=('x86_64')
url="https://github.com/Sigil-Ebook/Sigil"
license=('GPL3')
depends=(
    hicolor-icon-theme
    hunspell
    mathjax2
    minizip
    python-css-parser
    python-dulwich
    python-lxml
    qt5-svg
    qt5-webengine
    )
makedepends=(
    cmake
    qt5-tools
    )
optdepends=(
    'hunspell-en_US: for English dictionary support'
    'hyphen-en: for English hyphenation support in plugins'
    'pageedit: external editor to replace BookView'
    'python-chardet: recommended for plugins'
    'python-cssselect: recommended for plugins'
    'python-html5lib: recommended for plugins'
    'python-pillow: recommended for plugins'
    'python-pyqt5: recommended for plugins'
    'python-pyqt5-webengine: recommended for plugins'
    'python-regex: recommended for plugins'
    'tk: recommended for plugins'
    )
provides=("${pkgname_}")
conflicts=("${pkgname_}")
source=(
    "${pkgname}"::"git+${url}"
    default_nav_css.patch
    skip_ver_mod_tags.patch
    skip_version_check.patch
    )
sha256sums=(
    'SKIP'
    '298928226e4e5cf9d2cf5298d2fe8c87357b92c8962c09c0683bc9af4ed9516c'
    '9414dfd43a18d83f82c099838faca1bba8e70fe9e66e5691e652345c5d2286ab'
    'ad10e067885809f0fab8aebcbc907f317ad7a43251d1cf9ffd0802dfb77cc540'
)

prepare() {
    cd "${srcdir}/${pkgname}"

    patch -p1 < "${srcdir}/default_nav_css.patch"
    patch -p1 < "${srcdir}/skip_ver_mod_tags.patch"
    patch -p1 < "${srcdir}/skip_version_check.patch"

    if [[ "${_localepurge}" != "" ]]; then
        for trans in src/Resource_Files/ts/*; do
            if [[ "$(basename $trans | sed -r 's/(_.*)_.*/\1/g')" != "sigil_${_localepurge}" ]]; then
                rm $trans
            fi
        done
    fi
}

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    mkdir -p "${srcdir}/${pkgname}/build"
    cd "${srcdir}/${pkgname}/build"

    cmake -G "Unix Makefiles" \
        -DUSE_SYSTEM_LIBS=1 \
        -DSYSTEM_LIBS_REQUIRED=1 \
        -DINSTALL_BUNDLED_DICTS=0 \
        -DINSTALL_HICOLOR_ICONS=1 \
        -DDISABLE_UPDATE_CHECK=1 \
        -DMATHJAX_DIR=/usr/share/mathjax2 \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_C_FLAGS:STRING="$CFLAGS" \
        -DCMAKE_CXX_FLAGS:STRING="$CXXFLAGS" \
        -DCMAKE_SKIP_RPATH=ON ..
    make
}

package() {
    cd "${srcdir}/${pkgname}/build"
    make install DESTDIR="${pkgdir}"

    # Compile python bytecode
    python -m compileall "$pkgdir/usr/share/sigil/"{plugin_launchers/python/,python3lib}
    python -O -m compileall "$pkgdir/usr/share/sigil/"{plugin_launchers/python/,python3lib}
}
