# Maintainer: kotontrion <kotontrion@tutanota.de>
pkgname=aylurs-gtk-shell
_pkgname=ags
pkgver=3.1.0
pkgrel=1
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/Aylur/ags/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b8b859207b52dd2c83202f9c45630136b7f5cdbf4c098c90fa3b8ff652c220ac')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  export GOPATH="$srcdir"
  npm install
  arch-meson build
  meson compile -C build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  meson install -C build --destdir "$pkgdir"
}

