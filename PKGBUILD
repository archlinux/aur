# Maintainer: Alyxia Sother <nylkvn@evfrhc.arg(rot13)>

pkgname=libhelium
pkgver="1.8.12.12"
_pkgver="1.8.12-12"
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

source=("$pkgname-$_pkgver.tar.gz::https://github.com/tau-OS/libhelium/archive/refs/tags/$_pkgver.tar.gz"
        "$pkgname.patch")
sha256sums=('991d02f7a9f5c2ea56a661b05d75ce516f8a9bc02cfc1b0c1011f4dd9ccad76e'
            '60551a15b530e5a9b5829720dd32aa1480b2e2dbece51cd680cbfa887af33352')

prepare() {
  cd "$srcdir/libhelium-$_pkgver"

  meson subprojects download

  # Removes the automatic schema compilation, we're doing this ourselves
  patch --strip=1 --input="$srcdir/$pkgname.patch"
}

build() {
  cd "$srcdir/libhelium-$_pkgver"

  arch-meson . builddir -Dvaladoc=false -Ddemo=false
  meson compile -C builddir
}

package() {
  cd "$srcdir/libhelium-$_pkgver"

  meson install -C builddir --destdir "$pkgdir"

  # Manually add the schema into the right data dir.
  # We don't have to call glib-compile-schemas as glib2 contains a hook:
  # <https://gitlab.archlinux.org/archlinux/packaging/packages/glib2/-/blob/main/glib-compile-schemas.hook?ref_type=heads>
  install -Dm644 data/com.fyralabs.desktop.appearance.gschema.xml "$pkgdir/usr/share/glib-2.0/schemas/com.fyralabs.desktop.appearance.gschema.xml"
}
