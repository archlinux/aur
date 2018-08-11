# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>

pkgname=jacktrip-git
pkgver=1.1.r30.g0507560
pkgrel=1
pkgdesc="Tool to manage and tune JACK settings for optimum performance between networked machines."
arch=('i686' 'x86_64')
url="https://github.com/jcacerec/jacktrip"
license=('MIT' 'custom')
depends=('jack' 'qt5-base' 'rtaudio')
makedepends=('doxygen' 'git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+https://github.com/jcacerec/jacktrip.git")
sha512sums=('SKIP')
_branch=master

prepare() {
  cd "${pkgname%-*}"
  git checkout ${_branch}
  
  # Fix missing /externals/
  [[ -f ${srcdir}/${pkgname%-*}/src/RtAudio.h ]] || ln -s ${srcdir}/${pkgname%-*}/externals/rtaudio-4.1.1/RtAudio.h ${srcdir}/${pkgname%-*}/src/RtAudio.h
  [[ -f ${srcdir}/${pkgname%-*}/src/RtAudio.cpp ]] || ln -s ${srcdir}/${pkgname%-*}/externals/rtaudio-4.1.1/RtAudio.cpp ${srcdir}/${pkgname%-*}/src/RtAudio.cpp
}

pkgver() {
  cd "${pkgname%-*}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${pkgname%-*}/src"
  ./build
  cd ..
  doxygen "${pkgname%-*}_doxygen"
}

package() {
  cd "${pkgname%-*}/src"
  install -Dm755 ${pkgname%-*} "${pkgdir}/usr/bin/${pkgname%-*}"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  sed -n '1,30p' ../documentation/documentation.cpp > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -t "${pkgdir}/usr/share/doc/${pkgname}/html" \
    -Dm644 ../WWW/html/*
}
