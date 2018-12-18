# Maintainer: Damien Flament <damien.flament at gmx dot com>
# Contributor: mickele <mimocciola at yahoo dot com>
# Contributor: Ilmari Repo <ilmari at gmail dot com> (librecad-svn PKGBUILD)
# Contributor: GazJ Gary James <garyjames82 at gmail  dot com> (CADuntu PKGBUILD)

_pkgtitle='LibreCAD'
pkgname=librecad-git
pkgver=2.2.0.rc1.r91.g8604f171
pkgrel=1
pkgdesc="A 2D CAD drawing tool based on the community edition of QCad."
arch=('x86_64')
url="https://librecad.org"
license=('GPL')

depends=('qt5-base' 'qt5-svg' 'qt5-tools' 'boost' 'muparser')
makedepends=('git')
provides=('librecad')
conflicts=('librecad')

source=("$_pkgtitle::git://github.com/$_pkgtitle/$_pkgtitle.git" 'librecad.desktop')
md5sums=('SKIP' '19dcb83a3fcdb3752439095b118ac6d3')

function pkgver
{
    cd "$_pkgtitle"

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

function build
{
    cd "$_pkgtitle"

    qmake -recursive librecad.pro \
        QMAKE_CPPFLAGS="$CPPFLAGS" \
        QMAKE_CFLAGS="$CFLAGS" \
        QMAKE_CXXFLAGS="$CXXFLAGS" \
        QMAKE_LDFLAGS="$LDFLAGS"

    make
}

function package
{
    cd "$_pkgtitle"

    install -m 644 -Dt "$pkgdir/usr/share/pixmaps" librecad/res/main/librecad.png
    install -m 644 -Dt "$pkgdir/usr/share/applications" desktop/librecad.desktop
    install -m 644 -Dt "$pkgdir/usr/share/man/man1" desktop/librecad.1

    cd unix

    install -Dt "$pkgdir/usr/bin" librecad ttf2lff

    install -Dd "$pkgdir/usr/share/librecad"
    cp --recursive -t "$pkgdir/usr/share/librecad" resources/*
}
