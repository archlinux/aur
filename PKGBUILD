# Maintainer: Benjamin Robin <benjarobin>

pkgname=gtkterm_jeija-git
_gitname=gtkterm
pkgver=118.2eae27b
pkgrel=1
pkgdesc="A gtk+ based serial port communication program"
arch=('i686' 'x86_64')
url="https://fedorahosted.org/gtkterm/"
license=('GPL')
depends=('gtk2' 'vte' 'systemd')
makedepends=('git' 'intltool' 'gnome-common')
provides=('gtkterm')
conflicts=('gtkterm')
source=('gtkterm::git+https://github.com/Jeija/gtkterm.git#branch=master')
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
    #sed -i 's|"/var/lock"|"/var/lock/lockdev"|' src/serie.h
    sed -i 's|"gresource.h"|"gio/gresource.h"|' src/term_config.c
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

