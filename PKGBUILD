# Maintainer: Marat Bakeev <hawara@gmail.com>

pkgname=fido2-token2-git
pkgver=r157.4b85f49
pkgrel=1
pkgdesc='TOKEN2 FIDO2 management CLI with wrapper and GUI'
arch=('x86_64')
url='https://github.com/Token2/fido2-manage'
license=('BSD-2-Clause')
depends=('bash' 'openssl' 'libcbor' 'pcsclite' 'systemd-libs' 'zlib' 'python' 'tk' 'python-pexpect' 'hicolor-icon-theme')
makedepends=('git' 'cmake' 'pkgconf' 'gcc' 'make')
provides=('fido2-token2')
conflicts=('fido2-token2')
source=(
  'fido2-manage-upstream::git+https://github.com/Token2/fido2-manage.git'
  'prepare-overlay.sh'
  'fido2-manage.desktop'
  'fido2-manage.png'
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "$srcdir/fido2-manage-upstream"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$srcdir"
  bash "$srcdir/prepare-overlay.sh" "$srcdir/fido2-manage-upstream" "$srcdir/overlay"
}

build() {
  # Strip makepkg's _FORTIFY_SOURCE — upstream CMakeLists.txt sets its own
  CFLAGS="${CFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"
  CXXFLAGS="${CXXFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"

  cmake -S "$srcdir/fido2-manage-upstream" -B "$srcdir/build" \
    -DUSE_PCSC=ON \
    -DBUILD_SHARED_LIBS=OFF \
    -DBUILD_STATIC_LIBS=ON \
    -DBUILD_EXAMPLES=OFF \
    -DBUILD_TESTS=OFF \
    -DBUILD_MANPAGES=OFF \
    -DCMAKE_BUILD_TYPE=Release

  cmake --build "$srcdir/build" -j"$(nproc)"
}

package() {
  install -Dm755 "$srcdir/build/tools/fido2-token2" "$pkgdir/usr/bin/fido2-token2"
  install -Dm755 "$srcdir/overlay/fido2-manage" "$pkgdir/usr/bin/fido2-manage"
  install -Dm755 "$srcdir/overlay/fido2-manage-gui" "$pkgdir/usr/bin/fido2-manage-gui"

  install -Dm644 "$srcdir/overlay/gui.py" "$pkgdir/usr/share/fido2-manage/gui.py"
  install -Dm644 "$srcdir/fido2-manage.desktop" "$pkgdir/usr/share/applications/fido2-manage.desktop"
  install -Dm644 "$srcdir/fido2-manage.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/fido2-manage.png"
  install -Dm644 "$srcdir/overlay/69-fido2-token2.rules" "$pkgdir/usr/lib/udev/rules.d/69-fido2-token2.rules"

  install -Dm644 "$srcdir/fido2-manage-upstream/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
