# Maintainer: Damien Flament <damien.flament at gmx dot com>
# Contributor: mickele <mimocciola at yahoo dot com>
# Contributor: Ilmari Repo <ilmari at gmail dot com> (librecad-svn PKGBUILD)
# Contributor: GazJ Gary James <garyjames82 at gmail  dot com> (CADuntu PKGBUILD)

_repository='LibreCAD'
pkgname=librecad-git
pkgver=2.2.2_alpha.latest.r352.g7befe2a
pkgrel=1
pkgdesc="A 2D CAD drawing tool based on the community edition of QCad."
arch=('x86_64')
url="https://librecad.org"
license=('GPL')

depends=('qt6-base' 'qt6-tools' 'qt6-svg' 'boost' 'muparser' 'freetype2')
makedepends=('git')
provides=('librecad')
conflicts=('librecad')

source=("git+https://github.com/LibreCAD/$_repository.git")
md5sums=('SKIP')

function pkgver
{
    cd "$_repository"

    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

function build
{
    cd "$_repository"

    qmake6 -recursive librecad.pro \
        QMAKE_CPPFLAGS="$CPPFLAGS" \
        QMAKE_CFLAGS="$CFLAGS" \
        QMAKE_CXXFLAGS="$CXXFLAGS" \
        QMAKE_LDFLAGS="$LDFLAGS"

    make
}

function package
{
    cd "$_repository"

    install -m 644 -Dt "$pkgdir/usr/share/pixmaps" librecad/res/images/librecad.png
    install -m 644 -Dt "$pkgdir/usr/share/applications" desktop/librecad.desktop
    install -m 644 -Dt "$pkgdir/usr/share/man/man1" desktop/librecad.1

    cd unix

    install -Dt "$pkgdir/usr/bin" librecad ttf2lff

    install -Dd "$pkgdir/usr/share/librecad"
    cp --recursive -t "$pkgdir/usr/share/librecad" resources/*
}
