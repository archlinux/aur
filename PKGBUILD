# Maintainer: Benjamin Robin <benjarobin>

pkgname=gtkterm-git
_gitname=gtkterm
pkgver=91.421f834
pkgrel=1
pkgdesc="A gtk+ based serial port communication program"
arch=('i686' 'x86_64')
url="https://github.com/zdavkeos/gtkterm"
license=('GPL')
depends=('gtk2' 'vte' 'systemd')
makedepends=('git' 'intltool' 'gnome-common')
provides=('gtkterm')
conflicts=('gtkterm')
source=('gtkterm::git+https://github.com/zdavkeos/gtkterm.git#branch=0.99.7')
md5sums=('SKIP')
install="${pkgname}.install"

pkgver()
{
    cd "${_gitname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare()
{
    cd "${_gitname}"
    rm -f aclocal.m4 configure Makefile.in depcomp
    sed -i 's|"/var/lock"|"/var/lock/lockdev"|' src/serie.h
}

build()
{
    cd "${_gitname}"
    msg "Starting configure..."
    ./autogen.sh
    ./configure --prefix=/usr --mandir=/usr/share/man
    msg "Starting make..."
    make
}

package()
{
    cd "${_gitname}"
    make DESTDIR="${pkgdir}" install
}

