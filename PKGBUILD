# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>
# Maintainer: Maël Kerbiriou <mael.kerbiriou-at-free-dot-fr>

pkgname=amarok-git
pkgver=v2.8.90.17.g9308403
pkgrel=1
pkgdesc="The powerful music player for KDE - GIT version"
arch=("i686" "x86_64")
url="http://amarok.kde.org"
license=('GPL2' 'LGPL2.1' 'FDL')
depends=('kdebase-runtime' 'mariadb' 'qtscriptgenerator' 'taglib-extras'
        'liblastfm' 'ffmpeg2.8' 'libofa' 'qjson')
makedepends=('pkgconfig' 'automoc4' 'cmake' 'libgpod' 'libmtp' 'loudmouth'
             'libmygpo-qt' 'mesa' 'clamz' 'git' 'gmock')
optdepends=("libgpod: support for Apple iPod audio devices"
            "libmtp: support for portable media devices"
            "loudmouth: backend needed by mp3tunes for syncing"
            "ifuse: support for Apple iPod Touch and iPhone"
            "libmygpo-qt: gpodder.net Internet Service"
            "clamz: allow to download songs from Amazon.com")
conflicts=('amarok' 'amarok2')
provides=('amarok')
replaces=('amarok-svn' 'amarok2-svn')
install="${pkgname}.install"
#source=(${pkgname}::git://anongit.kde.org/amarok.git)
source=(git://anongit.kde.org/amarok.git)
sha1sums=('SKIP')

pkgver() {
    cd amarok
    git describe --always | sed 's|-|.|g'
}

#prepare(){
#cd amarok
#pwd;
#patch -Np1 <../amarok-git.patch
#}

build() {
    rm -rf build
    mkdir -p build
    cd build
    export PKG_CONFIG_PATH="/usr/lib/ffmpeg2.8/pkgconfig"
    cmake "../amarok" -Wno-dev \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DKDE4_BUILD_TESTS=OFF \
        -DWITH_NepomukCore=OFF \
        -DWITH_Soprano=OFF

    make
}

package(){
    cd build
    make "DESTDIR=${pkgdir}" install
}
