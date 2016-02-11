# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=jalv
pkgname="${_pkgname}-git"
pkgver=1.4.7.r311.1ed0a84
pkgrel=1
pkgdesc="A simple but fully featured LV2 host for Jack"
arch=('i686' 'x86_64')
url="http://drobilla.net/software/${_pkgname}/"
license=('custom:ISC')
depends=('lilv' 'suil')
makedepends=('gtk2' 'gtk3' 'gtkmm' 'jack' 'python' 'qt4' 'qt5-base')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
optdepends=('gtk2: Gtk+ 2.x frontend'
            'gtk3: Gtk+ 3.x frontend'
            'gtkmm: Gtk++ 2.x frontend'
            'qt4: Qt 4.x frontend'
            'qt5-base: Qt 5.x frontend')
source=("${_pkgname}::git+http://git.drobilla.net/${_pkgname}.git")
md5sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"

  local ver=`grep "^JALV_VERSION" wscript | cut -d "'" -f 2`
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"

  CXXFLAGS+=' -std=c++11'
  python waf configure --prefix=/usr
  python waf
}

package() {
  cd "${srcdir}/${_pkgname}"

  python waf install --destdir="$pkgdir"

  # license
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
