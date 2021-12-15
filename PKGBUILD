# Maintainer: Gabriele Musco <gabmus@disroot.org>
# Upstream URL: https://gitlab.com/kirbykevinson/libinput-config

pkgname=libinput-config-git
pkgver=r56.ae90015
pkgrel=1
pkgdesc="Configuration system for libinput"
arch=('any')
url="https://gitlab.com/kirbykevinson/libinput-config"
license=('custom')
depends=('glibc' 'libinput')
makedepends=('gcc' 'meson')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://gitlab.com/kirbykevinson/libinput-config.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  # git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson -Dnon_glibc=true "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "$srcdir/libinput-config/LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}

