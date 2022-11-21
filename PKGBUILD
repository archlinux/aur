# Maintainer: Martchus <martchus@gmx.net>
# Contributor: Mladen Milinkovic <maxrd2@smoothware.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of (another) binary repository (i686 and x86_64).

# Official arch linux binaries: https://subtitlecomposer.kde.org/download.html

pkgname=subtitlecomposer
pkgver=0.7.1
pkgrel=4
pkgdesc='Video subtitle editor'
arch=('i686' 'x86_64')
url="https://invent.kde.org/multimedia/${_name}"
license=('GPL')
depends=('kcoreaddons' 'ktextwidgets' 'kio' 'sonnet' 'kcodecs' 'kross' 'kxmlgui' 'ki18n' 'ffmpeg' 'openal')
makedepends=('extra-cmake-modules' 'jack' 'blas' 'xorg-server-xvfb')

# Comment/uncomment the following dependency to disable/enable
# building the pocketsphinx plugin
makedepends+=('pocketsphinx')

# For consistency, also enable/disable the corresponding optdepends
optdepends=('pocketsphinx: Pocketsphinx speech recognition backend'
            'ruby: scripting'
            'python: scripting')

_tar=${pkgname}-${pkgver}
source=("https://download.kde.org/stable/${pkgname}/${_tar}.tar.xz"
        "https://download.kde.org/stable/${pkgname}/${_tar}.tar.xz.sig"
        "https://invent.kde.org/multimedia/subtitlecomposer/-/commit/4f4f560e40ba0b760cf688eb024be3cc734ca347.patch")
sha256sums=('ef9cb3c0c1fe1f40cf9d8e795859b9b28adf2da3be77a076d46bc28df4cd0255'
            'SKIP'
            '012d89a4c3e328c0dca02a85113ac5f01b52a398de5dc2ed75d2d5d14b36886d'
            '4044626bbd5682692cffd458be70313318f7e665f22df0fe7648acee28064aa1')
validpgpkeys=('76F79007A54A4B68F1547928E2418746EF9D9B26')

prepare() {
  cd "${srcdir}/${_tar}"
  patch -p1 -i "$srcdir/4f4f560e40ba0b760cf688eb024be3cc734ca347.patch"
  patch -p1 -i "$srcdir/d8f9797d9c0d45fa9f4402f79c539544b74d2cc7.patch"
}

build() {
  cmake -S "${srcdir}/${_tar}" -B "${srcdir}/build" \
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
