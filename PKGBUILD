# Maintainer: Mladen Milinkovic <maxrd2@smoothware.net>
# Contributor: Martchus <martchus@gmx.net>

# You can install/update Subtitle Composer from repository
# if you add following to /etc/pacman.conf (x86_64 only)
# [subtitlecomposer]
# # Subtitle Composer
# SigLevel = PackageRequired
# Server = http://smoothware.net/$repo/$arch

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of (another) binary repository (i686 and x86_64).

_name=SubtitleComposer
pkgname=${_name,,}-git
pkgver=0.7.0
pkgrel=1
pkgdesc="A KDE subtitle editor (git version)"
arch=('i686' 'x86_64')
url="https://github.com/maxrd2/${_name}"
license=('GPL')
depends=('kcoreaddons' 'sonnet' 'kcodecs' 'kross' 'kxmlgui' 'ki18n' 'ffmpeg')
makedepends=('extra-cmake-modules' 'git')

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

conflicts=(${_name,,})
provides=(${_name,,})

source=("git+https://github.com/maxrd2/${_name}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_name}
  git describe --always --abbrev=8 | sed 's/-g/./;s/-/./;s/^v//g'
}

build() {
  cd ${srcdir}/${_name}
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
  cd ${srcdir}/${_name}
  make DESTDIR=${pkgdir} install
}
