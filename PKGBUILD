# Maintainer: he3als <he3als@disroot.org>

# This was forked from obs-nvfbc-git
# Previous Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=obs-nvfbc-high-fps-git
_pkgname=obs-nvfbc
pkgver=r58.45bcec4
pkgrel=1
pkgdesc="OBS Studio 27 plugin for NVIDIA FBC API - patched for 120FPS+ capture"
arch=('x86_64')
license=('LGPL2.0')
url="https://gitlab.com/fzwoch/obs-nvfbc"
provides=('obs-nvfbc')
conflicts=('obs-nvfbc')
depends=('obs-studio<28')
makedepends=('git' 'meson')
source=("git+https://gitlab.com/fzwoch/obs-nvfbc.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  echo Patching plugin to have a 999999fps limit with sed...
  sed -i 's/obs_properties_add_int(props, "fps", "FPS", 1, 120, 1);/obs_properties_add_int(props, "fps", "FPS", 1, 999999, 1);/g' "$srcdir/$_pkgname/nvfbc.c"
  echo Patched!
  meson "$srcdir/$_pkgname" build --prefix=/usr
  ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
}
