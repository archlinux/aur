# Maintainer: Avi Tretiak <avi at babi dot uy>
# Build from upstream git source.

pkgname=kwin-effects-glass-git
pkgver=r526.b44f853
pkgrel=1
pkgdesc="Fork of Plasma 6 blur effect with force blur, rounded corners, refraction (Wayland 6.6+)"
arch=(x86_64)
url="https://github.com/4v3ngR/kwin-effects-glass"
license=(GPL-3.0-or-later)
depends=(kio knotifications kcrash kglobalaccel kcmutils libepoxy kwin)
conflicts=()
provides=("${pkgname%-git}")
makedepends=(git cmake extra-cmake-modules qt6-tools kwin)

# Build from upstream git source.
source=("${pkgname}::git+https://github.com/4v3ngR/kwin-effects-glass.git"
        "disable-x11-kwin-x11-api-check.patch")
sha256sums=("SKIP"
            "SKIP")

pkgver() {
  cd "${startdir}/src/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  local _build="${startdir}/build"
  cmake -B "$_build" -S "${startdir}/src/${pkgname}" \
    -W no-dev \
    -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_INSTALL_PREFIX=/usr
  cmake --build "$_build"
}

prepare() {
  patch -d "${startdir}/src/${pkgname}" -p1 -i "${startdir}/disable-x11-kwin-x11-api-check.patch"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "${startdir}/build"
}
