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
pkgver=0.6.6
pkgrel=6
pkgdesc="A KDE subtitle editor"
arch=('i686' 'x86_64')
url="https://github.com/maxrd2/${pkgname}"
license=('GPL')
depends=('kcoreaddons' 'sonnet' 'kcodecs' 'kross' 'kxmlgui' 'ki18n' 'gstreamer')
makedepends=('extra-cmake-modules')

# Comment/uncomment the following dependencies to disable/enable
# building the plugins for MPV and Xine player backends and pocketsphinx
makedepends+=('xine-lib')
makedepends+=('mpv')
#makedepends+=('pocketsphinx')

# For consistency, also enable/disable the corresponding optdepends
optdepends=('mplayer: MPlayer backend'
            'mpv: MPV backend'
            'xine-lib: Xine backend'
#            'pocketsphinx: speech recognition'
            'kross-interpreters: for ruby and python scripting support'
            'ruby: scripting'
            'python: scripting')

source=("https://github.com/maxrd2/${pkgname}/archive/v${pkgver}.tar.gz"
        '0001-Use-target_link_libraries-instead-of-qt5_use_modules.patch::https://github.com/Martchus/subtitlecomposer/commit/cca0ff13c5bab516c073f9457277bdbf5fe1fd9a.patch')
sha256sums=('8c957db7078676636f05e798219ff1052a52014ce7593dc660c345196f803ae4'
            '8952257e4798ba009e721a1a8b5f929b03de8e733dbfa201b20fd8edd83cea99')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}
  patch -p1 -i "$srcdir/0001-Use-target_link_libraries-instead-of-qt5_use_modules.patch"
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
