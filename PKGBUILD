# Maintainer: Jan Cholasta <grubber at grubber cz>

_name=slade
pkgname=${_name}
pkgver=3.1.1.5
pkgrel=1
pkgdesc='SLADE3 Doom editor'
arch=('i686' 'x86_64')
url='http://slade.mancubus.net/'
license=('GPL')
depends=('bzip2'
         'desktop-file-utils'
         'fluidsynth'
         'freeimage'
         'freetype2'
         'ftgl'
         'glew'
         'gtk2'
         'libgl'
         'sfml'
         'wxgtk>=3.0'
         'xdg-utils'
         'zlib')
makedepends=('cmake'
             'imagemagick'
             'zip')
install='install'
source=("https://github.com/sirjuddington/SLADE/archive/${pkgver}.tar.gz"
        "${_name}.desktop")
_srcsubdir="SLADE-${pkgver}"
sha256sums=('1b1c9e8267d8749f6087297ec629d1ca81777bb1b74e51853508a570e4368e2a'
            'e69d6e0da523c5d649bd51316fa827175b5858cb91b4ad311b2f0d0dedd8b9bb')

prepare() {
    cd "${_srcsubdir}"

    cmake -DCMAKE_CXX_FLAGS=-DNDEBUG \
          -DCMAKE_INSTALL_PREFIX=/usr \
          .
}

build() {
    cd "${_srcsubdir}"

    make

    mkdir -p 'icons'
    convert 'dist/res/slade.ico[0]' 'icons/128.png'
    convert 'dist/res/slade.ico[1]' 'icons/16.png'
    convert 'dist/res/slade.ico[2]' 'icons/24.png'
    convert 'dist/res/slade.ico[3]' 'icons/256.png'
    convert 'dist/res/slade.ico[4]' 'icons/32.png'
    convert 'dist/res/slade.ico[5]' 'icons/40.png'
    convert 'dist/res/slade.ico[6]' 'icons/48.png'
    convert 'dist/res/slade.ico[7]' 'icons/64.png'
}

package() {
    cd "${_srcsubdir}"

    make install DESTDIR="${pkgdir}"

    desktop-file-install --dir="${pkgdir}/usr/share/applications" \
                         "${srcdir}/${_name}.desktop"

    mkdir -p "${pkgdir}/usr/share/icons/hicolor"
    (
        cd 'icons'
        export XDG_DATA_DIRS="${pkgdir}/usr/share"

        local _file
        for _file in *.png; do
            xdg-icon-resource install --noupdate \
                                      --novendor \
                                      --size "${_file%.png}" \
                                      "${_file}" \
                                      "${_name}"
        done
    )
}
