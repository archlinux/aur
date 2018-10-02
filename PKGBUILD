# Maintainer: ser nica <swhat at posteo dot eu>

pkgname=veyon
pkgver=4.1.3
pkgrel=1
pkgdesc="Open Source computer monitoring and classroom management"
arch=('i686' 'x86_64')
url="https://github.com/veyon"
license=('GPLv2')
depends=('qt5-base' 'libxrandr' 'libxtst' 'pam' 'pam_ldap' 'openssl' 'libjpeg-turbo' 'zlib' 'qca-qt5' 'libqtxdg')
optdepends=('kldap: KDE support')
makedepends=('git' 'cmake' 'qt5-tools')
source=("git+${url}/veyon.git"
    "git+${url}/ultravnc.git"
    "git+${url}/libvncserver.git"
    "git+${url}/x11vnc.git"
    "git+git://anongit.kde.org/kldap.git")

md5sums=('SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP')

prepare() {
    mkdir -p build
    for file in ultravnc libvncserver x11vnc kldap
    do
        cp -a --no-preserve=ownership "${srcdir}/$file" "${srcdir}/${pkgname}/3rdparty/"
    done
    cd "${pkgname}"
    git submodule update --init
}

build() {
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_VEYON_X11VNC_EXTERNAL=ON \
	-DSYSTEMD_SERVICE_INSTALL_DIR=/usr/lib/systemd/system/ \
        -DCMAKE_BUILD_TYPE=debug \
	../"${pkgname}"
    make
}

package_veyon() {
    cd build
    make DESTDIR="${pkgdir}" install

    cd ${pkgdir}/usr/lib/${pkgname}
    for lib in $(ls *.so)
    do
       ln -s "/usr/lib/veyon/$lib" "${pkgdir}/usr/lib/$lib"
    done
}
