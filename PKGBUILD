# Maintainer: Mladen Milinkovic <maxrd2@smoothware.net>
# Contributor: Martchus <martchus@gmx.net>

# You can install/update Subtitle Composer binaries from official repository.
# Add following to /etc/pacman.conf:
# [home_maxrd2_Arch]
# # Subtitle Composer
# SigLevel = Never
# Server = https://download.opensuse.org/repositories/home:/maxrd2/Arch/$arch

_name=subtitlecomposer
pkgname=${_name}-git
pkgver=0.7.0.203.431e63c2
pkgrel=1
pkgdesc="A KDE subtitle editor (git version)"
arch=('i686' 'x86_64')
url="https://invent.kde.org/kde/${_name}"
license=('GPL')
depends=('kcoreaddons' 'sonnet' 'kcodecs' 'kross' 'kxmlgui' 'ki18n' 'ffmpeg' 'openal')
makedepends=('extra-cmake-modules' 'git')

# Comment/uncomment the following dependency to disable/enable
# building the speech recognition plugin
makedepends+=('pocketsphinx')

# For consistency, also enable/disable the corresponding optdepends
optdepends=('pocketsphinx: Pocketsphinx speech recognition backend'
            'kross-interpreters: Ruby and Python scripting support'
            'ruby: scripting'
            'python: scripting')

conflicts=(${_name})
provides=(${_name})

source=("git+https://invent.kde.org/kde/${_name}.git")
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
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd ${srcdir}/${_name}
  make DESTDIR=${pkgdir} install
}
