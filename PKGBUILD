# Maintainer: Torge Matthies <openglfreak at googlemail dot com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=libratbag
pkgname=libratbag-git
pkgver=0.11.r7.47cc5fc
pkgrel=1
pkgdesc='A DBus daemon to configure gaming mice - git version'
arch=('x86_64')
url='https://github.com/libratbag/libratbag'
license=('MIT')
depends=('glib2' 'libevdev' 'libudev.so' 'libunistring' 'json-glib' 'python' 'python-evdev')
optdepends=('linux: Linux 5.2 is required for Logitech wireless devices')
makedepends=('meson' 'swig' 'git' 'python-sphinx' 'python-sphinx_rtd_theme')
checkdepends=('check' 'valgrind' 'python-gobject' 'python-lxml')
source=('git+https://github.com/libratbag/libratbag.git')
sha512sums=('SKIP')
provides=('libratbag' "libratbag=$pkgver" 'ratbagd' 'liblur')
conflicts=('libratbag' 'ratbagd' 'liblur')

pkgver() {
  cd "$srcdir/$_pkgname"

  git describe | sed 's/^v//; s/-/.r/; s/-g/./'
}

prepare() {
  cd "$srcdir/$_pkgname"

  sed -i 's|sphinx-build3|sphinx-build|' doc/meson.build
}

build() {
  cd "$srcdir/$_pkgname"

  mkdir -p build
  cd build

  local check
  if (( CHECKFUNC )); then
    check=true
  else
    check=false
  fi

  arch-meson .. \
  	-Dsystemd-unit-dir=/usr/lib/systemd/system \
  	-Ddocumentation=true \
  	-Dtests="$check"

  ninja
}

check() {
  cd "$srcdir/$_pkgname"
  
  cd build

  meson test --no-rebuild
}

package() {
  cd "$srcdir/$_pkgname"
  
  cd build

  DESTDIR="$pkgdir" ninja install

  # Install documentation
  install -dm 755 "$pkgdir"/usr/share/doc/$pkgname
  cp -r -a --no-preserve=ownership doc/html "$pkgdir"/usr/share/doc/$pkgname

  # Install license
  install -Dm 644 ../COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

