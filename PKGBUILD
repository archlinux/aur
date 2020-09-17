# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=xine-ui-hg
pkgver=0.99.12.r406.df9d850bba34
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
            'd72fe7a931bc2f2009cddfdf8875f7b60c1cc5ce2368e1914964e1a3c00413b8')

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
