# Maintainer: kotontrion <kotontrion@tutanota.de>
pkgname=aylurs-gtk-shell-git
_pkgname=ags
pkgver=3.1.1.r0.ge169694
pkgrel=2
pkgdesc="Aylurs's Gtk Shell (AGS), An eww inspired gtk widget system."
arch=('x86_64')
url="https://github.com/Aylur/ags"
license=('GPL-3.0-only')
makedepends=('git' 'meson' 'go')
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
source=("git+${url}.git" "gnim.patch")
sha256sums=('SKIP'
            '3cb617318848fe0f253abc92c360dc8e5656a0ea13617831c3535cc324d38d9a')
provides=('aylurs-gtk-shell')
conflicts=('aylurs-gtk-shell')

pkgver(){
  cd $srcdir/$_pkgname
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $srcdir/$_pkgname
  npm install
  patch -Np1 -i ../gnim.patch
}

build() {
  cd $srcdir/$_pkgname
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
  cd $srcdir/$_pkgname
  meson install -C build --destdir "$pkgdir"
}


