# Maintainer: Alyxia Sother <nylkvn@evfrhc.arg(rot13)>

_pkgname=libhelium
pkgname="${_pkgname}-git"
pkgver=r1594.f173173
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
provides=("$_pkgname")
conflicts=("$_pkgname")

source=("$_pkgname::git+https://github.com/tau-OS/libhelium.git"
        "$pkgname.patch")
sha256sums=('SKIP'
            '10cf52c999db7484dc3bf220772cfa58f58c9d539c43c968727251bbf60e8ad6')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  meson subprojects download

  # Removes the automatic schema compilation, we're doing this ourselves
  patch --strip=1 --input="$srcdir/$pkgname.patch"
}

build() {
  cd "${srcdir}/${_pkgname}"

  arch-meson . builddir -Dvaladoc=false -Ddemo=false
  meson compile -C builddir
}

package() {
  cd "${srcdir}/${_pkgname}"

  meson install -C builddir --destdir "$pkgdir"

  # Manually add the schema into the right data dir.
  # We don't have to call glib-compile-schemas as glib2 contains a hook:
  # <https://gitlab.archlinux.org/archlinux/packaging/packages/glib2/-/blob/main/glib-compile-schemas.hook?ref_type=heads>
  install -Dm644 data/com.fyralabs.desktop.appearance.gschema.xml "$pkgdir/usr/share/glib-2.0/schemas/com.fyralabs.desktop.appearance.gschema.xml"
}
