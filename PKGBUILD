# Maintainer: Mihkel Tõnnov <mihhkel-at-gmail-dot-com>
# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Evert Vorster <evorster-at-gmail-dot-com>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>
# Contributor: Maël Kerbiriou <mael.kerbiriou-at-free-dot-fr>

pkgname=amarok-git
pkgver=2.9.71.r328.g4bc5627
pkgrel=1
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
        "Refresh more deprecated codepaths.diff"
        "Port away from deprecated QDesktopWidget functions & disable missing OSD settings functionalities on Wayland.diff"
        "Fix crash in PodcastSettingsDialog initialization.diff"
        "Use non-deprecated TagLib functions (fix build with TagLib 2).diff")
sha512sums=("SKIP"
            "dd6f92fb8e1c1d4fe429cbbda9218bce4e0f3d7e5d0300e48fb95ca701d3c537dded9ef3d792b90ee02b69dd3a2ef07c285cd43eabc703058dee74fa0e2f34b8"
            "ef489ed770974ee95b8f7ea56b3ec8bab9cdc03c4a1ac859472bdb09b4800a135178bbe9e1c964ea7d2ad30f08b5a6024ecd58f5e56dd00fc93b515cad7a74e0"
            "04406608a3d4453580100cf81812646f0c5581422c3764a3d08166873cab4582b650ae13d574ca010e1896fc3e7b218424570341b9b5260e039e50a0e1e424fc"
            "6646c130ffe993db8bc105e3737a585e149a1099759e3335af67bf84620b28cb4460a4925d8592eba9d4110b72f210628b7d6078f5dafe0de64259f811b413b0")

pkgver() {
    cd "$srcdir/amarok"
    set -o pipefail
    git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/amarok"
  patch -Np1 -i "${srcdir}/Refresh more deprecated codepaths.diff"
  patch -Np1 -i "${srcdir}/Port away from deprecated QDesktopWidget functions & disable missing OSD settings functionalities on Wayland.diff"
  patch -Np1 -i "${srcdir}/Fix crash in PodcastSettingsDialog initialization.diff"
  patch -Np1 -i "${srcdir}/Use non-deprecated TagLib functions (fix build with TagLib 2).diff"
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
