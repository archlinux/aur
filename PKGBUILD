# Maintainer: Szymon Morawski <szymorawski@gmail.com>
_name=kio-chomikuj
pkgname=$_name-git
pkgver=0.1.0.r9.g9daa9ab
pkgrel=1
pkgdesc='KIO worker and System Settings module for Chomikuj.pl'
arch=('x86_64' 'aarch64')
url='https://github.com/hamster-instrumentality-project/kio-chomikuj'
license=('GPL-2.0-or-later')
depends=(
  'kcmutils>=6.3.0'
  'kconfig>=6.3.0'
  'kcoreaddons>=6.3.0'
  'ki18n>=6.3.0'
  'kio>=6.3.0'
  'qt6-base>=6.5.0'
  'zlib'
)
makedepends=(
  'cmake'
  'extra-cmake-modules>=6.3.0'
  'gettext'
  'kdoctools>=6.3.0'
  'ninja'
  'python'
)
checkdepends=(
  'appstream'
)
optdepends=(
  'khelpcenter: offline handbook in KHelpCenter'
  'plasma-workspace: Chomikuj.pl control module in System Settings'
)
provides=("$_name")
conflicts=("$_name")
source=("$_name::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_name"

  local _version
  _version=$(sed -n 's/^project([^)]* VERSION \([0-9][0-9.]*\).*/\1/p' CMakeLists.txt)

  printf '%s.r%s.g%s' \
    "${_version:-0}" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cmake \
    -S "$_name" \
    -B build \
    -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_C_FLAGS="${CFLAGS}" \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS}" \
    -DBUILD_TESTING=ON \
    -Wno-dev

  cmake --build build
}

check() {
  QT_QPA_PLATFORM=offscreen ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$_name/LICENSES/GPL-2.0-or-later.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/GPL-2.0-or-later.txt"
}
