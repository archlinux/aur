# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>

pkgname=jacktrip-git
pkgver=1.1.r17.gb5ad0df
pkgrel=1
pkgdesc="Tool to manage and tune JACK settings for optimum performance between networked machines."
arch=('i686' 'x86_64')
url="https://github.com/jcacerec/jacktrip"
license=('MIT')
depends=('jack' 'qt5-base' 'rtaudio')
provides=('jacktrip')
conflicts=('jacktrip')
source=("${pkgname}::git+https://github.com/jcacerec/jacktrip.git")
sha512sums=('SKIP')
_branch=master

pkgver() {
  cd "${srcdir}/${pkgname}"
  git checkout ${_branch} --quiet
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^jacktrip.//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}/${pkgname}"
  git checkout ${_branch}
}

build() {
   cd "${srcdir}/${pkgname}/jacktrip/src"
  ./build
}

package() {
  cd "${srcdir}/${pkgname}/jacktrip/src"
  install -Dm755 jacktrip "${pkgdir}/usr/bin/jacktrip"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  sed -n '1,30p' ../documentation/documentation.cpp > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
