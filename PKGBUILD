# Maintainer: Damien Flament <damien.flament at gmx dot com>
# Contributor: mickele <mimocciola at yahoo dot com>
# Contributor: Ilmari Repo <ilmari at gmail dot com> (librecad-svn PKGBUILD)
# Contributor: GazJ Gary James <garyjames82 at gmail  dot com> (CADuntu PKGBUILD)

_pkgtitle='LibreCAD'
pkgname=librecad-git
pkgver=2.2.0_rc1_91_g8604f171
pkgrel=1
pkgdesc="A 2D CAD drawing tool based on the community edition of QCad."
arch=('i686' 'x86_64')
url="http://librecad.org"
license=('GPL')

depends=('qt5-base' 'qt5-svg' 'qt5-tools' 'boost' 'muparser')
makedepends=('git')
provides=('librecad')
conflicts=('librecad')
replaces=('librecad-svn' 'caduntu' 'caduntu-svn')

source=("$_pkgtitle::git://github.com/$_pkgtitle/$_pkgtitle.git" 'librecad.desktop')
md5sums=('SKIP' '19dcb83a3fcdb3752439095b118ac6d3')

function pkgver
{
    cd "$_pkgtitle"
    git describe --tags | sed -e 's/-/_/g'
}

function build
{
    cd "$_pkgtitle"
    qmake librecad.pro \
        QMAKE_CPPFLAGS="$CPPFLAGS" \
        QMAKE_CFLAGS="$CFLAGS" \
        QMAKE_CXXFLAGS="$CXXFLAGS" \
        QMAKE_LDFLAGS="$LDFLAGS"
    make

    cd 'plugins'
    make
}

function package
{
    cd "$_pkgtitle"

    install -D -m 755 unix/librecad "${pkgdir}/usr/bin/librecad"
    install -D -m 755 unix/ttf2lff "${pkgdir}/usr/bin/ttf2lff"

    mkdir -p "${pkgdir}/usr/share/librecad"
    cp -r unix/resources/{library,patterns,fonts,qm,plugins} "${pkgdir}/usr/share/librecad"

    install -D -m 644 "${srcdir}/librecad.desktop" "${pkgdir}/usr/share/applications/librecad.desktop"
    install -D -m 644 librecad/res/main/librecad.png "${pkgdir}/usr/share/pixmaps/librecad.png"
}
