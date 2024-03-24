# Maintainer: Mihkel Tõnnov <mihhkel-at-gmail-dot-com>
# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Evert Vorster <evorster-at-gmail-dot-com>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>
# Contributor: Maël Kerbiriou <mael.kerbiriou-at-free-dot-fr>

pkgname=amarok-git
pkgver=2.9.71.r359.gdb6ccbb
pkgrel=1
pkgdesc="The powerful music player for KDE"
arch=("i686" "x86_64")
url="http://amarok.kde.org"
license=("GPL2" "LGPL2.1" "FDL")
depends=("threadweaver5" "qt5-webengine" "phonon-qt5" "qt5-declarative" "qt5-script"
         "kcmutils5" "knewstuff5" "ktexteditor5" "kdnssd5" "kirigami2"
         "mariadb" "libmariadbclient" "fftw" "liblastfm-qt5" "ffmpeg"  "taglib>=2.0" "libofa")
makedepends=("git" "extra-cmake-modules" "kdoctools5" "gdk-pixbuf2" "knotifyconfig5"
             "libmtp" "libgpod" "loudmouth" "libmygpo-qt5" "qt5-tools")
optdepends=("libmtp: support for portable media devices"
            "ifuse: support for Apple iPod Touch and iPhone"
            "libgpod: support for Apple iPod audio devices"
            "loudmouth: backend needed by mp3tunes for syncing"
            "libmygpo-qt5: gpodder.net Internet Service"
            "taglib-extras: taglib plugins for Audible and RealMedia files"
            "gmock: tests")
conflicts=("amarok" "taglib-extras<1.0.1-8")
provides=("amarok")
source=("git+https://invent.kde.org/multimedia/amarok.git"
        # https://invent.kde.org/multimedia/amarok/-/merge_requests/55
        "Port away from deprecated QDesktopWidget functions & disable missing OSD settings functionalities on Wayland.diff"
        # https://invent.kde.org/multimedia/amarok/-/merge_requests/64
        "Improve collection tree keyboard navigation.diff"
       )
sha512sums=("SKIP"
            "e260a1f9c2aadf04e6dd6e1417ab8378c2811e35e0a454d8483fad0cabf3664df0e3871c8f0cb688ff5d0fa173420cc2a2ba7cf704d4ebffd10824b992e9b77e"
            "3659fabda8d75e87f9fe5a22217cd58e9b4aa71ff40e568a51c5b20570f79469a591fb0f6f58cc85c9dff4982d157c42ce396bc1e0b61b0aa7e3000e25390783"
           )

pkgver() {
    cd "$srcdir/amarok"
    set -o pipefail
    git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # Taglib-extras were removed and then re-added to optdepends (after fixing its build against taglib 2.0), so better warn if anyone still has the old version installed
  if [[ $(pacman -Q taglib-extras 2>&1 | cut -d ' ' -f 2) < "1.0.1-8" ]]; then
    echo "You have an old version of 'taglib-extras' installed. This will break the build - please uninstall it or update to 1.0.1-8 from AUR."
    return 1
  fi

  cd "${srcdir}/amarok"
  patch -Np1 -i "${srcdir}/Port away from deprecated QDesktopWidget functions & disable missing OSD settings functionalities on Wayland.diff"
  patch -Np1 -i "${srcdir}/Improve collection tree keyboard navigation.diff"
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
