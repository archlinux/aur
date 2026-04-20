# Maintainer: sfs sfslinux@gmail.com

pkgname=wl-kbd-assets-git
_upstream_name=wl-kbd-assets
pkgver=0.2.0.r1.gd0836f0
pkgrel=1
pkgdesc='Keyboard layout flag icons and xkeyboardconfig catalog'
arch=('any')
url='https://github.com/sfs-pra/wl-kbd-assets'
license=('MIT')
depends=()
makedepends=('git' 'meson' 'ninja')
provides=('wl-kbd-assets')
conflicts=('wl-kbd-assets')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_upstream_name}"

  local ver rev hash
  ver=$(sed -nE "s/^project\('wl-kbd-assets',[[:space:]]*version:[[:space:]]*'([^']+)'.*/\1/p" meson.build | head -n1)
  rev=$(git rev-list --count HEAD)
  hash=$(git rev-parse --short HEAD)

  printf '%s.r%s.g%s' "${ver:-0.0.0}" "$rev" "$hash"
}

build() {
  cd "$srcdir/${_upstream_name}"
  meson setup build --prefix=/usr --buildtype=release --wrap-mode=nodownload
  meson compile -C build
}

package() {
  cd "$srcdir/${_upstream_name}"
  DESTDIR="$pkgdir" meson install -C build
}
