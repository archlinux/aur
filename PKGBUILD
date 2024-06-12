# Maintainer: Martchus <martchus@gmx.net>
# Contributor: Mladen Milinkovic <maxrd2@smoothware.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of (another) binary repository (i686 and x86_64).

# Official arch linux binaries: https://subtitlecomposer.kde.org/download.html

pkgname=subtitlecomposer
pkgver=0.8.1
pkgrel=1
pkgdesc='Video subtitle editor'
arch=('i686' 'x86_64')
url="https://invent.kde.org/multimedia/${pkgname}"
license=('GPL')
depends=('qt6-declarative' 'qt6-5compat' 'kcoreaddons' 'ktextwidgets' 'kio' 'sonnet' 'kcodecs' 'kxmlgui' 'ki18n' 'ffmpeg' 'openal')
checkdepends=('xorg-server-xvfb')
makedepends=('extra-cmake-modules' 'jack' 'blas')

# Comment/uncomment the following dependency to disable/enable
# building the pocketsphinx plugin
# Currently commented-out by default as the library is not even detected as of the 5.0.0 release:
#  ```
#  -- Could NOT find PocketSphinx (missing: POCKETSPHINX_INCLUDE_DIR) (found suitable version "5.0.0", minimum required is "5")
#  -- Have NOT Found PocketSphinx - Speech plugin will not be built
#  ```
#makedepends+=('pocketsphinx')

# For consistency, also enable/disable the corresponding optdepends
#  'pocketsphinx: Pocketsphinx speech recognition backend'
optdepends=(
  'ruby: scripting'
  'python: scripting'
)

_tar=${pkgname}-${pkgver}
source=("https://download.kde.org/stable/${pkgname}/${_tar}.tar.xz"
        "https://download.kde.org/stable/${pkgname}/${_tar}.tar.xz.sig")
sha256sums=('23c022768d7422c092149f41d51ebea80f54b27655573cf43f736efb88c30027'
            'SKIP')
validpgpkeys=('76F79007A54A4B68F1547928E2418746EF9D9B26')

prepare() {
  cd "${srcdir}/${_tar}"
}

build() {
  cmake -S "${srcdir}/${_tar}" -B "${srcdir}/build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DQT_MAJOR_VERSION=6 \
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
