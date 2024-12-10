# Maintainer: envolution
# Contributor: Adam Goldsmith <contact@adamgoldsmith.name>
# Contributor: Janosch Dobler <janosch.dobler [at} gmx [dot} de>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=write_stylus
pkgver=dec.2024
pkgrel=1
pkgdesc="Write(orignal name) - A word processor for handwriting"
arch=(i686 x86_64)
url="http://www.styluslabs.com/"
license=('custom')
depends=(sdl2 pugixml)
options=(!lto)
makedepends=(git)
source=(
  "${pkgname}::git+https://github.com/styluslabs/Write.git#tag=${pkgver//./-}"
  https://github.com/styluslabs/nanovgXC.git
  https://github.com/styluslabs/ulib.git
  https://github.com/styluslabs/usvg.git
  https://github.com/styluslabs/ugui.git
  "http://www.styluslabs.com/write/eula.docx")
sha256sums=('0991c0817d797b457c2d9d7474080536797155b16f50ef9b3379224e8d44ba99'
            '67bd26854dbc12a6ea97f44ee618b1bb08ba5a67f68ef309e7a1280ced8d5e9d'
            '50dbc3ef8beed0fd0194a57da1dff0a227e90e6a40edf513745488f8d7bc4d12'
            '56374d4c079c5851f33dbc4026b4af4d53aee47e39df69a444abdedbe9a698b6'
            '13c8c6d1751e61bf455b1a22cbefb3d3c6a3e44911cac37d8c550d455a315eb8'
            '637c47c1843860a16f1ca87e2df5d72b4396ff23cefacf6244de95cdac23de6e')
noextract=("eula.docx")

prepare() {
  git -C "${pkgname}" submodule init
  git -C "${pkgname}" config --local submodule.deps/nanovgXC.url "${srcdir}/nanovgXC"
  git -C "${pkgname}" config --local submodule.deps/ulib.url "${srcdir}/ulib"
  git -C "${pkgname}" config --local submodule.deps/usvg.url "${srcdir}/usvg"
  git -C "${pkgname}" config --local submodule.deps/ugui.url "${srcdir}/ugui"
  git -C "${pkgname}" -c protocol.file.allow='always' submodule update

  sed -i 's#^Exec=.*#Exec=/usr/bin/write_stylus#' write_stylus/scribbleres/linux/Write.desktop
  sed -i 's#^Icon=.*#Icon=write_stylus#' write_stylus/scribbleres/linux/Write.desktop

}
build() {
  cd $pkgname/syncscribble
  make \
    CFLAGS+="$(pkg-config --cflags sdl2) -DPUGIXML_NO_XPATH -DPUGIXML_NO_EXCEPTIONS -I/usr/include -Wno-error -Wno-format-security" \
    CXXFLAGS+="$(pkg-config --cflags sdl2) -DPUGIXML_NO_XPATH -DPUGIXML_NO_EXCEPTIONS -I/usr/include -Wno-error -Wno-format-security" \
    LDFLAGS+="$(pkg-config --libs sdl2)" \
    USE_SYSTEM_SDL=1 \
    DEBUG=0
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
