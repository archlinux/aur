# Maintainer: Cobalt Space <cobaltspace at protonmail dot com>
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>

_pkgname=gulkan
pkgname=${_pkgname}0.15
pkgver=0.15.2
pkgrel=1
pkgdesc="GLib library for Vulkan abstraction"
arch=('i686' 'x86_64')
url="https://gitlab.freedesktop.org/xrdesktop/gulkan"
provides=("gulkan=$pkgver")
license=('MIT')
depends=('glibc' 'cairo' 'gdk-pixbuf2' 'glib2' 'graphene' 'vulkan-icd-loader' 'xcb-util-keysyms')
makedepends=('meson' 'glslang' 'gtk-doc' 'vulkan-headers' 'glew' 'glfw' 'libdrm' 'pango' 'libegl' 'mesa' 'shaderc' 'json-glib' 'wayland' 'wayland-protocols')
optdepends=('glew' 'glfw' 'libdrm')
source=("https://gitlab.freedesktop.org/xrdesktop/gulkan/-/archive/$pkgver/gulkan-$pkgver.tar.bz2"
        "fix_incompatible_types.patch::https://gitlab.freedesktop.org/xrdesktop/gulkan/-/commit/ea94e97a58538090f65fae3b94395e5c08d4b8ee.patch")
sha256sums=('f462688927817b7ca02fd8f493b34af33d795c72f146df100ac87143bb27d5ee'
            '8d949d3b1a3bdddb2189cbd7490740aaf661ab3a7f5a666dc9aac53525f80f35')


prepare() {
  cd "$_pkgname-$pkgver"

  patch -Np1 -i "$srcdir/fix_incompatible_types.patch"
}

build() {
  arch-meson "$_pkgname-$pkgver" build -Dexamples=false -Dtests=false
  meson compile -C build
}

check() {
  true
  #meson test -C "build"
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "$_pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
