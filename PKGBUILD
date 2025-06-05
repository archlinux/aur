# Maintainer: linkfrg <linkfrg.dev@proton.me>
pkgname=python-ignis-git
_pkgname=ignis
pkgver=0.5.r61.g1515f46
pkgrel=2
pkgdesc="A widget framework for building desktop shells, written and configurable in Python"
arch=('x86_64')
url="https://github.com/ignis-sh/ignis"
license=('LGPL-2.1-or-later')
makedepends=(gobject-introspection
             meson
             meson-python
             python-build
             python-installer
             python-wheel)
depends=(python
         glib2
         glib2-devel
         gtk4
         gtk4-layer-shell
         libpulse
         python-cairo
         python-gobject
         python-click
         python-loguru
         python-rich)
optdepends=('gst-plugin-pipewire: required for Recorder Service'
            'gst-plugins-good: required for Recorder Service'
            'gst-plugins-ugly: required for Recorder Service'
            'networkmanager: required for Network Service'
            'dart-sass: SASS/SCSS compilation support'
            'upower: required for UPower Service'
            'gnome-bluetooth-3.0: required for Bluetooth Service')

provides=('python-ignis' 'ignis' 'ignis-git')
conflicts=('python-ignis' 'ignis' 'ignis-git')
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $srcdir/$_pkgname
  meson subprojects download
}

build() {
  cd $srcdir/$_pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $srcdir/$_pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
