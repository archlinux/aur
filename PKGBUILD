# Maintainer: Marco <marcomania2012 at gmail dot com>

pkgname=dosbox-ece
_pkgver=4479
pkgver=${_pkgver}
pkgrel=1
pkgdesc="DOS/x86 emulator focusing on ease of use. Based on DOSBox"
arch=('x86_64')
url="https://yesterplay.net/dosboxece/"
license=('GPLv2')
depends=('sdl2' 'sdl2_net' 'opusfile'  'alsa-lib' 'munt' 'openglide-git')
optdepends=('libpng' 'ncurses')
makedepends=('autoconf' 'automake' 'gcc' 'dos2unix')
provides=("dosbox")
conflicts=("dosbox")
source=(
  "https://yesterplay.net/dosboxece/download/DOSBox%20ECE%20r${_pkgver}%20(source).7z"
  "dosbox-ece.png"
  "dosbox-ece.desktop"
)
sha256sums=('53621a1f62cc602c41b9c25b84cd1e5e13926ab315714eb1fafc3bc1119e51ec'
            'd119e08a87289ec279c6d794f9192c929893563ffdc9b5fe41a519f85d7b988d'
            'f8af5935e8a4d8d8472f491f5f9f2f57a4365b05f093c592d3504b6726afce5e')

build() {
  FLAGS="-O3 -DNDEBUG -pipe -I/usr/include/openglide"
  dos2unix autogen.sh
  chmod +x autogen.sh
  autoupdate
  ./autogen.sh
  ./configure CFLAGS="$FLAGS" CXXFLAGS="$FLAGS" --prefix=/usr
  make -j "$(nproc)"
}

package() {
  # gzip the man file
  gzip -f "docs/dosbox.1" >  "docs/dosbox.1.gz"

  # install all files
  install -Dm 755 "src/dosbox" "$pkgdir/usr/bin/dosbox"
  install -Dm 644 "docs/dosbox.1.gz" "$pkgdir/usr/share/man/man1/dosbox.1.gz"

  # desktop file and icon
  install -Dm 644 "dosbox-ece.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/dosbox-ece.png"
  install -Dm 644 "dosbox-ece.desktop" "$pkgdir/usr/share/applications/dosbox-eve.desktop"

  # dosbox-ece documents
  install -Dm 644 "docs/README.video" "$pkgdir/usr/share/doc/${_pkgname}/video.txt"
  install -Dm 644 "README" "$pkgdir/usr/share/doc/${_pkgname}/README"
}
