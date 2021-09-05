# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=gulkan
pkgver=0.15.2
pkgrel=1
pkgdesc="GLib library for Vulkan abstraction"
arch=('i686' 'x86_64')
url="https://gitlab.freedesktop.org/xrdesktop/gulkan"
license=('MIT')
depends=('glibc' 'cairo' 'gdk-pixbuf2' 'glib2' 'graphene' 'vulkan-icd-loader')
makedepends=('meson' 'glslang' 'gtk-doc' 'vulkan-headers')
optdepends=('glew' 'glfw' 'libdrm')
source=("https://gitlab.freedesktop.org/xrdesktop/gulkan/-/archive/$pkgver/gulkan-$pkgver.tar.bz2"
        "fix_incompatible_types.patch::https://gitlab.freedesktop.org/xrdesktop/gulkan/-/commit/ea94e97a58538090f65fae3b94395e5c08d4b8ee.patch")
sha256sums=('f462688927817b7ca02fd8f493b34af33d795c72f146df100ac87143bb27d5ee'
            '8d949d3b1a3bdddb2189cbd7490740aaf661ab3a7f5a666dc9aac53525f80f35')


prepare() {
  cd "$pkgname-$pkgver"

  patch -Np1 -i "$srcdir/fix_incompatible_types.patch"
}

build() {
  cd "$pkgname-$pkgver"

  meson \
    --buildtype=plain \
    --prefix="/usr" \
    "_build"
  meson compile -C "_build"
}

check() {
  cd "$pkgname-$pkgver"

  #meson test -C "_build"
}

package() {
  cd "$pkgname-$pkgver"

  DESTDIR="$pkgdir" meson install -C "_build"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/gulkan"
}
