# Maintainer: Manel Castillo Giménez
pkgname="clavis-git"
pkgver="2.2.1"
pkgrel="1"
pkgdesc="An easy to use Password Manager. Development version"
arch=("x86_64")
url="https://github.com/ManelCG/clavis"
license=("GPL3")
depends=("gtk4" "gtkmm-4.0" "gpgme")
makedepends=("cmake" "git" "gcc" "make" "pkgconf")
optdepends=("git: password store synchronization")
provides=("clavis")
conflicts=("clavis")
source=("clavis::git+https://github.com/ManelCG/clavis.git#branch=develop")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/clavis"
  # Derive the version from git so the development package reflects the actual
  # checked-out commit (e.g. 2.1.0.1.r33.gabc1234), falling back to a commit count.
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
    || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/clavis"

  # The cmake 'archlinux' target bakes its staging directory (PACKAGE_DIR) from
  # $ENV{BDIR} at *configure* time, so BDIR must be exported here, while make.sh
  # runs cmake. package() then only re-runs the already-configured target.
  BDIR="${pkgdir}" ./make.sh
}

package() {
  cd "${srcdir}/clavis/out"
  make archlinux
}
