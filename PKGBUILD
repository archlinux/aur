# Maintainer: guglovich <your@email.com>
# Created with assistance from Claude (Anthropic)

pkgname=iris-yummy-anime
pkgver=0.2.4.1
pkgrel=1
pkgdesc="GTK4 client for Yummy Anime streaming service"
arch=('x86_64')
url="https://altlinux.space/alt-gnome/iris"
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
  "${pkgname}::git+https://altlinux.space/alt-gnome/iris.git#tag=${pkgver}"
  "libapi-base::git+https://altlinux.space/rirusha/libapi-base.git"
)
b2sums=('SKIP'
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
