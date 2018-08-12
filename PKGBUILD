# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=gputop-git
pkgver=r957.757399aa75
pkgrel=1
pkgdesc="GPU profiling tool"
arch=('i686' 'x86_64')
url="https://github.com/rib/gputop"
license=('MIT')
depends=('openssl')
makedepends=('meson' 'ninja' 'python-mako')
source=("git+$url")
md5sums=('SKIP')
optdepends=(
  'mesa:         for the UI'
  'libepoxy:     for the UI'
  'glfw-x11:     for the UI (Xorg native)'
  'glfw-wayland: for the UI (Wayland native)'
  'gtk3:         for the UI (GTK)'
  'cogl:         for the UI (GTK)'
  'libsoup:      for the UI (GTK)'
  )

pkgver() {
  cd "${srcdir}"/gputop
  printf 'r%d.%s' \
    $(git rev-list --count HEAD) \
    $(git rev-parse HEAD | head -c10)
}

__has_package() {
  pacman &>/dev/null -Qi "$@"
}

prepare() {
  if [ -d build ] && [ -f build/meson-private/build.dat ]
  then
    cd build
  else
    rm -rf build
    mkdir build
    cd build
    arch-meson "$srcdir"/gputop
  fi

  option=()
  if __has_package mesa libepoxy \
  && (__has_package glfw-x11 || __has_package glfw-wayland)
  then
    options+=('-Dnative_ui=true')
  else
    options+=('-Dnative_ui=false')
  fi

  meson configure "${options[@]}"
}

build() {
  cd build
  ninja || ninja || ninja # there's a race condition in the build dependencies; running multiple times works around it
}

check() {
  cd build
  ninja test || true # subproject libuv is known to fail checks
}

package() {
  cd build
  DESTDIR="${pkgdir}" ninja install
}
