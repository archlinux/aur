# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=suil
pkgname="${_pkgname}-git"
pkgver=0.10.4.r322.ee6ee77
pkgrel=1
pkgdesc="Lightweight C library for loading and wrapping LV2 plugin UIs (git version)"
arch=('i686' 'x86_64')
url="http://drobilla.net/software/suil/"
license=('custom:ISC')
makedepends=('git' 'gtk2' 'gtk3' 'lv2' 'python' 'qt5-base')
optdepends=('gtk2: GTK+ 2.x UI wrapping support'
            'gtk3: GTK+ 3.x UI wrapping support'
            'qt5-base: Qt 5.x UI wrapping support')
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

  # remove local call to ldconfig
  sed -i "/ldconfig/d" wscript
}

build() {
  cd "${srcdir}/${_pkgname}"

  python waf configure \
    --prefix=/usr \
    --configdir=/etc \
    --no-qt4
  python waf build $MAKEFLAGS
}

package() {
  cd "${srcdir}/${_pkgname}"

  python waf install --destdir="${pkgdir}"
  install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
