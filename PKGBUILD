# Maintainer: Mihkel Tõnnov <mihhkel-at-gmail-dot-com>
# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Evert Vorster <evorster-at-gmail-dot-com>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>
# Contributor: Maël Kerbiriou <mael.kerbiriou-at-free-dot-fr>

pkgname=amarok-git
pkgver=3.2.82.r5.gf3da000
pkgrel=2
pkgdesc="The powerful music player for KDE"
arch=(x86_64)
url="https://apps.kde.org/amarok/"
license=(GPL-2.0-or-later)
depends=(threadweaver qt6-webengine qt6-declarative
         kcmutils ktexteditor kdnssd kirigami2 kstatusnotifieritem ktextwidgets
         mariadb libmariadbclient fftw ffmpeg taglib libofa qt6-tools gstreamer gst-plugins-base-libs

         # namcap implicit depends
         qt6-5compat kiconthemes ki18n qt6-svg gcc-libs kcompletion kitemviews kwidgetsaddons solid karchive kcrash
         kdbusaddons kconfigwidgets kpackage kcodecs knotifications hicolor-icon-theme kxmlgui qt6-base kconfig
         kcoreaddons kglobalaccel kirigami kwindowsystem kguiaddons glibc kio kcolorscheme)
makedepends=(git extra-cmake-modules kdoctools gdk-pixbuf2 knotifyconfig vulkan-headers
             libmtp loudmouth)
optdepends=("libmtp: support for portable media devices"
            "loudmouth: backend needed by mp3tunes for syncing"
            "liblastfm-qt6: Last.fm service"
            )
conflicts=(amarok)
provides=(amarok)
source=("git+https://invent.kde.org/multimedia/amarok.git")
sha512sums=("SKIP")

pkgver() {
  cd "amarok"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local _flags=(
    -DWITH_GPODDER=OFF
    -DWITH_IPOD=OFF
    -DBUILD_TESTING=OFF
  )

  cmake -B build -S "amarok" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
