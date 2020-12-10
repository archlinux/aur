# Maintainer: Martchus <martchus@gmx.net>
# Contributor: Mladen Milinkovic <maxrd2@smoothware.net>

# You can install/update Subtitle Composer from repository
# if you add following to /etc/pacman.conf (x86_64 only)
# [subtitlecomposer]
# # Subtitle Composer
# SigLevel = PackageRequired
# Server = http://smoothware.net/$repo/$arch

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of (another) binary repository (i686 and x86_64).

pkgname=subtitlecomposer
pkgver=0.7.0
pkgrel=5
pkgdesc='A KDE subtitle editor'
arch=('i686' 'x86_64')
url="https://invent.kde.org/kde/${pkgname}"
license=('GPL')
depends=('kcoreaddons' 'sonnet' 'kcodecs' 'kross' 'kxmlgui' 'ki18n' 'ffmpeg')
makedepends=('extra-cmake-modules')

# Comment/uncomment the following dependencies to disable/enable
# building the plugins for MPV and Xine player backends and pocketsphinx
makedepends+=('xine-lib')
makedepends+=('mpv')
makedepends+=('pocketsphinx')

# For consistency, also enable/disable the corresponding optdepends
optdepends=('gstreamer: GStreamer videoplayer backend'
            'mpv: MPV videoplayer backend'
            'mplayer: MPlayer videoplayer backend'
            'phonon-qt5: Phonon videoplayer backend'
            'xine-lib: Xine videoplayer backend'
            'pocketsphinx: Pocketsphinx speech recognition backend'
            'kross-interpreters: Ruby and Python scripting support'
            'ruby: scripting'
            'python: scripting')

source=("https://invent.kde.org/kde/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2"
        "0001-fix-mpv-compile.patch")
sha256sums=('5292006e551793f63d0db68c775eb63030c863f9815fabb0387ca0db5cdbfd77'
            '2d3629904b980c9897d437f68a21efe484294299775be3f1562e4c3ff76e5878')

prepare() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  patch -Np1 -i ../0001-fix-mpv-compile.patch
}

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF \
    -DAPP_VERSION="${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  make DESTDIR="${pkgdir}" install
}
