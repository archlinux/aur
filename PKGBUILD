# Maintainer: Martchus <martchus@gmx.net>
# Contributor: Mladen Milinkovic <maxrd2@smoothware.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of (another) binary repository (i686 and x86_64).

# Official arch linux binaries: https://subtitlecomposer.kde.org/download.html

pkgname=subtitlecomposer
pkgver=0.7.1
pkgrel=6
pkgdesc='Video subtitle editor'
arch=('i686' 'x86_64')
url="https://invent.kde.org/multimedia/${_name}"
license=('GPL')
depends=('kcoreaddons' 'ktextwidgets' 'kio' 'sonnet' 'kcodecs' 'kross' 'kxmlgui' 'ki18n' 'ffmpeg' 'openal')
makedepends=('extra-cmake-modules' 'jack' 'blas' 'xorg-server-xvfb')

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
        "https://download.kde.org/stable/${pkgname}/${_tar}.tar.xz.sig"
        "4f4f560e40ba0b760cf688eb024be3cc734ca347.patch"
        "d8f9797d9c0d45fa9f4402f79c539544b74d2cc7.patch"
        "12f4d7f49d0b1a7fc02b0836521a285e7b6bac9d.patch")
sha256sums=('ef9cb3c0c1fe1f40cf9d8e795859b9b28adf2da3be77a076d46bc28df4cd0255'
            'SKIP'
            '26197260a6e4419c7178c65a5ac9e8811418e40c97454b2aa8a62b149305dcd5'
            '9df3e453d04e74a49c11ff67dbd8d9460d92744636769bf04e898f16b73124d5'
            'c570f7164d9b93c1a437d71f948f3c26a20725c78a32548e00013d9f1528e7c6')
validpgpkeys=('76F79007A54A4B68F1547928E2418746EF9D9B26')

prepare() {
  cd "${srcdir}/${_tar}"
  patch -p1 -i "$srcdir/4f4f560e40ba0b760cf688eb024be3cc734ca347.patch"
  patch -p1 -i "$srcdir/d8f9797d9c0d45fa9f4402f79c539544b74d2cc7.patch"
  patch -p1 -i "$srcdir/12f4d7f49d0b1a7fc02b0836521a285e7b6bac9d.patch"
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
