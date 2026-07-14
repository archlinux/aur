# Maintainer: Jerzy Kołosowski <jerzy@kolosowscy.pl>
pkgname=cdev-mcp
pkgver=0.1.1
pkgrel=1
pkgdesc="Claude DevContainer MCP Gateway (desktop daemon)"
arch=('x86_64' 'aarch64')
url="https://git.kolosowscy.pl/cdev/desktop"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-declarative' 'qt6-websockets' 'kirigami'
         'knotifications' 'kstatusnotifieritem' 'libslirp' 'qrencode' 'libsodium')
makedepends=('cmake' 'ninja' 'extra-cmake-modules' 'qt6-tools' 'pkgconf' 'git')
# The protocol library is a git submodule linked statically into cdev-mcp. AUR
# does not resolve the relative submodule URL (../protocol.git), so fetch it as
# a second source and re-point the submodule at it in prepare().
source=("git+https://git.kolosowscy.pl/cdev/desktop.git#tag=v$pkgver"
        "git+https://git.kolosowscy.pl/cdev/protocol.git")
sha256sums=('892613d6de7ae19d2b54dcd3bee9acaf348e6bff056d66a31900d1c630e8de6a'
            'SKIP')

prepare() {
  cd "$srcdir/desktop"
  git submodule init
  git config submodule.src/protocol.url "$srcdir/protocol"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$srcdir/desktop"
  cmake -B build -S . -GNinja \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCDEV_INSTALL_SYSTEMD=OFF
  cmake --build build
}

check() {
  cd "$srcdir/desktop/build"
  QT_QPA_PLATFORM=offscreen ctest --output-on-failure
}

package() {
  cd "$srcdir/desktop"
  DESTDIR="$pkgdir" cmake --install build
  # systemd user units at the packaged location, with ExecStart pointing at the
  # packaged binary (the in-repo unit uses the per-user dev path).
  install -Dm644 cdev-mcp.service "$pkgdir/usr/lib/systemd/user/cdev-mcp.service"
  install -Dm644 cdev-mcp.socket  "$pkgdir/usr/lib/systemd/user/cdev-mcp.socket"
  sed -i 's#%h/.local/bin/cdev-mcp#/usr/bin/cdev-mcp#' \
    "$pkgdir/usr/lib/systemd/user/cdev-mcp.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
