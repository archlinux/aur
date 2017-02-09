# Contributor: Mark Weiman <mark dot weiman at markzz dot com>
# Contributor: Kerrick Staley <mail@kerrickstaley.com>
# Contributor: Thijs Vermeir <thijsvermeir@gmail.com>
# Contributor: Rafael Fontenelle <rafaelff@gnome.org>
# Maintainer: Jan Tojnar <jtojnar@gmail.com>

_pkgname=jhbuild
pkgname=${_pkgname}-git
pkgver=3.15.92.r1012.g88207c11
pkgrel=1
pkgdesc='Tool to build the whole GNOME desktop from sources'
arch=('i686' 'x86_64')
url='https://wiki.gnome.org/Projects/Jhbuild'
license=('GPL')
depends=(python2 git)
makedepends=(gnome-common intltool yelp-tools)
optdepends=('subversion: fetch subversion repositories'
            'cvs: fetch CVS repositories'
            'bzr: fetch Bazaar repositories'
            'mercurial: fetch Mercurial repositories'
            'darcs: fetch Darcs repositories')
provides=('jhbuild')
install=jhbuild.install
source=("git://git.gnome.org/jhbuild")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    ./autogen.sh --prefix=/usr PYTHON=/usr/bin/python2
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="$pkgdir" install
    cp -dr modulesets "$pkgdir/usr/share/jhbuild"
    sed -i "s|$srcdir|$HOME/jhbuild|g" "${pkgdir}"/usr/bin/jhbuild
}
