# Maintainer: envolution
# Contributor: Adam Goldsmith <contact@adamgoldsmith.name>
# Contributor: Janosch Dobler <janosch.dobler [at} gmx [dot} de>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=write_stylus
pkgver=jul.2025
pkgrel=1
pkgdesc="Write(orignal name) - A word processor for handwriting"
arch=(i686 x86_64)
url="http://www.styluslabs.com/"
license=('AGPL-3.0-only')
depends=(sdl2 pugixml libxi)
makedepends=(git)
source=(
  "${pkgname}::git+https://github.com/styluslabs/Write.git#tag=${pkgver//./-}"
  "http://www.styluslabs.com/write/eula.docx"
  git+https://github.com/styluslabs/nanovgXC.git
  git+https://github.com/styluslabs/ulib.git
  git+https://github.com/styluslabs/usvg.git
  git+https://github.com/styluslabs/ugui.git)
sha256sums=('f0749381323ba2794a22a227c10689a58d213a8b7da76232a03928cdfc1b8be4'
            '637c47c1843860a16f1ca87e2df5d72b4396ff23cefacf6244de95cdac23de6e'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
noextract=("eula.docx")

prepare() {
  git -C "${pkgname}" submodule init
  git -C "${pkgname}" config --local submodule.deps/nanovgXC.url "${srcdir}/nanovgXC"
  git -C "${pkgname}" config --local submodule.deps/ulib.url "${srcdir}/ulib"
  git -C "${pkgname}" config --local submodule.deps/usvg.url "${srcdir}/usvg"
  git -C "${pkgname}" config --local submodule.deps/ugui.url "${srcdir}/ugui"
  git -C "${pkgname}" -c protocol.file.allow='always' submodule update

  sed -i '/^#pragma once/a #include <cstdint>' write_stylus/usvg/svgnode.h
  sed -i 's#^Exec=.*#Exec=/usr/bin/write_stylus#' write_stylus/scribbleres/linux/Write.desktop
  sed -i 's#^Icon=.*#Icon=write_stylus#' write_stylus/scribbleres/linux/Write.desktop
  sed -i '/#ifndef NDEBUG/,/#endif/s/#define SCRIBBLE_TEST 1/#undef SCRIBBLE_TEST/' write_stylus/syncscribble/basics.h
}
build() {
  cd $pkgname/syncscribble
  DEBUG=0 make \
    CFLAGS+="$(pkg-config --cflags sdl2) -DPUGIXML_NO_XPATH -DPUGIXML_NO_EXCEPTIONS -I/usr/include -Wno-error -Wno-format-security -DNDEBUG" \
    CXXFLAGS+="$(pkg-config --cflags sdl2) -DPUGIXML_NO_XPATH -DPUGIXML_NO_EXCEPTIONS -I/usr/include -Wno-error -Wno-format-security -DNDEBUG" \
    LDFLAGS+="$(pkg-config --libs sdl2)" \
    USE_SYSTEM_SDL=1
}
package() {
  install -dm755 "$pkgdir/usr/share/$pkgname"
  install -Dm755 "$pkgname/syncscribble/Release/Write" "$pkgdir/usr/share/$pkgname/Write"
  install -Dm644 "$pkgname/scribbleres/fonts/"{DroidSansFallback.ttf,Roboto-Regular.ttf} "$pkgdir/usr/share/$pkgname/"
  install -Dm644 "$pkgname/scribbleres/Intro.svg" "$pkgdir/usr/share/$pkgname/"

  install -dm755 "$pkgdir/usr/bin/"
  ln -s /usr/share/$pkgname/Write "$pkgdir/usr/bin/write_stylus"

  install -Dm644 "eula.docx" "$pkgdir/usr/share/licenses/$pkgname/eula.docx"

  install -Dm644 "$pkgname/scribbleres/linux/Write.desktop" "$pkgdir/usr/share/applications/Write.desktop"
  install -Dm644 "$pkgname/scribbleres/linux/Write144x144.png" "$pkgdir/usr/share/pixmaps/write_stylus.png"
}

# vim:set ts=2 sw=2 et:
