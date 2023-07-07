# Maintainer: Callum Parsey <callum@neoninteger.au>

pkgname=neochat-encryption
pkgver=23.04.3
pkgrel=1
pkgdesc="A client for matrix, the decentralized communication protocol (with encryption support)"
url="https://apps.kde.org/neochat/"
arch=("x86_64" "aarch64")
license=("GPL3")
depends=("cmark" "gcc-libs" "glibc" "hicolor-icon-theme" "kconfig"
         "kconfigwidgets" "kcoreaddons" "kdbusaddons" "ki18n" "kio"
         "kirigami-addons" "kitemmodels" "knotifications" "kquickimageeditor"
         "kwindowsystem" "libquotient-encryption" "qqc2-desktop-style"
         "qt5-base" "qt5-declarative" "qt5-multimedia" "qt5-quickcontrols2"
         "qtkeychain-qt5" "sonnet" "syntax-highlighting")
makedepends=("extra-cmake-modules" "kdoctools" "qcoro-qt5")
provides=("neochat")
conflicts=("neochat")
source=("https://download.kde.org/stable/release-service/${pkgver}/src/neochat-${pkgver}.tar.xz"
        "https://invent.kde.org/network/neochat/-/commit/d9d5e17b.patch")
sha256sums=('2e7a006e24eea80049a0213897048291d1ddb52d484aae8d2d0f48bbb020af04'
            'd66a3934d598bf6007dd8cf27d1ef64cae0fdfdd51b03418f1384c0116a40fb4')

prepare() {
  # In `CMakeLists.txt` make sure that the relevant references to the
  # `Quotient` CMake package are replaced with `QuotientE2EE` so that we depend
  # on the `libquotient-encryption` AUR package instead of the official Arch
  # package `libquotient`. Specifically, we only change the `find_package()`
  # and `set_package_properties()` calls (the instances where `(Quotient` is
  # prefixed with an opening bracket).
  cd "${srcdir}/neochat-${pkgver}"
  sed -i 's/\((Quotient\) /\1E2EE /g' CMakeLists.txt

  # There's another `CMakeLists.txt` in the `src` sub-directory which needs all
  # of its references to `Quotient` to be replaced with `QuotientE2EE`.
  # Capitalised `QUOTIENT` instances are left as-is.
  sed -i 's/\(Quotient\)/\1E2EE/' src/CMakeLists.txt

  # From official package: apply an upstream patch to allow compiling against
  # libQuotient 0.8.
  # https://invent.kde.org/network/neochat/-/merge_requests/1059
  # https://gitlab.archlinux.org/archlinux/packaging/packages/neochat/-/commit/fedb7be50a84a7d3ae57d0e10fc10bf95d31ec78
  patch -Np1 -d . -i ../d9d5e17b.patch
}

build() {
  cmake -B build -S "neochat-${pkgver}" -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
