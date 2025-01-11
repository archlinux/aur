# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Mihkel Tõnnov <mihhkel-at-gmail-dot-com>
# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Evert Vorster <evorster-at-gmail-dot-com>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>
# Contributor: Maël Kerbiriou <mael.kerbiriou-at-free-dot-fr>

pkgname=amarok-qt6-git
pkgver=3.2.1.r1.g9f59d4d
pkgrel=1
pkgdesc="The powerful music player for KDE"
arch=(x86_64)
url="https://apps.kde.org/amarok/"
license=(GPL2 LGPL2.1 FDL)
depends=(threadweaver qt6-webengine phonon-qt6 qt6-declarative
         kcmutils knewstuff ktexteditor kdnssd kirigami2 kstatusnotifieritem ktextwidgets
         mariadb libmariadbclient fftw ffmpeg taglib libofa)
makedepends=(git extra-cmake-modules kdoctools gdk-pixbuf2 knotifyconfig
             libmtp loudmouth qt6-tools)
optdepends=("libmtp: support for portable media devices"
            "loudmouth: backend needed by mp3tunes for syncing"
            #"taglib-extras: taglib plugins for Audible and RealMedia files"
            )
conflicts=(amarok)
provides=(amarok)
options=(!lto)
source=("git+https://invent.kde.org/multimedia/amarok.git")
sha512sums=("SKIP")

pkgver() {
  cd "amarok"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local _flags=(
    -DBUILD_WITH_QT6=TRUE
    -DWITH_GPODDER=OFF
    -DWITH_IPOD=OFF
    -DWITH_LASTFM=OFF
  )

  cmake -B build -S "amarok" -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
