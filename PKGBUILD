# Maintainer: univrsal <uni@vrsal.xyz>

pkgname=waechter-git
pkgver=r621.fe4afd1
pkgrel=1
pkgdesc="Traffic shaping and monitoring for GNU/Linux"
arch=('x86_64')
url="https://github.com/univrsal/waechter"
license=('BSD-3-Clause' 'GPL-3.0-or-later')
depends=(
    'systemd'
    'bpf'
    'libbpf'
    'libxkbcommon'
    'libgl'
    'libx11'
    'libxrandr'
    'libxinerama'
    'libxcursor'
    'libxi'
    'curl'
    'libwebsockets'
)
makedepends=('git' 'cmake' 'clang' 'gcc')

provides=('waechter')
conflicts=('waechter')

source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
}

build() {
  export CFLAGS CXXFLAGS
  CFLAGS="${CFLAGS/_FORTIFY_SOURCE=?/_FORTIFY_SOURCE=2}"
  CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=?/_FORTIFY_SOURCE=2}"

  cd "$srcdir/${pkgname%-git}"
  cmake -S . -B build -DCMAKE_BUILD_TYPE=RelWithDebInfo
  cmake --build build -j$(nproc)
}

check() {
  :
}

package() {
  cd "$srcdir/${pkgname%-git}"

  install -Dm755 "build/Source/Gui/waechter" \
    "$pkgdir/usr/bin/waechter"

  install -Dm755 "build/Source/Daemon/waechterd" \
    "$pkgdir/usr/bin/waechterd"

  install -Dm755 "build/Source/Daemon/Net/IPLinkProc/waechter-iplink" \
    "$pkgdir/usr/bin/waechter-iplink"

  install -Dm644 "Meta/Package/waechterd.service" \
    "$pkgdir/usr/lib/systemd/system/waechterd.service"
  install -Dm644 "Meta/Package/waechter.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/waechter.conf" 
  install -Dm644 "Meta/Package/waechter.desktop" \
    "$pkgdir/usr/share/applications/waechter.desktop"
  install -Dm644 Meta/Icon.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/waechter.png"

  install -Dm644 "Meta/Package/waechterd.ini" "$pkgdir/etc/waechter/waechterd.ini"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

