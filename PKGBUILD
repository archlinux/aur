# Maintainer: DreamMaoMao <maoopzopaasnmakslpo@gmail.com>

pkgname=maomaowm-git
pkgver=r166.20bd984
pkgrel=1
pkgdesc="A Wayland compositor with smooth animation"
url="https://github.com/DreamMaoMao/maomaowm"
arch=("x86_64")
license=("MIT")
depends=(
  glibc
  'wayland>=1.23.1'
  'libinput>=1.27.1'
  libdrm
  pixman
  libxkbcommon
  wlroots0.17
)

makedepends=(
  git
  meson
  ninja
  fakeroot
  debugedit
  base-devel
  'wayland-protocols>=1.41'
)

provides=(maomaowm wayland-compositor)
conflicts=(maomaowm)
source=("$pkgname::git+https://github.com/DreamMaoMao/maomaowm.git")
md5sums=('SKIP')


pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd $pkgname
    git checkout main
}

build() {  
  export PKG_CONFIG_PATH=/usr/lib/wlroots0.17/pkgconfig:$PKG_CONFIG_PATH
  arch-meson $pkgname build 
  ninja -C build
}

package() {
  DESTDIR="$pkgdir/" ninja -C build install
}

