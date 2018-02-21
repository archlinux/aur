# Maintainer: Ivan Trubach <mr.trubach@icloud.com> <dev@b1nary.tk>

pkgname=wlroots-full-git
pkgver=r1924.2e7d886
pkgrel=1
license=('MIT')
pkgdesc='A modular Wayland compositor library (static and shared libs, all features enabled)'
url='https://github.com/swaywm/wlroots'
arch=(x86_64)
provides=(wlroots)
conflicts=(wlroots)
options=(staticlibs)
depends=(wayland wayland-protocols
         libdrm opengl-driver pixman
         libx11 libxcb libxkbcommon
         xcb-util-image xcb-util-wm
         libinput
         libcap udev systemd)
makedepends=(git pkg-config meson ninja)
source=("$pkgname::git+$url")
sha512sums=(SKIP)

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$pkgname"
  git checkout -q 2e7d8862549a786c5aafcbe20db290377e3228ac
}

build() {
  cd "$pkgname"
  for lib in shared static
  do
    meson build/$lib \
      -Denable_libcap=true \
      -Denable_systemd=true \
      -Denable_xwayland=true \
      -Denable_elogind=false \
      --prefix="/usr"             \
      --sysconfdir="/etc"         \
      --localstatedir="/var"      \
      --mandir="/usr/share/man"   \
      --infodir="/usr/share/info" \
      --backend=ninja             \
      --buildtype=release         \
      --default-library=$lib
    #  --default-library=both
    # See https://github.com/mesonbuild/meson/issues/484
    #     https://github.com/mesonbuild/meson/pull/2711
    # so for now we'll just build the project twice
    ninja -C build/$lib
  done
}

package() {
  cd "$pkgname"

  export DESTDIR="$pkgdir"
  for lib in shared static
  do
    ninja -C build/$lib install
  done

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
