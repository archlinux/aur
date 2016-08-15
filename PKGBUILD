# Maintainer: Konstantin Gizdov <arch@kge.pw>
# Contributor: Frank Siegert <frank.siegert@googlemail.com>
# Contributor: Scott Lawrence <bytbox@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Sebastian Voecking <voeck@web.de>

pkgname=root-extra
pkgver=6.06.06
pkgrel=1
provides=('root')
conflicts=('root')
pkgdesc='C++ data analysis framework and interpreter from CERN with extra features enabled.'
arch=('i686' 'x86_64')
url='http://root.cern.ch'
license=('LGPL2.1')
makedepends=('cmake')
depends=('cfitsio'
'desktop-file-utils'
'fftw'
'ftgl'
'gcc-fortran'
'glew'
'graphviz'
'gsl'
'gtk-update-icon-cache'
'intel-tbb'
'libafterimage'
'libiodbc'
'libmysqlclient'
'postgresql-libs'
'pythia'
'python'
'shared-mime-info'
'sqlite'
'tex-gyre-fonts'  # solve the pixelized font problem as per Arch Wiki
'unixodbc'
'xmlrpc-c'
)
install='root.install'
options=('!emptydirs')
source=("https://root.cern.ch/download/root_v${pkgver}.source.tar.gz"
'call_PyErr_Clear_if_no_such_attribute.patch'
'disable-gcc-abi-check.diff'
'python3.diff'
'root.sh'
'root.xml'
'rootd'
'settings.cmake')
md5sums=('4308449892210c8d36e36924261fea26'
         'f36f7bff97ed7232d8534c2ef166b2bf'
         '89d3caaa1d73a623c56a42f21dfdd669'
         'e1f1eb398dec2a66bb790ef277b3ab91'
         '0e883ad44f99da9bc7c23bc102800b62'
         'e2cf69b204192b5889ceb5b4dedc66f7'
         'efd06bfa230cc2194b38e0c8939e72af'
         '2904c221a5f719f74b0b326650f60746')
sha256sums=('0a7d702a130a260c72cb6ea754359eaee49a8c4531b31f23de0bfcafe3ce466b'
            '437ed0fb2c46d5ca8e37cc689f87dfe12429f6a243d4e5cf2d395a177de7e90f'
            'd9fea8991d42a78cd694f9798615274e96a185cbbd6608b4b80c76d5e43982a6'
            '51dbcf86d9973e7b7204fc20ff0c3c3aacea01ee126e14e2fb3c9f33825cc558'
            '71ed39f7e5a605a6a02e3d0ba79c997b8e7f02551898c27112eb78f07d9d8244'
            'b103d46705883590d9e07aafb890ec1150f63dc2ca5f40d67e6ebef49a6d0a32'
            '6a4ef7b32710d414ee47d16310b77b95e4cf1d3550209cf8a41d38a945d05e5f'
            'c6d475cbd10469b97eb8a9f4e45dc5d5f23042652cb2e3e1239e96a01e9d2d6e')
prepare(){
    ## https://sft.its.cern.ch/jira/browse/ROOT-6924
    cd ${pkgname}-${pkgver}

    patch -p1 < ${srcdir}/python3.diff
    2to3 -w etc/dictpch/makepch.py 2>&1 > /dev/null

    ## https://sft.its.cern.ch/jira/browse/ROOT-7640
    patch -p1 < ${srcdir}/call_PyErr_Clear_if_no_such_attribute.patch

    ## disable check newly introduced in 6.06.06
    patch -p1 < ${srcdir}/disable-gcc-abi-check.diff
}

build() {
    [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
    cd ${srcdir}/build

    cmake -C ${srcdir}/settings.cmake ${srcdir}/${pkgname}-${pkgver}

    make ${MAKEFLAGS}
}

package() {
    cd ${srcdir}/build

    make DESTDIR=${pkgdir} install

    install -D ${srcdir}/root.sh \
        ${pkgdir}/etc/profile.d/root.sh
    install -D ${srcdir}/rootd \
        ${pkgdir}/etc/rc.d/rootd
    install -D -m644 ${srcdir}/root.xml \
        ${pkgdir}/usr/share/mime/packages/root.xml

    install -D -m644 ${srcdir}/${pkgname}-${pkgver}/build/package/debian/root-system-bin.desktop.in \
        ${pkgdir}/usr/share/applications/root-system-bin.desktop
    # replace @prefix@ with /usr for the desktop
    sed -e 's_@prefix@_/usr_' -i ${pkgdir}/usr/share/applications/root-system-bin.desktop

    install -D -m644 ${srcdir}/${pkgname}-${pkgver}/build/package/debian/root-system-bin.png \
        ${pkgdir}/usr/share/icons/hicolor/48x48/apps/root-system-bin.png

    # use a file that pacman can track instead of adding directly to ld.so.conf
    install -d ${pkgdir}/etc/ld.so.conf.d
    echo '/usr/lib/root' > ${pkgdir}/etc/ld.so.conf.d/root.conf

    rm -rf ${pkgdir}/etc/root/daemons
}

