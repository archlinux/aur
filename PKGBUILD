# Maintainer: Marti Raudsepp <marti@juffo.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Benjamin Andresen <benny@klapmuetz.org>
# Contributor: bekks <eduard.warkentin@gmx.de>

pkgname=pgadmin3-git
pkgver=20110912
pkgrel=1
pkgdesc="A comprehensive design and management interface for PostgreSQL database"
arch=('i686' 'x86_64')
url="http://www.pgadmin.org/"
license=('custom:PostgreSQL')
depends=('wxgtk' 'postgresql-libs' 'libxslt')
makedepends=('libpqxx' 'postgresql' 'git')
provides=('pgadmin3')
conflicts=('pgadmin3' 'pgadmin3-svn' 'pgadmin3-testing')
source=(pgadmin3.desktop)
md5sums=('d07ba4df54baead30b66d19d7450bcad')

_gitroot="git://github.com/postgres/pgadmin3.git"
_gitname="pgadmin3"

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."

    if [ -d $_gitname ] ; then
      cd $_gitname && git pull origin
      msg "The local files are updated."
    else
      git clone $_gitroot $_gitname
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    rm -rf "$srcdir/$_gitname-build"
    git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname-build"

    unset LDFLAGS
    ./bootstrap
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$_gitname-build"

    # WTF is this shit?
    sed -i 's/chmod 0666 $(help_cache)//' Makefile

    make DESTDIR=$pkgdir/ install

    install -D -m 644 i18n/pgadmin3.lng $pkgdir/usr/share/pgadmin3/i18n
    install -D -m 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

    mkdir -p $pkgdir/usr/share/pgadmin3/pixmaps/
    mkdir -p $pkgdir/usr/share/applications/

    install -D -m 644 pgadmin/include/images/pgAdmin3.ico $pkgdir/usr/share/pgadmin3/pixmaps/pgAdmin3.ico
    install -D -m 644 $srcdir/pgadmin3.desktop $pkgdir/usr/share/applications/
}
