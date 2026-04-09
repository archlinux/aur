# Maintainer: kotontrion <kotontrion@tutanota.de>
pkgname=aylurs-gtk-shell
_pkgname=ags
pkgver=3.1.2
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
sha256sums=('7c9bf38cddfa9661ca3bc70268df0f3124174dad0d6ff85433445816471690f4')

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

