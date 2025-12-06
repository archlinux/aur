# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=suil
pkgname="$_pkgname-git"
pkgver=0.10.24.r494.58f6da4
pkgrel=1
pkgdesc='Lightweight C library for loading and wrapping LV2 plugin UIs (git version)'
arch=(x86_64)
url='http://drobilla.net/software/suil/'
license=(ISC)
makedepends=(
  doxygen
  git
  gtk2
  gtk3
  lv2
  meson
  python
  python-sphinx
  python-sphinx-lv2-theme
  qt5-base
  qt6-base
)
optdepends=('gtk2: GTK+ 2.x UI wrapping support'
            'gtk3: GTK+ 3.x UI wrapping support'
            'qt5-base: Qt 5.x UI wrapping support'
            'qt6-base: Qt 6.x UI wrapping support')
provides=($_pkgname "$_pkgname=${pkgver//.r*/}" $_pkgname-docs)
conflicts=($_pkgname $_pkgname-svn)
source=("$_pkgname::git+https://gitlab.com/lv2/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  local ver=$(grep -E "^\s+version: '[0-9]+\.[0-9]+\.[0-9]+'" meson.build | cut -d "'" -f 2)
  echo $ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  arch-meson $_pkgname $_pkgname-build \
    -Dcocoa=disabled \
    -Ddocs=enabled \
    -Dgtk2=enabled \
    -Dgtk3=enabled \
    -Dqt5=enabled \
    -Dqt6=enabled \
    -Dsinglehtml=enabled \
    -Dx11=enabled
  meson compile -C $_pkgname-build
}

# project has no tests (yet?)
#check() {
#  meson test -C $_pkgname-build
#}

package() {
  provides+=(libsuil-0.so)
  meson install -C $_pkgname-build --destdir "$pkgdir"
  # license
  install -vDm 644 $_pkgname/COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
  # documentation
  mv -v "$pkgdir"/usr/share/doc/{$_pkgname-0,$pkgname}
  install -vDm 644 $_pkgname/{AUTHORS,NEWS,README.md} -t "$pkgdir"/usr/share/doc/$pkgname
}
