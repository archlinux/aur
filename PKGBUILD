# Mantainer: Aleksandr <contact at via dot aur>
# Contributor: Tim Wanders <tim241 at mailbox dot org>
# Contributor: AdriÃƒÂ¡n Chaves FernÃƒÂ¡ndez, aka Gallaecio <adriyetichaves@gmail.com>

pkgname=speed-dreams-svn
pkgver=r7269
pkgrel=2
pkgdesc="Speed Dreams is a fork of TORCS which aims to implement exciting new features, improving visual and physics realism."
arch=('i686' 'x86_64')
url="http://speed-dreams.sourceforge.net/"
license=('GPL2')
depends=('freealut' 'freeglut' 'libpng' 'libxi' 'libxmu' 'libxrandr' 'plib>=1.8.3' 'libjpeg' 'zlib' 'enet' 'openscenegraph' 'sdl2_mixer')
makedepends=('cmake' 'svn')
provides=("${pkgname%-svn}")
conflicts=("${pkgname%-svn}" 'speed-dreams-git')
source=("${pkgname%-svn}.desktop"
        "${pkgname%-svn}::svn+https://svn.code.sf.net/p/speed-dreams/code/trunk")

md5sums=('ae5f7bd147981323414e1c5b859cdd83'
         'SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-svn}"

    printf "r%s" "$(svnversion | tr -d 'A-z')"
}

prepare() {
    cd "$srcdir/${pkgname%-svn}"

    if [ -d build ]; then
        rm -rf build
    fi
    mkdir build
    
    cd build
    cmake -Wno-dev \
        -D CMAKE_PREFIX_PATH:STRING=/usr \
        -D CMAKE_BUILD_TYPE:STRING=MinSizeRel \
        -D CMAKE_INSTALL_PREFIX:PATH=/usr \
        -D SD_LOCALDIR:STRING=~/.config/speed-dreams-2 \
        -D SD_BINDIR:STRING=/usr/games \
        -D SD_LIBDIR:STRING=/usr/lib \
        -D SD_DATADIR:STRING=/usr/share/games/speed-dreams-2 \
        -D OPTION_TRACE_LEVEL:STRING=2 \
        ../
}

build() {
    cd "$srcdir/${pkgname%-svn}/build"
    
    make
}

package() {
    cd "$srcdir/${pkgname%-svn}/build"

    make DESTDIR="$pkgdir" install

    install -D -m644 "${pkgdir}/usr/share/games/speed-dreams-2/data/icons/icon.png" \
        "${pkgdir}/usr/share/pixmaps/speed-dreams-2.png"
    install -D -m644 "$srcdir/${pkgname%-svn}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname%-svn}.desktop"
    install -d -m0755 "${pkgdir}/usr/bin"
    
    cd "${pkgdir}"/usr/games/
    for i in * ; do
        cd "${pkgdir}"/usr/bin/
        ln -s /usr/games/$i .
    done
}

