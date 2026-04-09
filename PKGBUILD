# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=android_translation_layer
_upstream_pkgname=${pkgname//-/_}
pkgver=20260326.162e93fd
pkgrel=2
_commit=162e93fd08257632a785bea7e4e70343e582e9fe
pkgdesc='A translation layer for running Android apps on a Linux system'
url='https://gitlab.com/android_translation_layer/android_translation_layer'
arch=(x86_64 aarch64 armv7h)
license=('GPL-3.0-or-later')
# Upstream does not publish tags or releases; pin the current default-branch
# snapshot instead of tracking a moving checkout in this non -git package.
depends=(
  alsa-lib
  art_standalone
  bionic_translation
  ffmpeg
  fontconfig
  gcc-libs
  glibc
  gtk4
  gtk4-layer-shell
  java-runtime
  libdrm
  libglvnd
  libgudev
  libopensles-standalone
  libportal
  sqlite
  vulkan-icd-loader
  wayland
  webkitgtk-6.0
)
makedepends=(
  cmake
  glib2-devel
  java-runtime-common
  jdk8-openjdk
  meson
  openxr
  wayland-protocols
)
source=("${_upstream_pkgname}-${_commit}.tar.gz::${url}/-/archive/${_commit}/${_upstream_pkgname}-${_commit}.tar.gz")
sha256sums=('529cbc911622d6181898a7b390a7967108a627ac2c2cb4193f814b6e8090ffe3')

prepare() {
  meson subprojects download --sourcedir="${_upstream_pkgname}-${_commit}"
}

build() {
  arch-meson "${_upstream_pkgname}-${_commit}" build
  meson compile -C build
}

check() {
  meson test --no-rebuild --print-errorlogs -C build
}

package() {
  meson install --no-rebuild -C build --destdir "${pkgdir}"
  chown -R root:root "${pkgdir}"
}
