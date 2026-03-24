# Maintainer: guglovich <your@email.com>
# Created with assistance from Claude (Anthropic)

pkgname=iris-yummy-anime
pkgver=0.2.2
pkgrel=1
pkgdesc="GTK4 client for Yummy Anime streaming service"
arch=('x86_64')
url="https://altlinux.space/x1z53/iris"
license=('GPL-3.0-only')
provides=('yummy-anime-gtk')
replaces=('yummy-anime-gtk')
depends=(
  'gtk4'
  'libadwaita'
  'json-glib'
  'webkitgtk-6.0'
  'libwebp'
)
makedepends=(
  'meson'
  'ninja'
  'vala'
  'blueprint-compiler'
  'git'
)
options=('!debug')
source=(
  "${pkgname}::git+https://altlinux.space/x1z53/iris.git#tag=${pkgver}"
  "libapi-base::git+https://altlinux.space/rirusha/libapi-base.git"
)
b2sums=('c974429de1d80643f3f39edfac2cfc85265e526b1d6f9dcd4d42221a7e3342fc5c3562bcac70bfa05d1bfadd684fb0bd05fd1d6f5c2a7de42c4cfc08d111ffdf'
        'SKIP')

prepare() {
  cd "${pkgname}"

  # Link libapi-base subproject so meson does not need network during build.
  mkdir -p subprojects
  ln -sf "${srcdir}/libapi-base" subprojects/libapi-base
}

build() {
  arch-meson "${pkgname}" build \
    -Dis_devel=false \
    --wrap-mode=nodownload

  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
