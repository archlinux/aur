# Maintainer: Andrew Reed <reed.995 at osu dot edu>
# Contributor: Hideaki <hideaki at gmail dot com>
# Contributor:  hnrch <heinrichmen at gmail dot com>
# Contributor: Zbynek Novotny <znovotny at gmail dot com>

pkgname=electricsheep-svn
pkgver=r134
pkgrel=2
pkgdesc="A screensaver that realize the collective dream of sleeping computers from all over the Internet"
url="http://www.electricsheep.org/"
arch=('i686' 'x86_64')
license=('GPLv2')

depends=('boost' 'curl' 'expat' 'flam3' 'glee' 'gtk2' 'ffmpeg' 'libglade' 'libgtop' 'libpng' 'lua51' 'tinyxml' 'wxgtk')
makedepends=('subversion')
provides=('electricsheep-svn')

source=("$pkgname::svn+https://github.com/scottdraves/electricsheep/"
        'electricsheep-160.patch')
        

sha1sums=('SKIP'
          '02c507eff0fccd13071c157bda44231294e17e56')

pkgver() {
    cd "$pkgname"
    local ver="$(svnversion)"
    printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
    cd "${srcdir}/${pkgname}/trunk"

    #TODO: Apply patch only if it hasn't been applied already
    patch --forward -p0 < "${srcdir}/electricsheep-160.patch"

    cd "client_generic"
    ./autogen.sh
    ./configure --prefix=/usr
    make || return 1

    # Hack to get ElectricSheep to show up and work with gnome-shell
    #
    #mkdir -p "$pkgdir/usr/share/applications/screensavers" "$pkgdir/usr/lib/gnome-screensaver/gnome-screensaver/"
    #cp "$srcdir/$pkgname/electricsheep.desktop" "$pkgdir/usr/share/applications/screensavers/electricsheep.desktop"
    #cp "$srcdir/$pkgname/electricsheep-saver" "$pkgdir/usr/lib/gnome-screensaver/gnome-screensaver/electricsheep-saver"
}


package() {
    cd "${srcdir}/${pkgname}/trunk/client_generic"
    make DESTDIR=$pkgdir install 
}
