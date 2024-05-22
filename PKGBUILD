# Maintainer: Martchus <martchus@gmx.net>
# Contributor: Mladen Milinkovic <maxrd2@smoothware.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of (another) binary repository (i686 and x86_64).

# Official arch linux binaries: https://subtitlecomposer.kde.org/download.html

pkgname=subtitlecomposer
pkgver=0.8.0
pkgrel=4
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
        "https://download.kde.org/stable/${pkgname}/${_tar}.tar.xz.sig"
        https://invent.kde.org/multimedia/subtitlecomposer/-/commit/f8280dbcc0b23aed2e55d8db39c220ad900e7825.patch
        https://invent.kde.org/multimedia/subtitlecomposer/-/commit/4ae795f0cabdf9236f144ac14202de9df39b8232.patch
        https://invent.kde.org/multimedia/subtitlecomposer/-/commit/75882f06140ed76aa3e86c759f0fdcec11c6ee51.patch
        https://invent.kde.org/multimedia/subtitlecomposer/-/commit/a5f82704da9e143ed29cccbe71b06bf0b507ec3b.patch)
sha256sums=('b1416bdf7223b1979a36620b913c117c1b6c933bf165e28491af476310d7c9f8'
            'SKIP'
            '7e6289d52b592d9e273bb9c36949b343a55e076343ea2cf36cc6e580555aaeff'
            'c78d860ce150eac38b26a968390217a9ce7e3c673fdae24e38e67341a77f7f84'
            '93b588697ee7a48a323644a96d5ba79a2077ae87be00e54fa4bf451692d95590'
            '94ae52d263c95187a48e7c7282f5c32a652a90f5009317957b3ee5e13c512eaa')
validpgpkeys=('76F79007A54A4B68F1547928E2418746EF9D9B26')

prepare() {
  cd "${srcdir}/${_tar}"

  patch -p1 -i "$srcdir"/f8280dbcc0b23aed2e55d8db39c220ad900e7825.patch
  patch -p1 -i "$srcdir"/4ae795f0cabdf9236f144ac14202de9df39b8232.patch
  patch -p1 -i "$srcdir"/75882f06140ed76aa3e86c759f0fdcec11c6ee51.patch
  patch -p1 -i "$srcdir"/a5f82704da9e143ed29cccbe71b06bf0b507ec3b.patch
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
