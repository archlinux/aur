# Maintainer: Orang Studio <https://github.com/Orang-Studio>
pkgname=orangtask-git
_pkgname=orangtask
pkgver=0.1.0.r56.g036b22c
pkgrel=1
pkgdesc="Native desktop client for OrangTask: tray popup, quick add, reminders and KRunner search"
arch=('x86_64' 'aarch64')
url="https://task.oranges.lt"
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'qt6-websockets' 'qtkeychain-qt6'
         'layer-shell-qt' 'hicolor-icon-theme')
makedepends=('git' 'cmake' 'ninja')
optdepends=('krunner: search tasks from KRunner'
            'kwallet: store sign-in tokens in KWallet')
provides=("$_pkgname")
conflicts=("$_pkgname")
# The desktop client reads the web app's translation catalogs, so it needs the whole repo.
source=("$_pkgname::git+https://github.com/Orang-Studio/OrangTask.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  local version
  version=$(sed -n 's/^project(orangtask VERSION \([0-9.]*\).*/\1/p' desktop/CMakeLists.txt)
  printf "%s.r%s.g%s" "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S "$_pkgname/desktop" -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_INSTALL_RPATH=ON
  cmake --build build
}

check() {
  QT_QPA_PLATFORM=offscreen ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
