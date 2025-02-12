# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: JustKidding <jk@vin.ovh>

pkgname=ueberzugpp-new-git
_pkgname=ueberzugpp-new
pkgver=r399.cb3d31c
pkgrel=1
pkgdesc="Display images in the terminal (drop-in replacement for ueberzug written in C++)"
arch=('x86_64')
url="https://github.com/jstkdng/ueberzugpp-new"
license=("GPL-3.0-or-later")
provides=("ueberzug" "ueberzugpp")
conflicts=("ueberzug" "ueberzugpp")
makedepends=("cmake" "wayland-protocols" "extra-cmake-modules")
depends=("libvips" "libxcb" "xcb-util-image" "xcb-util-errors" "xcb-util-errors" "wayland" "glib2" "glibc" "gcc-libs"
         "onetbb")
source=("git+https://github.com/jstkdng/ueberzugpp-new.git"
        "git+https://github.com/gabime/spdlog.git"
        "git+https://github.com/CLIUtils/CLI11.git"
        "git+https://github.com/stephenberry/glaze.git")
sha256sums=("SKIP" "SKIP" "SKIP" "SKIP")

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$_pkgname"
  git submodule init
  git config "submodule.spdlog/spdlog.url" "$srcdir/third_party/spdlog"
  git config "submodule.spdlog/CLI11.url" "$srcdir/third_party/CLI11"
  git config "submodule.spdlog/glaze.url" "$srcdir/third_party/glaze"
  git -c protocol.file.allow=always submodule update
}

build() {
  cmake -B build -S "$_pkgname" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DENABLE_X11=ON \
    -DENABLE_WAYLAND=ON \
    -DENABLE_LIBVIPS=ON \
    -Wno-dev
  cmake --build build -j "$(nproc)"
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# vim:set ts=2 sw=2 et:
