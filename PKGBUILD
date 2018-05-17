# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=xine-ui-hg
pkgver=0.99.10.r3326.12aa9b3c98fb
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
source=("$pkgname"::'hg+http://hg.code.sf.net/p/xine/xine-ui')
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    
    # mercurial
    printf '%s.r%s.%s' "$(hg log --rev='branch(default) and tag()' --template='{tags}\n' | \
                              grep '^[0-9]*\(\.[0-9]*\(\.[0-9]*\(\.[0-9]*\)\?\)\?\)\?$'  | \
                              sort -Vr | \
                              head -n1)" \
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
