# Contributor: Julian Knauer <jpk@goatpr0n.de>
pkgname=mbpurple-text-svn
pkgver=390
pkgrel=1
pkgdesc="Libpurple plug-in supporting microblog services like Twitter"
arch=('i686' 'x86_64')
url="http://code.google.com/p/microblog-purple/"
license=('GPL3')
depends=('libpurple')
makedepends=('subversion')
provides=('mbpurple')

_svntrunk=http://microblog-purple.googlecode.com/svn/trunk/
_svnmod=microblog-purple-read-only

PURPLE_PLUGIN_DIR=/usr/lib/purple-2

build() {
    cd "$srcdir"
    
    if [ -d $_svnmod/.svn ]; then
        (cd $_svnmod && svn up -r $pkgver)
    else
        svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    fi

    msg "SVN checkout done or server timeout"
    msg "Starting make..."

    rm -rf "$srcdir/$_svnmod-build"
    cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
    cd "$srcdir/$_svnmod-build"

    make -C microblog build || return 1
}

package() {
    cd "$srcdir/$_svnmod-build"
    install -m 0755 -d ${pkgdir}/${PURPLE_PLUGIN_DIR}
    for proto in identica twitter oldtwitter statusnet; do
        install -m 0755 microblog/lib${proto}.so ${pkgdir}/${PURPLE_PLUGIN_DIR}/lib${proto}.so
    done
}
