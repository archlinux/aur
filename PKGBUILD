# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_reponame=Xmonk.lv2
_pkgname=xmonk-lv2
pkgname="${_pkgname}-git"
pkgver=0.1.r13.cb62b06
pkgrel=1
pkgdesc="A simple sound generator LV2 plugin to have some fun with (git version)"
arch=('i686' 'x86_64')
url="https://github.com/brummer10/Xmonk"
license=('0BSD')
depends=('cairo')
makedepends=('git')
groups=('pro-audio' 'lv2-plugins')
provides=("${_pkgname}" "${_pkgname}=${pkgver//.r*/}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/brummer10/${_reponame}.git"
        'xputty::git+https://github.com/brummer10/Xputty.git')
md5sums=('SKIP' 'SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"

  local ver="$(grep '^\s*VER =' Xmonk/Makefile | cut -d ' ' -f 3)"
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  git submodule init
  git config submodule.Xputty.url "${srcdir}/xputty"
  git submodule update
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
