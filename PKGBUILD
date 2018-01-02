# Maintainer: ser nica <swhat at posteo dot eu>

pkgname=veyon
pkgver=4.0.3
pkgrel=2
pkgdesc="Open Source computer monitoring and classroom management"
arch=('i686' 'x86_64')
url="https://github.com/veyon"
license=('GPLv2')
depends=('qt5-base' 'libxrandr' 'libxtst' 'pam' 'openssl' 'libjpeg-turbo' 'zlib' 'qca-qt5')
optdepends=('kldap: KDE support')
makedepends=('git' 'cmake' 'qt5-tools')
_commit=14ef71781c9c933603bf3ecd83dba6b2841cdff1 #tags/4.0.3
source=("git+${url}/veyon#commit=$_commit"
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
    cmake ../"${pkgname}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DCMAKE_BUILD_TYPE=Release
    make
}

package_veyon() {
    cd build
    make DESTDIR="${pkgdir}" install
    
    #### Uncomment the following lines to 
    #### Install icon and desktop shortcut
    
    #install -m 644 -Dt "${pkgdir}/usr/share/pixmaps/" \
    #    "${srcdir}/${pkgname}/master/data/${pkgname}-master.xpm"

    #install -m 644 -Dt "${pkgdir}/usr/share/applications/" \
    #    "${srcdir}/${pkgname}/master/data/${pkgname}-master.desktop.in"

    #mv "${pkgdir}/usr/share/applications/${pkgname}-master.desktop.in" \
    #    "${pkgdir}/usr/share/applications/${pkgname}-master.desktop"
}
