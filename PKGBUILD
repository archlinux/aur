# Maintainer: kotontrion <kotontrion@tutanota.de>
pkgname=aylurs-gtk-shell
_pkgname=ags
pkgver=3.1.1
pkgrel=2
pkgdesc="Aylurs's Gtk Shell (AGS), An eww inspired gtk widget system."
arch=('x86_64')
url="https://github.com/Aylur/ags"
license=('GPL-3.0-only')
makedepends=('go' 'meson')
depends=('gjs'
         'gtk4-layer-shell'
         'gobject-introspection'
         'libastal'
         'libastal-4'
         'npm'
        )
optdepends=('libastal-meta: provides all astal libs, needed for eg bluetooth, audio, etc'
            'blueprint-compiler: required to define widgets using blueprint'
            'dart-sass: required for compilation of scss to css'
            'gtk-layer-shell: required when using gtk3'
           )
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/Aylur/ags/archive/refs/tags/v${pkgver}.tar.gz"
  "gnim.patch"
  )
sha256sums=('83e18c1c8ac9f44e562250b199493c9783b8dbff33d25b0e4be1eb91d6767eb9'
            '3cb617318848fe0f253abc92c360dc8e5656a0ea13617831c3535cc324d38d9a')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  npm install
  patch -Np1 -i ../gnim.patch
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  export GOPATH="$srcdir"
  arch-meson build
  meson compile -C build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  meson install -C build --destdir "$pkgdir"
}

