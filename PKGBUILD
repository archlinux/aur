# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=xine-ui-hg
pkgver=0.99.10.r3349.44f5b990a7ad
pkgrel=1
pkgdesc='A free video player for Unix (mercurial version)'
arch=('x86_64')
url='https://www.xine-project.org/'
license=('GPL')
depends=('xine-lib' 'curl' 'libxft' 'libxxf86vm' 'lirc' 'xdg-utils' 'libxss')
makedepends=('mercurial')
provides=('xine-ui')
conflicts=('xine-ui')
source=('hg+http://hg.code.sf.net/p/xine/xine-ui')
sha256sums=('SKIP')

pkgver() {
    cd xine-ui
    
    local _version
    _version="$(hg log --rev='branch(default) and tag()' --template='{tags}\n' |
                              grep '^[0-9]*\(\.[0-9]*\(\.[0-9]*\(\.[0-9]*\)\?\)\?\)\?$'  |
                              sort -Vr | head -n1)"
    printf '%s.r%s.%s' "$_version" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
    cd xine-ui
    ./autogen.sh \
        --prefix='/usr' \
        --mandir='/usr/share/man' \
        --with-x \
        --enable-lirc \
        --without-aalib \
        --enable-debug
    make
}

package() {
    cd xine-ui
    make DESTDIR="$pkgdir" desktopdir='/usr/share/applications' install
}
