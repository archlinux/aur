# Maintainer: artist for Artix Linux and XLibre <artist@artixlinux.org>

pkgname=xlibre-input-libinput-git
_pkgbase="${pkgname%-*}"
pkgver=25.0.0.r3.e8f07a1
pkgrel=1
pkgdesc="XLibre fork of the generic input driver for the X.Org server based on libinput"
arch=('x86_64')
license=('MIT')
_pkgname="${_pkgbase//xlibre/xf86}"
url="https://github.com/X11Libre/${_pkgname}"
depends=("xlibre-xserver>=${pkgver%.r*}" 'glibc')
makedepends=("xlibre-xserver-devel>=${pkgver%.r*}" 'xorgproto' 'git')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("git+${url}.git")
groups=('xlibre-drivers')
depends+=('libinput')
makedepends+=('libxi' 'libx11' 'libxfont2' 'meson>=0.50.0')
install=$pkgname.install
options=('!debug')

pkgver() {
  cd ${_pkgname}
  local tag ver rev hash
  tag="$(git tag -l "xlibre-${_pkgname}-*" --sort=-v:refname | head -n1)"
  ver="${tag#"xlibre-${_pkgname}"-}"
  rev="$(git rev-list --count "$tag"..HEAD)"
  hash="$(git rev-parse --short HEAD)"
  printf "%s.r%s.%s" "$ver" "$rev" "$hash"
}

build() {
  arch-meson ${_pkgname} build \
    -D xorg-conf-dir=/usr/share/X11/xorg.conf.d/ 

  meson configure build
  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

sha256sums=('SKIP')

