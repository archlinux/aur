# shellcheck shell=bash
# Maintainer: Gunnar Bretthauer <taijian@posteo.de>
# Contributor: Chinmay Dalal <w5vwg64uy at relay dot firefox dot com>

pkgname=powertop-git
_pkgname=powertop
pkgver=2.15.r19.g49045c0
pkgrel=1
pkgdesc='A tool to diagnose issues with power consumption and power management, git version'
arch=('i686' 'x86_64')
url='https://01.org/powertop/'
license=('GPL2')
makedepends=(
        'autoconf-archive'
        'git'
)
depends=(
		'gcc-libs'
		'libnl'
		'libtracefs'
		'ncurses'
		'pciutils'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(git+https://github.com/fenrus75/powertop.git
        autogen.sh)
sha256sums=('SKIP'
            '311c80bdd17bf64ebbbcde613b1c5e6f047b1fa00f6a8861150f6f8e15250720')

# template start; name=git-pkgver-r; version=1.0;
pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --tags --long | sed -E 's/([^-]+-g)/r\1/;s/-/./g;s/^v//g'
}

# autogen.sh needs --force now...
prepare() {
    cd "${srcdir}/${_pkgname}"
    cp ../autogen.sh ./
}
    
build() {
    cd "${srcdir}/${_pkgname}"

    ./autogen.sh
    ./configure --prefix=/usr --sbindir=/usr/bin
    make
}

package() {
    cd "${srcdir}/${_pkgname}"

    make DESTDIR="${pkgdir}" install
}
