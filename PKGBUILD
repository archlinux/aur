# Maintainer: artoo <artoo@manjaro.org>

_pkgname=elogind
_commit=5814139990daf10155b4fb0951ee456ac9c97a4b

pkgbase=elogind
pkgname=('elogind' 'libelogind')
pkgver=229.4
pkgrel=1
pkgdesc="The systemd project's logind, extracted to a standalone package"
arch=('i686' 'x86_64')
url="https://github.com/elogind/elogind"
license=('GPL')
makedepends=('intltool' 'libtool' 'gperf' 'gtk-doc' 'dbus-nosystemd' 'git' 'libcap')
options=('!libtool')
source=("elogind-${_commit}.tar.gz::${url}/archive/${_commit}.tar.gz"
        "elogind-docs.patch")
sha256sums=('43cd1ad357fe6bfa2369a4003e2737ec994a53471745679c97e09a7dcbd9d04a'
            '25643e563250b0d322f817288cbe999f1cc2e4804c875725bb92fe5094a902b4')

prepare() {
    cd ${_pkgname}-${_commit}
    patch -Np 1 -i ${srcdir}/elogind-docs.patch
    autoreconf -vim
}

build() {
    cd ${_pkgname}-${_commit}
    intltoolize
    ./configure \
        --sysconfdir=/etc \
        --prefix=/usr \
        --libdir=/usr/lib \
        --libexecdir=/usr/lib \
        --enable-split-usr \
        --disable-smack \
        --enable-acl \
        --enable-pam \
        --disable-kdbus

    make
}

package_elogind() {
    pkgdesc="The systemd project's logind, extracted to a standalone package"
    provides=("elogind=${pkgver}")
    depends=('libelogind' 'pam' 'acl' 'dbus-x11')
    conflicts=('systemd-sysvcompat' 'consolekit')
    # replaces=('consolekit')
    optdepends=('elogind-openrc: elogind initscript'
                'dbus-openrc: dbus initscript')
                #'polkit-elogind: polkit with elogind session tracking')
    install=elogind.install

    cd ${_pkgname}-${_commit}
    make DESTDIR="${pkgdir}" install

    mkdir ${srcdir}/_libelogind
    mv -v ${pkgdir}/usr/lib/pkgconfig ${srcdir}/_libelogind
	mv -v ${pkgdir}/usr/include/ ${srcdir}/_libelogind
	mv -v ${pkgdir}/usr/lib/libelogind*.so* ${srcdir}/_libelogind
}

package_libelogind(){
    pkgdesc="elogind client libraries"
    provides=('libelogind.so' "libelogind=${pkgver}")
    depends=('libcap')

    cd ${_pkgname}-${_commit}
    install -dm755 ${pkgdir}/usr/lib
    mv ${srcdir}/_libelogind/include ${pkgdir}/usr
    mv ${srcdir}/_libelogind/pkgconfig ${pkgdir}/usr/lib
    mv ${srcdir}/_libelogind/libelogind*.so* ${pkgdir}/usr/lib
}
