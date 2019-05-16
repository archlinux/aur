# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=suil
pkgname="${_pkgname}-git"
pkgver=0.10.3.r311.0229219
pkgrel=2
pkgdesc="A lightweight C library for loading and wrapping LV2 plugin UIs"
arch=('i686' 'x86_64')
url="http://drobilla.net/software/suil/"
license=('custom:ISC')
makedepends=('git' 'gtk2' 'lv2' 'python' 'qt4' 'qt5-base')
optdepends=('qt4: Qt 4.x UI wrapping support'
            'qt5-base: Qt 5.x UI wrapping support'
            'gtk2: GTK+ 2.x UI wrapping support')
provides=("${_pkgname}" "${_pkgname}=${pkgver//.r*/}")
conflicts=("${_pkgname}" "${_pkgname}-svn")
source=("${_pkgname}::git+https://gitlab.com/lv2/${_pkgname}.git"
        'autowaf::git+https://gitlab.com/drobilla/autowaf.git')
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  local ver=`grep "^SUIL_VERSION" wscript | cut -d "'" -f 2`
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

  python waf configure --prefix=/usr --configdir=/etc
  python waf build $MAKEFLAGS
}

package() {
  cd "${srcdir}/${_pkgname}"

  python waf install --destdir="${pkgdir}"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${_svnname}/LICENSE"
}
