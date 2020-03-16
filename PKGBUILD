# Maintainer: Wouter Wijsman <wwijsman@live.nl>

pkgname=dosbox-staging
pkgver=v0.75.0.pre
pkgrel=1
pkgdesc="A modernized DOSBox project using current development practices and tools, fixing issues, adding features that better support today's systems"
arch=('any')
url="https://github.com/dreamer/dosbox-staging"
license=('GPL2')
depends=('sdl2' 'sdl2_net' 'opusfile'  'alsa-lib')
optdepends=('libpng' 'ncurses')
makedepends=('autoconf' 'automake' 'gcc' 'gzip')
provides=("dosbox")
conflicts=("dosbox")
source=(
  "https://github.com/dreamer/dosbox-staging/archive/v0.75.0-pre.tar.gz"
  "dosbox-staging.svg"
  "dosbox-staging.desktop"
)
md5sums=(
  'fb08c1fe032a7832c3ee8989526c7d95'
  'ecb87451af9e962513d32dc452aa7213'
  'a0d2462e8e6a1cb0e1e09c318e280414'
)

prepare() {
  cd "$srcdir/$pkgname-0.75.0-pre"
  FLAGS="-O3 -DNDEBUG -pipe"
  ./autogen.sh
  ./configure CFLAGS="$FLAGS" CXXFLAGS="$FLAGS" --prefix=/usr
}

build() {
  cd "$srcdir/$pkgname-0.75.0-pre"
  make -j "$(nproc)"
}

package() {
  # Install desktop files
  install -Dm 644 "$srcdir/$pkgname.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -Dm 644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  cd "$srcdir/$pkgname-0.75.0-pre"
  # gzip the man file
  gzip -f "docs/dosbox.1" >  "docs/dosbox.1.gz"

  # install all other files
  install -Dm 755 "src/dosbox" "$pkgdir/usr/bin/dosbox"
  install -Dm 644 "docs/dosbox.1.gz" "$pkgdir/usr/share/man/man1/dosbox.1.gz"

  # documentation
  install -Dm 644 "docs/README.video" "$pkgdir/usr/share/doc/${_pkgname}/video.txt"
  install -Dm 644 "README" "$pkgdir/usr/share/doc/${_pkgname}/manual.txt"

  # This should be used once the desktop file and icon are included in the next release
  #install -Dm 644 "contrib/icons/dosbox-staging.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/dosbox-staging.svg"
  #install -Dm 644 "contrib/linux/dosbox-staging.desktop" "$pkgdir/usr/share/applications/dosbox-staging.svg"
}
