# Maintainer: krumelmonster <krumelmonster@zoho.com>

pkgname=bindzwirn-git
_pkgname="${pkgname/-git/}"
pkgver=r113.e52d968
pkgrel=1
pkgdesc="manage permissions for binding to IP ports"
arch=('x86_64')
url="https://codeberg.org/bindzwirn/bindzwirn"
license=('GPL-2.0-or-later')
depends=('libbpf' 'glibc')
makedepends=('meson' 'linux-headers' 'clang' 'bpf' 'pkg-config' 'git' 'llvm')
source=("git+$url.git")
provides=("$_pkgname")
conflicts=("$_pkgname")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
  local _meson_options=(
    -Dvmlinux-h-path=/usr/src/linux/vmlinux.h
    -Dsystemdunitdir=/usr/lib/systemd/system/
  )
  arch-meson "${_pkgname}" build "${_meson_options[@]}" $MESON_EXTRA_CONFIGURE_OPTIONS
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir" --quiet
}
