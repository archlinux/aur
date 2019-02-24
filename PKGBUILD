# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: David Mougey <imapiekindaguy at gmail dot com>

# All my PKGBUILDs are managed at https://github.com/eli-schwartz/pkgbuilds

# Set this variable to anything to disable translations.
# Or specify the two-letter language code of the translation you wish to keep.
_localepurge=

pkgname=sigil-git
pkgver=0.9.12.r5.g61d2703a
pkgrel=1
pkgdesc="A WYSIWYG ebook editor"
arch=('i686' 'x86_64')
url="https://github.com/Sigil-Ebook/Sigil"
license=('GPL3')
depends=('hunspell' 'minizip' 'mathjax' 'python-css-parser' 'python-lxml' 'python-six'
         'qt5-webkit' 'qt5-xmlpatterns')
makedepends=('git' 'qt5-tools' 'qt5-svg' 'cmake')
optdepends=('hunspell-en: for English dictionary support'
            'hyphen-en: for English hyphenation support in plugins'
            'python-html5lib: recommended for plugins'
            'python-chardet: recommended for plugins'
            'python-cssselect: recommended for plugins'
            'python-pillow: recommended for plugins'
            'python-regex: recommended for plugins'
            'python-pyqt5: recommended for plugins'
            'tk: recommended for plugins')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}"::"git+${url}")
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}/${pkgname%-git}"

    # devendor css_parser as it's a direct copy of the external package;
    # upstream maintains both and plans to switch soon
    rm -r src/Resource_Files/plugin_launchers/python/css_parser/

    if [[ "${_localepurge}" != "" ]]; then
        for trans in src/Resource_Files/ts/*; do
            if [[ "$(basename $trans | sed -r 's/(_.*)_.*/\1/g')" != "sigil_${_localepurge}" ]]; then
                rm $trans
            fi
        done
    fi
}

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    mkdir -p "${srcdir}/${pkgname%-git}/build"
    cd "${srcdir}/${pkgname%-git}/build"

    cmake -G "Unix Makefiles" \
        -DUSE_SYSTEM_LIBS=1 \
        -DSYSTEM_LIBS_REQUIRED=1 \
        -DINSTALL_BUNDLED_DICTS=0 \
        -DMATHJAX_DIR=/usr/share/mathjax \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
        -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
        -DCMAKE_SKIP_RPATH=ON ..
    make
}

package() {
    cd "${srcdir}/${pkgname%-git}/build"
    make install DESTDIR="${pkgdir}"

    for _pic in 16 32 48 128 256; do
        install -D -m 0644 ../src/Resource_Files/icon/app_icon_${_pic}.png \
            "${pkgdir}"/usr/share/icons/hicolor/${_pic}x${_pic}/apps/sigil.png
    done

    # Compile python bytecode
    python -m compileall "${pkgdir}"/usr/share/sigil/{plugin_launchers/python/,python3lib}
    python -O -m compileall "${pkgdir}"/usr/share/sigil/{plugin_launchers/python/,python3lib}
}
