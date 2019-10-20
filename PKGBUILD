# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=jalv
pkgname="${_pkgname}-git"
pkgver=1.6.2.r458.87416ac
pkgrel=1
pkgdesc="A simple but fully featured LV2 host for Jack (git version)"
arch=('i686' 'x86_64')
url="http://drobilla.net/software/${_pkgname}/"
license=('custom:ISC')
depends=('jack' 'lilv' 'suil')
makedepends=('git' 'gtk2' 'gtk3' 'gtkmm' 'python' 'qt5-base')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
optdepends=('gtk2: Gtk+ 2.x frontend'
            'gtk3: Gtk+ 3.x frontend'
            'gtkmm: Gtk++ 2.x frontend'
            'qt5-base: Qt 5.x frontend')
source=("${_pkgname}::git+http://gitlab.com/drobilla/${_pkgname}.git"
        'autowaf::git+https://gitlab.com/drobilla/autowaf.git')
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  local ver=`grep "^JALV_VERSION" wscript | cut -d "'" -f 2`
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  git submodule init
  git config submodule.waflib.url "${srcdir}/autowaf"
  git submodule update
}

build() {
  cd "${srcdir}/${_pkgname}"

  python waf configure \
    --prefix=/usr \
    --no-qt4
  python waf build $MAKEFLAGS
}

package() {
  cd "${srcdir}/${_pkgname}"

  python waf install --destdir="$pkgdir"

  # license
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/${pkgname}"
}
