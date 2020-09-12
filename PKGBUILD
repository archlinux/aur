# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=xine-ui-hg
pkgver=0.99.12.r400.ff6bdf276e71
pkgrel=1
pkgdesc='A free video player for Unix (mercurial version)'
arch=('x86_64')
url='http://xine.sourceforge.net/'
license=('GPL')
depends=('xine-lib' 'curl' 'libxft' 'libxxf86vm' 'lirc' 'xdg-utils')
makedepends=('mercurial')
provides=('xine-ui')
conflicts=('xine-ui')
source=('hg+http://hg.code.sf.net/p/xine/xine-ui'
        '010-xine-ui-fix-build.patch')
sha256sums=('SKIP'
            '1028f927ec87fb46088c0fc93a96d0eca182c452f90fa2bda9a7abec209da88d')

prepare() {
    patch -d xine-ui -Np1 -i "${srcdir}/010-xine-ui-fix-build.patch"
}

pkgver() {
    printf '%s.r%s.%s' "$(hg -R xine-ui log -r. --template '{latesttag}')" \
                       "$(hg -R xine-ui log -r. --template '{latesttagdistance}')" \
                       "$(hg -R xine-ui log -r. --template '{node|short}')"
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
    make -C xine-ui DESTDIR="$pkgdir" desktopdir='/usr/share/applications' install
}
