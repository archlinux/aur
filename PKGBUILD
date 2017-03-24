# Maintainer: David P. <megver83@openmailbox.org>
# Contributor: artoo <artoo@manjaro.org>
# Contributor: williamh <williamh@gentoo.org>

_url=https://dev.gentoo.org/~tetromino/distfiles/openrc-settingsd/

_sed_args=(-e 's|/usr/libexec|/usr/lib|g')
_prefix=true

$_prefix && _sed_args+=(-e 's|#!/sbin/runscript|#!/usr/bin/openrc-run|g')


pkgname=openrc-settingsd
pkgver=1.0.1
pkgrel=1
pkgdesc="System settings D-Bus service for OpenRC"
arch=('i686' 'x86_64')
url="http://www.gentoo.org/proj/en/base/openrc/"
license=('BSD2')
groups=('openrc-desktop')
depends=('libdaemon' 'dbus-elogind' 'openrc' 'polkit-elogind')
conflicts=('systemd-sysvcompat')
backup=('etc/conf.d/openrc-settingsd')
source=("${_url}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('2047267982c716cbc113d76d826f9b694706dbf737273eaaab239f6839d9ade2')

build(){
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure \
        --sysconfdir=/etc \
        --prefix=/usr \
        --libdir=/usr/lib \
        --libexecdir=/usr/lib \
        --with-pidfile="${EPREFIX}"/run/openrc-settingsd.pid
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    
    if ! ${_prefix};then
        mkdir -pv "${pkgdir}"/usr/{bin,lib}
        ln -sv usr/bin "${pkgdir}/bin"
        ln -sv usr/bin "${pkgdir}/sbin"
        ln -sv usr/lib "${pkgdir}/lib"
    fi
    
    make DESTDIR="${pkgdir}" install

    sed "${_sed_args[@]}" -i ${pkgdir}/etc/init.d/openrc-settingsd
    
    rm -r ${pkgdir}/usr/share/{dbus,polkit}-1
    
    install -Dm644 ${srcdir}/${pkgname}-${pkgver}/COPYING "$pkgdir/usr/share/licenses/${pkgname}/COPYING"
    
    if ! ${_prefix};then
        rm "${pkgdir}"/{bin,sbin,lib}
    fi
}
