# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=xine-ui-hg
pkgver=0.99.10.r3321.efe11fb1562e
pkgrel=1
pkgdesc='A free video player for Unix (Mercurial version with all possible libs)'
arch=('i686' 'x86_64')
url='https://www.xine-project.org/'
license=('GPL2')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'libcaca' 'libxft'
         'libxinerama' 'libxss' 'libxtst' 'libxv' 'libxxf86vm' 'lirc'
         'shared-mime-info' 'tar' 'xdg-utils' 'xine-lib')
makedepends=('libxt' 'mercurial')
provides=('xine-ui')
conflicts=('xine-ui')
source=("$pkgname"::'hg+http://hg.debian.org/hg/xine-lib/xine-ui')
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    
    # Mercurial
    printf '%s.r%s.%s' "$(hg log -r '.' --template '{latesttag}')" \
                       "$(hg identify -n)" \
                       "$(hg identify -i)"
}

build() {
    cd "$pkgname"
    
    ./autogen.sh
    
    LIBS='-ldl' \
    ./configure \
        --prefix='/usr' \
        --mandir='/usr/share/man' \
        --enable-nls \
        --enable-shm \
        --enable-xinerama \
        --disable-aalibtest \
        --enable-mbs \
        --enable-xft \
        --enable-lirc \
        --enable-vdr-keys \
        --disable-nvtvsimple \
        --disable-debug \
        --with-x \
        --with-curl \
        --without-aalib \
        --with-caca \
        --with-fb \
        --with-tar
        
    make
}

package() {
    cd "$pkgname"
    
    make DESTDIR="$pkgdir" desktopdir='/usr/share/applications' install
}
