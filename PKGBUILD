# Maintainer:   François Garillot <garillot.net: francois>
# Contributor:   Jesse Jaara     <gmail.com: jesse.jaara>
# Contributor:  Gaetan Bisson   <archlinux.org: bisson>
# Contributor:  Eric Bélanger   <archlinux.org: eric>

_pkgname=procps-ng
pkgname=procps-ng-static
pkgver=3.3.11
pkgrel=1
pkgdesc='Static lib for procps'
url='http://gitorious.org/procps'
license=('GPL' 'LGPL')
arch=('i686' 'x86_64')
groups=('base')
makedepends=('ncurses' 'systemd')

source=("http://downloads.sourceforge.net/project/${_pkgname}/Production/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('e9493169a2d2adc0bc045538707310c8e877b385e4e296143b62607d2bb044ed')
options=('!libtool' 'staticlibs')

groups=('base')

conflicts=('procps' 'sysvinit-tools' 'procps-ng' 'procps-ng-classic')
provides=('procps' 'sysvinit-tools' 'procps-ng')
replaces=('procps' 'sysvinit-tools')

install=install

prepare() {
        cd "${srcdir}/${_pkgname}-${pkgver}"
        sed 's:<ncursesw/:<:g' -i watch.c
}

build() {
        cd "${srcdir}/procps-ng-${pkgver}"

        ./configure \
                --prefix=/usr \
                --exec-prefix=/ \
                --sysconfdir=/etc \
                --libdir=/usr/lib \
                --bindir=/usr/bin \
                --sbindir=/usr/bin \
                --enable-watch8bit \
                --enable-static \
                --with-systemd

        make
}

package() {
        cd "${srcdir}/procps-ng-${pkgver}"

        mkdir -p "${pkgdir}/usr/lib/"
        cp proc/.libs/libprocps.a "${pkgdir}/usr/lib/"
        make DESTDIR="${pkgdir}" install

        # provided by util-linux
        rm "${pkgdir}/usr/bin/kill"
        rm "${pkgdir}/usr/share/man/man1/kill.1"
}
