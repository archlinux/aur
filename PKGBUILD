# Maintainer: Bruno Unna <bruno dot unna at gmail dot com>
pkgname='euclidean-rhythms'
pkgver='1.0.0'
pkgrel='1'
pkgdesc="An implementation of the Euclidean rhythms idea in the form of an LV2 plugin"
arch=('x86_64')
url="https://github.com/bruno-unna/euclidean-rhythms"
license=('GPL3')
groups=('lv2-plugins' 'pro-audio')
makedepends=('lv2>=1.18.10' 'meson>=1.4.0' 'ninja>=1.11.1')
optdepends=('ardour: to have a host for the plugin')
source=("euclidean-rhythms-$pkgver::git+https://github.com/bruno-unna/euclidean-rhythms.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  git -C euclidean-rhythms-$pkgver submodule update --init --recursive
}

build() {
  make -C $srcdir/euclidean-rhythms-$pkgver/src/BWidgets bwidgets
  arch-meson $pkgname-$pkgver build # --prefix=/usr --libdir=/usr/lib
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
