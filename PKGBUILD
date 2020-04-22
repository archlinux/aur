# Maintainer: Wouter Wijsman <wwijsman@live.nl>

pkgname=dosbox-staging
_pkgver=0.75.0
_rc=rc1
pkgver=${_pkgver}.${_rc}
pkgrel=1
pkgdesc="DOS/x86 emulator focusing on ease of use. Based on DOSBox"
arch=('any')
url="https://github.com/dosbox-staging/dosbox-staging"
license=('GPL2')
depends=('sdl2' 'sdl2_net' 'opusfile'  'alsa-lib')
optdepends=('libpng' 'ncurses')
makedepends=('autoconf' 'automake' 'gcc' 'gzip')
provides=("dosbox")
conflicts=("dosbox")
source=(
  "https://github.com/dosbox-staging/${pkgname}/archive/v${_pkgver}-${_rc}.tar.gz"
)
md5sums=(
  '61ef380463ee89c15ccea6e7a3930913'
)

prepare() {
  cd "$srcdir/${pkgname}-${_pkgver}-${_rc}"
  FLAGS="-O3 -DNDEBUG -pipe"
  ./autogen.sh
  ./configure CFLAGS="$FLAGS" CXXFLAGS="$FLAGS" --prefix=/usr
}

build() {
  cd "$srcdir/${pkgname}-${_pkgver}-${_rc}"
  make -j "$(nproc)"
}

package() {
  cd "$srcdir/${pkgname}-${_pkgver}-${_rc}"

  # gzip the man file
  gzip -f "docs/dosbox.1" >  "docs/dosbox.1.gz"

  # install all files
  install -Dm 755 "src/dosbox" "$pkgdir/usr/bin/dosbox"
  install -Dm 644 "docs/dosbox.1.gz" "$pkgdir/usr/share/man/man1/dosbox.1.gz"

  # desktop file and icon
  install -Dm 644 "contrib/icons/dosbox-staging.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/dosbox-staging.svg"
  install -Dm 644 "contrib/linux/dosbox-staging.desktop" "$pkgdir/usr/share/applications/dosbox-staging.desktop"

  # dosbox-staging documents
  install -Dm 644 "README.md" "$pkgdir/usr/share/doc/${_pkgname}/README"
  install -Dm 644 "docs/README.video" "$pkgdir/usr/share/doc/${_pkgname}/video.txt"
  install -Dm 644 "README" "$pkgdir/usr/share/doc/${_pkgname}/manual.txt"
}
