# Maintainer: Mihkel Tõnnov <mihhkel-at-gmail-dot-com>
# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Evert Vorster <evorster-at-gmail-dot-com>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>
# Contributor: Maël Kerbiriou <mael.kerbiriou-at-free-dot-fr>

pkgname=amarok-git
pkgver=2.9.71.r319.b592705a6c
pkgrel=2
pkgdesc="The powerful music player for KDE"
arch=("i686" "x86_64")
url="http://amarok.kde.org"
license=("GPL2" "LGPL2.1" "FDL")
depends=("threadweaver5" "qt5-webengine" "phonon-qt5" "qt5-declarative" "qt5-script"
         "kcmutils5" "knewstuff5" "ktexteditor5" "kdnssd5" "kirigami2"
         "mariadb" "libmariadbclient" "fftw" "liblastfm-qt5" "ffmpeg"  "taglib" "libofa")
makedepends=("git" "extra-cmake-modules" "kdoctools5" "gdk-pixbuf2" "knotifyconfig5"
             "libmtp" "libgpod" "loudmouth" "libmygpo-qt5")
optdepends=("libmtp: support for portable media devices"
            "ifuse: support for Apple iPod Touch and iPhone"
            "libgpod: support for Apple iPod audio devices"
            "loudmouth: backend needed by mp3tunes for syncing"
            "libmygpo-qt5: gpodder.net Internet Service"
            "gmock: tests")
conflicts=("amarok" "taglib-extras")
provides=("amarok")
source=("git+https://invent.kde.org/multimedia/amarok.git"
        "taglib2.diff")
sha512sums=("SKIP"
            "8f57e97c334e09c490b2c38c6ecbeda2fbf05d109098a10e924fa72ab13768425c9b89f5ecf47ba197169854f9e19dd626c4454d7500ea36d72805555b852f8e")

pkgver() {
    cd "$srcdir/amarok"
    set -o pipefail
    git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/amarok"
  patch -Np1 -i "${srcdir}/taglib2.diff"
  mkdir -p "${srcdir}/build"
}

build() {
    cd "${srcdir}/build"
    cmake "${srcdir}/amarok" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DBUILD_TESTING=OFF \
        -DCMAKE_BUILD_TYPE=Release
    make
}

package(){
    cd "${srcdir}/build"
    make "DESTDIR=${pkgdir}" install
}