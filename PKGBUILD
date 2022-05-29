# Merged with official ABS libxkbcommon PKGBUILD by João, 2022/05/29 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Joel Teichroeb <joel@teichroeb.net>

pkgbase=libxkbcommon-git
pkgname=(libxkbcommon-git libxkbcommon-x11-git libxkbcommon-doc-git)
pkgver=1.4.1_r2102.g57af9cb
pkgrel=1
pkgdesc='Keymap handling library for toolkits and window systems'
url='https://xkbcommon.org/'
arch=($CARCH)
license=(custom)
makedepends=(git doxygen libxcb libxml2 meson wayland wayland-protocols xkeyboard-config xorgproto)
checkdepends=(libgl xorg-server-xvfb)
source=("git+https://github.com/xkbcommon/${pkgbase%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgbase%-git}
  _ver="$(grep -m1 'version:' meson.build | cut -d "'" -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

prepare() {
  cd libxkbcommon
}

build() {
  arch-meson libxkbcommon build
  meson compile -C build
}

check() {
  xvfb-run -s '-nolisten local' meson test -C build --print-errorlogs
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_libxkbcommon-git() {
  depends=(libxml2 xkeyboard-config)
  optdepends=(
    'libxkbcommon-x11: xkbcli interactive-x11'
    'wayland: xkbcli interactive-wayland'
  )
  conflicts=(libxkbcommon)
  provides=(libxkbcommon{,.so} libxkbregistry.so)

  meson install -C build --destdir "$pkgdir"

  _pick x11 "$pkgdir"/usr/lib/*x11*
  _pick x11 "$pkgdir"/usr/lib/pkgconfig/*x11*
  _pick x11 "$pkgdir"/usr/lib/xkbcommon/*x11*
  _pick x11 "$pkgdir"/usr/include/xkbcommon/*x11*
  _pick x11 "$pkgdir"/usr/share/man/man1/*x11*

  _pick doc "$pkgdir"/usr/share/doc

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 libxkbcommon/LICENSE
}

package_libxkbcommon-x11-git() {
  pkgdesc='Keyboard handling library using XKB data for X11 XCB clients'
  depends=(libxcb libxkbcommon-git libxkbcommon.so)
  conflicts=(libxkbcommon-x11)
  provides=(libxkbcommon-x11{,.so})

  mv x11/* "$pkgdir"/

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 libxkbcommon/LICENSE
}

package_libxkbcommon-doc-git() {
  conflicts=(libxkbcommon-doc)
  provides=(libxkbcommon-doc)
  pkgdesc='API documentation for libxkbcommon'

  mv doc/* "$pkgdir"/

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 libxkbcommon/LICENSE
}
