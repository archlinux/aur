
pkgname=dosbox-ece
_pkgver=4347
pkgver=${_pkgver}
pkgrel=1
pkgdesc="DOS/x86 emulator focusing on ease of use. Based on DOSBox"
arch=('any')
url="https://dosboxece.yesterplay.net/"
license=('GPLv2')
depends=('sdl2' 'sdl2_net' 'opusfile'  'alsa-lib' 'munt' 'openglide-git')
optdepends=('libpng' 'ncurses')
makedepends=('autoconf' 'automake' 'gcc' 'dos2unix')
provides=("dosbox")
conflicts=("dosbox")
source=(
  "https://dosboxece.yesterplay.net/download/DOSBox ECE r${_pkgver} (source).7z"
  "dosbox-ece.png"
  "dosbox-ece.desktop"
)
md5sums=('7b49c5d09863fddc9153a28ee35f9e84'
         '19fbd9958c0a412000d5fe7362774df1'
         '7ab512ca7e6bdb3616e197271ffae928')

build() {
  FLAGS="-O3 -DNDEBUG -pipe -I/usr/include/openglide"
  dos2unix autogen.sh
  chmod +x autogen.sh
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
