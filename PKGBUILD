# Maintainer: guglovich <your@email.com>
# Created with assistance from Claude (Anthropic)

pkgname=iris-yummy-anime
pkgver=0.2.3
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
b2sums=('b1adf76d35a15c734ad24c672f59064af290306c2e7b413b9c843518c2cc32667d18e32d251988ac24934a645c063acad62373f947ef9f6b5e4bed3a298aa519'
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
