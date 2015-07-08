# Mantainer: Adria Arrufat <swiftscythe@gmail.com>
# Contributor: Ike Devolder <ike.devolder@gmail.com>
# Contributor: Daniel Hill <daniel.hill@orcon.net.nz>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=clementine-git
pkgver=1.2.3.1109.g7cd4a56
pkgrel=1
pkgdesc="A modern music player and library organiser and a port of Amarok 1.4, with some features rewritten to take advantage of Qt4."
arch=('i686' 'x86_64')
license=('GPL')
depends=('gst-plugins-base' 'taglib' 'glew' 'liblastfm' 'libgpod'
    'libmtp' 'libplist' 'hicolor-icon-theme' 'qt4' 'sparsehash' 'libechonest'
    'qjson' 'libcdio' 'protobuf' 'crypto++' 'chromaprint' 'libmygpo-qt')
optdepends=('gst-plugins-good: for use with "Good" plugin libraries'
            'gst-plugins-bad: for use with "Bad" plugin libraries'
            'gst-plugins-ugly: for use with "Ugly" plugin libraries'
)
makedepends=('git' 'boost' 'cmake' 'mesa')
install=clementine.install
# Uncomment next lines to enable more features
#makedepends+=('libspotify' 'libgpod' 'libimobiledevice')
#optdepends+=(
#'libspotify: for Spotify support'
#'libgpod: for iPod support'
#'libimobiledevice: for iPhone and iPod Touch support'
#)

url="http://www.clementine-player.org/"
source=('git+https://github.com/clementine-player/Clementine.git')
sha256sums=('SKIP')

provides=('clementine')
conflicts=('clementine')
replaces=('clementine')


pkgver() {
    cd Clementine
    git describe | sed 's/^v//;s/-/./g;s/_/./g;'
}

prepare() {
    echo "Patching sources"
    sed -i 's/crypto++/cryptopp/g' ${srcdir}/Clementine/src/internet/spotify/spotifyblobdownloader.cpp
}

build() {
    #  rm -rf build
    mkdir -p build
    cd build

    cmake "../Clementine" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DENABLE_VISUALISATIONS=OFF \
        -DENABLE_SPOTIFY_BLOB=OFF \
        -DENABLE_SKYDRIVE=OFF \
        -DENABLE_GOOGLE_DRIVE=OFF \
        -DENABLE_DROPBOX=OFF \
        -DENABLE_UBUNTU_ONE=OFF \
        -DENABLE_LIBGPOD=OFF \
        -DENABLE_WIIMOTEDEV=OFF \
        -DENABLE_SPARKLE=OFF \
        -DENABLE_LIBMTP=OFF \
        -DENABLE_GIO=ON \
        -DENABLE_BOX=OFF \
        -DLINGUAS="en"
# -DENABLE_xxxx
# - force their inclusion with =ON  - this could trigger an error for
#   unlisted dependencies in depends=()
# - remove them to get auto-detected - this could include (without notice)
#   packages not listed in depends=()

# -DCMAKE_BUILD_TYPE remove to get  a debug build with symbols
# -DLINGUAS remove for all translations or put in  a space-separated list
#  of translations to be included, eg. ="en es"
# Qt doesn't respect LC_xxx settings... which is really annoying!
make 
}

package(){
    cd build
    make DESTDIR=${pkgdir} install
}
