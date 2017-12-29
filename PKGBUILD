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

_name=subtitlecomposer
pkgname=${_name}-git
pkgver=0.6.5
pkgrel=1
pkgdesc="A KDE subtitle editor (git version)"
arch=('i686' 'x86_64')
url="https://github.com/maxrd2/${_name}"
license=('GPL')
depends=('kcoreaddons' 'sonnet' 'kcodecs' 'kross' 'kxmlgui' 'ki18n' 'gstreamer')
makedepends=('extra-cmake-modules' 'git')

# Comment/uncomment the following dependencies to disable/enable
# building the plugins for MPV and Xine player backends and pocketsphinx
makedepends+=('xine-lib')
makedepends+=('mpv')
makedepends+=('pocketsphinx')

# For consistency, also enable/disable the corresponding optdepends
optdepends=('mplayer: MPlayer backend'
            'mpv: MPV backend'
            'xine-lib: Xine backend'
            'pocketsphinx: speech recognition'
            'kross-interpreters: for ruby and python scripting support'
            'ruby: scripting'
            'python: scripting')

conflicts=($_name)
provides=($_name)

source=("git+https://github.com/maxrd2/${_name}.git")
sha256sums=('SKIP')

pkgver() {
  export APP_VER=${pkgver}
  cd ${srcdir}/${_name}
  git describe --always | sed 's|-|.|g' | sed -e 's/^v//g'
}

build() {
  cd ${srcdir}/${_name}
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd ${srcdir}/${_name}
  make DESTDIR=${pkgdir} install
}
