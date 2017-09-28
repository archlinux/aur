pkgname=skypeforlinux
pkgver=8.7.76.59440
pkgrel=1
pkgdesc="Skype for Linux WebRTC Beta"
arch=(x86_64 i686)
url="https://www.skype.com/"
license=(custom)
depends=(electron libgnome-keyring)
makedepends=(asar npm python2)
source=(https://repo.skype.com/deb/pool/main/s/$pkgname/${pkgname}_${pkgver}_amd64.deb
        $pkgname.sh)
sha256sums=('60be3967a1a83f009f7f57a3b238b00c8b5635d19c7f92b8bc2d3c25d7500a00'
            '0aca67c5c2cd1be1e7b7a2d2f126cdf0310f8a85985c1aba31540fcc2892eafa')

prepare() {
  cd "$srcdir"

  tar -xf data.tar.xz
  asar extract usr/share/skypeforlinux/resources/app.asar skypeforlinux
  rm -r skypeforlinux/node_modules/*
}

build() {
  cd "$srcdir/$pkgname"

  export npm_config_target=$(</usr/lib/electron/version)
  export npm_config_disturl=https://atom.io/download/atom-shell
  HOME="$srcdir/.electron-gyp" npm install --production
}

package() {
  cd "$srcdir"

  mkdir -p "$pkgdir"/usr/{lib,share}
  cp -r $pkgname "$pkgdir/usr/lib/$pkgname"
  install -Dm755  $pkgname.sh "$pkgdir/usr/bin/$pkgname"
  cp -r usr/share/{applications,icons,pixmaps} "$pkgdir/usr/share"
  cp -r usr/share/doc "$pkgdir/usr/share/licenses"

  # Clean up
  find "$pkgdir/usr/lib/$pkgname/node_modules" \
      -name "package.json" \
        -exec sed -e "s|$srcdir/$pkgname|/usr/lib/$pkgname|" \
            -i {} \; \
      -or -name ".*" -prune -exec rm -r '{}' \; \
      -or -name "*.gyp" -prune -exec rm -r '{}' \; \
      -or -name "*.gypi" -prune -exec rm -r '{}' \; \
      -or -name "*.mk" -prune -exec rm -r '{}' \; \
      -or -name "*Makefile" -prune -exec rm -r '{}' \; \
      -or -name "bin" -prune -exec rm -r '{}' \; \
      -or -name "doc" -prune -exec rm -r '{}' \; \
      -or -name "example" -prune -exec rm -r '{}' \; \
      -or -name "nan" -prune -exec rm -r '{}' \; \
      -or -name "obj.target" -prune -exec rm -r '{}' \; \
      -or -name "script" -prune -exec rm -r '{}' \; \
      -or -name "src" -prune -exec rm -r '{}' \; \
      -or -name "test" -prune -exec rm -r '{}' \;
}
