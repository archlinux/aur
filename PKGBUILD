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

_name=SubtitleComposer
pkgname=${_name,,}
pkgver=0.7.0
pkgrel=1
pkgdesc="A KDE subtitle editor"
arch=('i686' 'x86_64')
url="https://github.com/maxrd2/${_name}"
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

source=("https://github.com/maxrd2/${pkgname}/archive/v${pkgver}.tar.gz"
        '0001-Use-target_link_libraries-instead-of-qt5_use_modules.patch::https://github.com/Martchus/subtitlecomposer/commit/cca0ff13c5bab516c073f9457277bdbf5fe1fd9a.patch')
sha256sums=('90dee806df0ee57f4098d417f62014b4533dbf5598d5535c9da1066536c1ed41'
            '8952257e4798ba009e721a1a8b5f929b03de8e733dbfa201b20fd8edd83cea99')

#prepare() {
#  cd ${srcdir}/${_name}-${pkgver}
#  patch -p1 -i "$srcdir/0001-Use-target_link_libraries-instead-of-qt5_use_modules.patch"
#}

build() {
  cd ${srcdir}/${_name}-${pkgver}
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
  cd ${srcdir}/${_name}-${pkgver}
  make DESTDIR=${pkgdir} install
}
