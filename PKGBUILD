# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Thomas Baechler <thomas@archlinux.org>

_pkgbase=libfprint
pkgname=$_pkgbase-tudor
provides=($_pkgbase libfprint-2.so=2-64)
conflicts=($_pkgbase)

pkgver=1.94.2
pkgrel=1
pkgdesc="Library for fingerprint readers"
url="https://fprint.freedesktop.org/"
arch=(x86_64)
license=(LGPL)
depends=(libgusb pixman nss systemd libgudev)
makedepends=(git meson gtk-doc gobject-introspection python-pip)
checkdepends=(cairo)
groups=(fprint)
source=("git+https://github.com/Popax21/synaTudor/")
sha256sums=('SKIP')

prepare() {
  cp -r synaTudor/$_pkgbase/$_pkgbase $pkgname
  cd $pkgname
}

build() {
  cd $pkgname
  arch-meson build
  meson compile -C build
}

package() {
  cd $pkgname/build
  meson install --destdir "$pkgdir"
  cd -
  cd synaTudor/pydrv
#  python -m setuptools.launch setup.py install --install-dir="$pkgdir" --prefix="/usr/" 
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps .
}
