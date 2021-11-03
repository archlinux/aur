# Maintainer: Mladen Milinkovic <maxrd2@smoothware.net>
# Contributor: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of (another) binary repository (i686 and x86_64).

# Official arch linux binaries: https://subtitlecomposer.kde.org/download.html

_name=subtitlecomposer
pkgname=${_name}-git
pkgver=0.7.1+git34.dba4b820
pkgrel=1
pkgdesc="A KDE subtitle editor (git version)"
arch=('i686' 'x86_64')
url="https://invent.kde.org/multimedia/${_name}"
license=('GPL')
depends=('kcoreaddons' 'ktextwidgets' 'kio' 'sonnet' 'kcodecs' 'kxmlgui' 'ki18n' 'ffmpeg' 'openal')
makedepends=('extra-cmake-modules' 'jack' 'blas' 'xorg-server-xvfb')

# Comment/uncomment the following dependency to disable/enable
# building the speech recognition plugin
makedepends+=('pocketsphinx')

# For consistency, also enable/disable the corresponding optdepends
optdepends=('pocketsphinx: Pocketsphinx speech recognition backend')

conflicts=(${_name})
provides=(${_name})

# gitlab mirrors https://invent.kde.org/multimedia/subtitlecomposer.git#branch=master + i18n
source=("git+https://gitlab.com/${_name}/${_name}.git#branch=obs/latest")
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_name}
  git describe --always --abbrev=8 | sed 's/-g/./;s/-/+git/;s/^v//g'
}

build() {
  cmake -S "${srcdir}/${_name}" -B "${srcdir}/build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  cmake --build "${srcdir}/build"
}

check() {
  export DISPLAY=:99
  Xvfb :99 >& /dev/null &
  trap "kill $! || true" EXIT
  cmake --build "${srcdir}/build" --target test
}

package() {
  DESTDIR="${pkgdir}" cmake --install "${srcdir}/build"
}
