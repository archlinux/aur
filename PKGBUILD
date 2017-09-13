# Maintainer: muzhed <chustokes@126.com>

pkgname=din
pkgver=29
pkgrel=1
pkgdesc="A sound synthesizer and musical instrument."
arch=("i686" "x86_64")
url="http://dinisnoise.org/"
license=('GPL2')
depends=('jack' 'libgl' 'sdl' 'tcl')
makedepends=('boost')
install=$pkgname.install
source=("https://archive.org/download/dinisnoise_source_code/$pkgname-$pkgver.tar.gz"
        din.png
        din.desktop)
md5sums=('a55e6eb3f1e112150481ad75894b3ea4'
         '50ca4dc107eaa0d5b6a1efe21c469bd7'
         'e38840354b0f197079e6bbeda03c8613')


build() {
  cd "$srcdir"/"$pkgname-$pkgver"

  autoreconf -fvi
  # use alsa instead of jack
  # ./configure CXXFLAGS="-O3 -D__UNIX_ALSA__" CFLAGS=-O3
  ./configure CXXFLAGS="-O3 -D__UNIX_JACK__" CFLAGS=-O3
  make
}

package() {
  cd "$srcdir"/"$pkgname-$pkgver"
  install -Dm755 src/din "$pkgdir/usr/lib/din/din"
  cp -r "src/factory" "$pkgdir/usr/lib/din"
  ln -s "/usr/lib/din/factory" "$pkgdir/usr/lib/din/user"

  # install exec script
  mkdir -p "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/din" <<EOF
#!/bin/sh

DIN_HOME_DIR="\${HOME}/.config/din"
DIN_INSTALL_DIR="/usr/lib/din"

mkdir -p "\${DIN_HOME_DIR}"

# copy files so that user could save settings
cp -rn "\${DIN_INSTALL_DIR}/factory" "\${DIN_HOME_DIR}"
cp -rn "\${DIN_INSTALL_DIR}/din" "\${DIN_HOME_DIR}"

cd "\${DIN_HOME_DIR}"
exec ./din "\$@"
EOF
  chmod +x "$pkgdir/usr/bin/din"

  # install license
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/din/LICENSE"

  # install icon and desktop file
  cd "$srcdir"
  install -Dm644 $pkgname.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
