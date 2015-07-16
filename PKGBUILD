# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>

_pkgbase=jacktrip
pkgname=${_pkgbase}-git
pkgver=1.1.r16.gb5ad0df
pkgrel=2
pkgdesc="Tool to manage and tune JACK settings for optimum performance between networked machines."
arch=('i686' 'x86_64')
url="https://github.com/jcacerec/jacktrip"
license=('MIT')
depends=('jack' 'qt5-base' 'rtaudio')
provides=('jacktrip')
conflicts=('jacktrip')
source=("git://github.com/jcacerec/${_pkgbase}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgbase}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  _branch=master
  cd "${srcdir}/${_pkgbase}"
  git checkout ${_branch}
}

build() {
   cd "${srcdir}/${_pkgbase}/${_pkgbase}/src"
  ./build
}

package() {
  cd "${srcdir}/${_pkgbase}/${_pkgbase}/src"
  install -Dm755 ${_pkgbase} "${pkgdir}/usr/bin/${_pkgbase}"
  install -d "${pkgdir}/usr/share/licenses/${_pkgbase}"
  sed -n '1,30p' ../documentation/documentation.cpp > "${pkgdir}/usr/share/licenses/${_pkgbase}/LICENSE"
}
