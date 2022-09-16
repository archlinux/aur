# Maintainer: Huang-Huang Bao <eh5@sokka.cn>

_pkgbase=libcamera
pkgbase=libcamera-minimal-git
pkgname=(libcamera-minimal-git)
pkgver=r3912.74ab3f77
pkgrel=1
pkgdesc="An open source camera stack and framework for Linux, Android, and ChromeOS"
url="https://libcamera.org"
license=(LGPL2.1)
arch=(x86_64)
makedepends=(
  git meson
  openssl
  libelf
  systemd
  libyaml
  gnutls
  python-jinja
  python-ply
  python-yaml
)
source=("git+https://git.libcamera.org/libcamera/${_pkgbase}.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgbase
  (
    set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  # make AUR helper happy
  rm -rf builddir || true

  local meson_options=(
    -Dcam=disabled
    -Ddocumentation=disabled
    -Dgstreamer=disabled
    -Dlc-compliance=disabled
    -Dqcam=disabled
    -Dtest=false
    -Dtracing=disabled
    -Dpycamera=disabled
  )

  arch-meson $_pkgbase builddir "${meson_options[@]}"
  meson compile -C builddir
}

# check() {
#   meson test -C builddir --print-errorlogs
# }

package_libcamera-minimal-git() {
  depends=(
    gnutls
    libelf
    libyaml
    libudev.so
  )
  provides=(libcamera)
  conflicts=(libcamera)

  meson install -C builddir --destdir "$pkgdir"
}
