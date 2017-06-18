# Maintainer: Jan Cholasta <grubber at grubber cz>

_name=slade
pkgname=${_name}
pkgver=3.1.2_b2
pkgrel=2
pkgdesc='SLADE3 Doom editor'
arch=('i686' 'x86_64')
url='http://slade.mancubus.net/'
license=('GPL')
depends=('bzip2'
         'curl'
         'desktop-file-utils'
         'fluidsynth'
         'freeimage'
         'freetype2'
         'ftgl'
         'glew'
         'gtk2'
         'libgl'
         'sfml>=2.4'
         'sfml<2.5'
         'webkitgtk2'
         'wxgtk2>=3.0'
         'zlib')
makedepends=('cmake'
             'imagemagick'
             'p7zip')
source=("https://github.com/sirjuddington/SLADE/archive/${pkgver}.tar.gz"
        "${_name}.desktop")
sha256sums=('7b473853acbddfc03b1821ebec13e61f0caf26a6718f88bc4136989df15f853c'
            'e69d6e0da523c5d649bd51316fa827175b5858cb91b4ad311b2f0d0dedd8b9bb')

build() {
    cd SLADE-${pkgver}

    cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr \
          .
    make

    convert dist/res/slade.ico'[0]' ${_name}-128.png
    convert dist/res/slade.ico'[1]' ${_name}-16.png
    convert dist/res/slade.ico'[2]' ${_name}-24.png
    convert dist/res/slade.ico'[3]' ${_name}-256.png
    convert dist/res/slade.ico'[4]' ${_name}-32.png
    convert dist/res/slade.ico'[5]' ${_name}-40.png
    convert dist/res/slade.ico'[6]' ${_name}-48.png
    convert dist/res/slade.ico'[7]' ${_name}-64.png
}

package() {
    cd SLADE-${pkgver}

    make install DESTDIR="$pkgdir"

    desktop-file-install --dir="$pkgdir"/usr/share/applications \
                         "$srcdir"/${_name}.desktop

    local _size
    for _size in 16 24 32 40 48 64 128 256; do
        install -D -m644 \
                ${_name}-${_size}.png \
                "$pkgdir"/usr/share/icons/hicolor/${_size}x${_size}/apps/${_name}.png
    done
}
