# Maintainer: Richard Smith <aur@electronstudio.co.uk>
pkgname=inara-git
pkgver=0.7.0.r70.432463c  # placeholder, overwritten by pkgver()
pkgrel=1
pkgdesc="Use mobile device as trackpad, graphics tablet, for PC."
arch=('x86_64')
url="https://github.com/electronstudio/desktop_remote_mobile_companion"
license=('GPL-3.0-only')
depends=('x264' 'gcc-libs' 'libglvnd' 'mesa' 'libx11' 'libxcursor' 'libxrandr' 'libxinerama' 'libxi' 'wayland' 'libxkbcommon' 'libvdpau' 'alsa-lib' 'hicolor-icon-theme' 'libva' 'sndio' 'libxv')
makedepends=('go>=1.26' 'git' 'nasm')
source=(
  "git+https://github.com/electronstudio/desktop_remote_mobile_companion.git"
)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/desktop_remote_mobile_companion"
  local base=$(cat server/VERSION)
  printf "%s.r%s.%s" "$base" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/desktop_remote_mobile_companion"
  export GOFLAGS=-buildvcs=false
  export CGO_CFLAGS=""
  export CGO_LDFLAGS=""
  export CFLAGS="-march=native -O3"
  export CXXFLAGS="-march=native -O3"
  export LDFLAGS=""
  export LTOFLAGS=""
  make -f Makefile
}

package() {
  cd "$srcdir/desktop_remote_mobile_companion"
  make -f Makefile install DESTDIR="$pkgdir" PREFIX=/usr
  rm -f "$pkgdir/usr/share/applications/mimeinfo.cache"
  rm -f "$pkgdir/usr/share/icons/hicolor/icon-theme.cache"
}
