# Contributor: Hideaki <hideaki at gmail dot com>
# Contributor:  hnrch <heinrichmen at gmail dot com>
# Contributor: Zbynek Novotny <znovotny at gmail dot com>
# Maintainer: Andrew Reed <reed.995 at osu dot edu>

pkgname=electricsheep-svn
pkgver=160
pkgrel=3
pkgdesc="A screensaver that realize the collective dream of sleeping computers from all over the Internet"
url="http://www.electricsheep.org/"
arch=('i686' 'x86_64')
license=('GPLv2')

depends=('boost' 'curl' 'expat' 'flam3' 'glee' 'gtk2' 'ffmpeg' 'libglade' 'libgtop' 'libpng' 'lua' 'tinyxml' 'wxgtk')
makedepends=('subversion')
provides=('electricsheep-svn')
conflicts=()
replaces=()

source=('electricsheep-160.patch')
sha1sums=('02c507eff0fccd13071c157bda44231294e17e56')

_svntrunk="http://electricsheep.googlecode.com/svn/trunk"
_svnmod="electricsheep"

build() {
    cd "$srcdir"

    msg "Starting SVN checkout..."
    if [[ -d "$pkgname/.svn" ]]; then
        msg2 "Found checked out repository"
        (cd "$pkgname" && svn up -r $pkgver)
    else
        msg2 "Checking out new repository"
        svn co $_svntrunk --config-dir ./ -r $pkgver "$pkgname"
    fi

    cd "${pkgname}"
    patch -p0 < "${startdir}/electricsheep-160.patch"
    cd ..

    msg2 "Setting up build directory..."
    if [[ -d "$srcdir/$pkgname-build" ]]; then
        (rm -rf "$srcdir/$pkgname-build")
    fi
    cp -r "$srcdir/$pkgname" "$srcdir/$pkgname-build"
    cd "$srcdir/$pkgname-build/client_generic"
    mkdir -p m4

    msg2 "Configuring..."
    ./autogen.sh
    ./configure --prefix=/usr
    make || return 1

    #
    # Hack to get ElectricSheep to show up and work with gnome-shell
    #
    #mkdir -p "$pkgdir/usr/share/applications/screensavers" "$pkgdir/usr/lib/gnome-screensaver/gnome-screensaver/"
    #cp "$srcdir/$pkgname/electricsheep.desktop" "$pkgdir/usr/share/applications/screensavers/electricsheep.desktop"
    #cp "$srcdir/$pkgname/electricsheep-saver" "$pkgdir/usr/lib/gnome-screensaver/gnome-screensaver/electricsheep-saver"
}


package() {
    cd "${srcdir}/${pkgname}-build/client_generic"
    msg "${pwd}"
    make DESTDIR=$pkgdir install 
}
