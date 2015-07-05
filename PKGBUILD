# Maintainer: Karol 'Kenji Takahashi' Woźniak @ kenji.sx
# Based on a scangearmp-mg3200 package by morris555
#
# [Printer Model Name] [Printer Model ID]
# ------------------------------------------------------------------
#  mp230     401
#  mg2200    402
#  e510      403
#  mg3200    404
#  mg4200    405
#  ip7200    406
#  mg5400    407
#  mg6300    408

_name=mg4200
_id=405

pkgname=scangearmp-${_name}
pkgver=2.00
pkgrel=1
_pkgver=2.00-1
pkgdesc="Canon Scanner Driver (for ${_name} series)"
url="http://support-my.canon-asia.com/contents/MY/EN/0100470802.html"
arch=('i686' 'x86_64')
license=('custom')
depends=('gtk2' 'sane' 'libusb-compat' 'gimp')
install=scangearmp-mg4200.install
source=(
    http://gdlp01.c-wss.com/gds/8/0100004708/01/scangearmp-source-${_pkgver}.tar.gz
    'libpng15.patch'
    'fix_configure.patch'
)
md5sums=(
    'ccd538e1333bf34aa83900f093ecd9eb'
    '5fd4f2f00aad11ff108a2c642cf1a7c1'
    '6ff76bfcfa4b4021e47677882772c895'
)

build() {
    if [ "$CARCH" == "x86_64" ]; then
        libdir=libs_bin64
    else
        libdir=libs_bin32
    fi

    # Patch for libpng>=1.5
    cd "${srcdir}"/scangearmp-source-${_pkgver}
    patch -p1 -i ../libpng15.patch
    patch -p1 -i ../fix_configure.patch

    cd ${srcdir}/scangearmp-source-${_pkgver}/scangearmp
    ./autogen.sh --prefix=/usr --enable-libpath=/usr/lib LDFLAGS="-lm -L`pwd`/../com/${libdir}"
    # Force the use of system's libtool
    rm -f libtool
    ln -s `which libtool` .
    # Build package
    make clean || return 1
    make || return 1
    # Install package
    install -d -m 0755 $pkgdir/usr/lib/bjlib
    make DESTDIR=${pkgdir} install || return 1

    # Install SANE configuration file
    install -d -m 0755 $pkgdir/etc/sane.d/
    install -m 0644 ${srcdir}/scangearmp-source-${_pkgver}/scangearmp/backend/canon_mfp.conf $pkgdir/etc/sane.d/canon_mfp.conf

    # Install common libraries
    install -m 0755 ${srcdir}/scangearmp-source-${_pkgver}/com/${libdir}/libcncpcmcm.so.8.0.1 ${pkgdir}/usr/lib/
    install -m 0755 ${srcdir}/scangearmp-source-${_pkgver}/com/${libdir}/libcncpmsimg.so.1.0.2 ${pkgdir}/usr/lib/
    install -m 0755 ${srcdir}/scangearmp-source-${_pkgver}/com/${libdir}/libcncpmslld.so.1.0.1 ${pkgdir}/usr/lib/
    install -m 0755 ${srcdir}/scangearmp-source-${_pkgver}/com/${libdir}/libcncpmsui.so.2.0.0 ${pkgdir}/usr/lib/
    install -m 0755 ${srcdir}/scangearmp-source-${_pkgver}/com/${libdir}/libcncpnet.so.1.2.2 ${pkgdir}/usr/lib/

    # Install specific libraries
    install -m 0755 ${srcdir}/scangearmp-source-${_pkgver}/${_id}/${libdir}/libcncpmsimg${_id}.so.2.0.0 ${pkgdir}/usr/lib/
    install -m 0755 ${srcdir}/scangearmp-source-${_pkgver}/${_id}/${libdir}/libcncpmslld${_id}c.so.1.04.1 ${pkgdir}/usr/lib/
    install -m 0755 ${srcdir}/scangearmp-source-${_pkgver}/${_id}/${libdir}/libcncpmslld${_id}.so.2.0.0 ${pkgdir}/usr/lib/
    # Create symbolic links
    cd ${pkgdir}/usr/lib/
    ln -s libcncpcmcm.so.8.0.1 libcncpcmcm.so
    ln -s libcncpmsimg.so.1.0.2 libcncpmsimg.so
    ln -s libcncpmslld.so.1.0.1 libcncpmslld.so
    ln -s libcncpmsui.so.2.0.0 libcncpmsui.so
    ln -s libcncpnet.so.1.2.2 libcncpnet.so

    ln -s libcncpmsimg${_id}.so.2.0.0 libcncpmsimg${_id}.so
    ln -s libcncpmslld${_id}c.so.1.04.1 libcncpmslld${_id}c.so
    ln -s libcncpmslld${_id}.so.2.0.0 libcncpmslld${_id}.so

    # Make scangearmp usable from gimp
    install -d -m 0755 ${pkgdir}/usr/lib/gimp/2.0/plug-ins/
    ln -s /usr/bin/scangearmp ${pkgdir}/usr/lib/gimp/2.0/plug-ins/

    # Install .tbl and .dat files
    install -D -m 0755 ${srcdir}/scangearmp-source-${_pkgver}/${_id}/cnc*.tbl ${pkgdir}/usr/lib/bjlib/
    install -D -m 0755 ${srcdir}/scangearmp-source-${_pkgver}/${_id}/CNC_*.DAT ${pkgdir}/usr/lib/bjlib/

    # Install udev rules
    install -D -m 0644 ${srcdir}/scangearmp-source-${_pkgver}/scangearmp/etc/80-canon_mfp.rules ${pkgdir}/etc/udev/rules.d/80-canon_mfp.rules

    # Install .ini file
    install -D -m 0666 ${srcdir}/scangearmp-source-${_pkgver}/com/ini/canon_mfp_net.ini ${pkgdir}/usr/lib/bjlib/

    # Install license file
    cd ${srcdir}/scangearmp-source-${_pkgver}
    install -D LICENSE-scangearmp-${pkgver}EN.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-scangearmp-${pkgver}EN.txt

    # Remove unneeded files
    rm ${pkgdir}/usr/lib/libsane-canon_mfp.a
    rm ${pkgdir}/usr/lib/libsane-canon_mfp.la
}

# vim:set ts=4 sw=4 et:
