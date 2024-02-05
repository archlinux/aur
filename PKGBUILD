# Maintainer: Alyxia Sother <nylkvn@evfrhc.arg(rot13)>

pkgname=libhelium
pkgver=1.8.10
pkgrel=1
pkgdesc="The application framework for tauOS apps."
arch=('x86_64' 'aarch64')
depends=('gtk4' 'glib2' 'libgee')
makedepends=(
  'dart-sass'
  'git'
  'gobject-introspection'
  'meson'
  'ninja'
  'vala'
)
url="https://github.com/tau-OS/libhelium"
license=('LGPL3')

source=("$pkgname-$pkgver.tar.gz::https://github.com/tau-OS/libhelium/archive/refs/tags/$pkgver.tar.gz"
        "$pkgname.patch")
sha256sums=('f4963b7196e6456d6ba733f24ec7a746d1372ac84bd7677a4d960606b4e3c5c3'
            '332dea0fe8126f5e347e17f11dbaad5b565c7f99cf20424e7711aa29011ec858')

prepare() {
  cd "$srcdir/libhelium-$pkgver"

  meson subprojects download

  # Removes the automatic schema compilation, we're doing this ourselves
  patch --strip=1 --input="$srcdir/$pkgname.patch"
}

build() {
  cd "$srcdir/libhelium-$pkgver"

  arch-meson . builddir -Dvaladoc=false -Ddemo=false
  meson compile -C builddir
}

package() {
  cd "$srcdir/libhelium-$pkgver"

  meson install -C builddir --destdir "$pkgdir"

  # Manually add the schema into the right data dir.
  # We don't have to call glib-compile-schemas as glib2 contains a hook:
  # <https://gitlab.archlinux.org/archlinux/packaging/packages/glib2/-/blob/main/glib-compile-schemas.hook?ref_type=heads>
  install -Dm644 data/com.fyralabs.desktop.appearance.gschema.xml "$pkgdir/usr/share/glib-2.0/schemas/com.fyralabs.desktop.appearance.gschema.xml"
}
