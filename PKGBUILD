# Maintainer: Auguste Pop <auguste [at] gmail [dot] com>

pkgname=xboard-git
pkgrel=1
pkgver=20150516
pkgdesc="A graphical user interfaces for chess"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/xboard/"
license=('GPL3')
depends=('gnuchess' 'gtk2' 'desktop-file-utils' 'librsvg')
makedepends=('git')
_reponame=xboard
provides=("$_reponame")
conflicts=("$_reponame")
source=("git://git.savannah.gnu.org/$_reponame.git")
backup=("etc/$_reponame/$_reponame.conf")
install=$_reponame.install
md5sums=('SKIP')

pkgver()
{
    cd "$srcdir/$_reponame"
    git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build()
{
    cd "$srcdir/$_reponame"

    # using gnuchess, which is in repo as default chess engine
    sed -i 's/fairymax/gnuchess/' gtk/xboard.h xaw/xboard.h xboard.conf
    ./autogen.sh
    ./configure --prefix=/usr --mandir=/usr/share/man \
        --sysconfdir=/etc/xboard --disable-rpath --disable-update-mimedb \
        --enable-zippy --with-gtk
    make
}

package()
{
    cd "${srcdir}/$_reponame"
    make DESTDIR="${pkgdir}" install
}
