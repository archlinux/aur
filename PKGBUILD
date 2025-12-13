# Maintainer: DreamMaoMao <maoopzopaasnmakslpo@gmail.com>

pkgname=st-fl-git
_pkgname=st-fl
pkgver=0.9.3.r330.e14cfd7
pkgrel=1
pkgdesc='Simple terminal with flash jump support'
url='https://github.com/DreamMaoMao/st-fl.git'
arch=('i686' 'x86_64')
license=('MIT')
options=('zipman')
depends=('libxft' 'pcre2')
makedepends=('ncurses' 'libxext' 'git')

# include config.h and any patches you want to have applied here
source=("${_pkgname}::git+$url")
sha256sums=('SKIP')
provides=('st')
conflicts=('st')

pkgver() {
  cd "${_pkgname}"
  _pkgver=$(awk '/VERSION/ {print $3}' config.mk|head -1)
  echo "${_pkgver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"
  # skip terminfo which conflicts with nsurses
  sed -i '/tic /d' Makefile
  cp config.suggest.h config.h
}

build() {
  cd "${_pkgname}"
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd "${_pkgname}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
