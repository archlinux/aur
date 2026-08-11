# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=android_translation_layer-git
_pkgname="${pkgname%-git}"
_pkgname="${_pkgname//-/_}"
pkgver=r1227.cf2c759f
pkgrel=2
pkgdesc='A translation layer for running Android apps on a Linux system'
url='https://gitlab.com/android_translation_layer/android_translation_layer'
arch=(x86_64 aarch64 armv7h)
license=('GPL-3.0-or-later')
# libopensles-standalone is not strictly required but some Android applications depend on it
depends=(
  alsa-lib
  art_standalone
  bionic_translation
  cairo
  ffmpeg
  fontconfig
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  graphene
  'gtk4>=4.14'
  gtk4-layer-shell
  java-runtime
  libdrm
  libglvnd
  libgudev
  libopensles-standalone
  libportal
  pango
  sqlite
  vulkan-icd-loader
  wayland
  webkitgtk-6.0
)
makedepends=(
  git
  glib2-devel
  java-runtime-common
  jdk8-openjdk
  meson
  openxr
  vulkan-headers
  'wayland-protocols>=1.12'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  meson subprojects download --sourcedir="${_pkgname}"
}

build() {
  arch-meson "${_pkgname}" build
  meson compile -C build
}

check() {
  meson test --no-rebuild --print-errorlogs -C build
}

package() {
  meson install --no-rebuild -C build --destdir "${pkgdir}"
}
