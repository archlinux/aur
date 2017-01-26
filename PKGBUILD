pkgname=skypeforlinux
pkgver=1.16.0.1
pkgrel=1
pkgdesc="Skype for Linux WebRTC Alpha"
arch=(x86_64 i686)
url="https://www.skype.com/"
license=(custom)
depends=(electron libgnome-keyring)
makedepends=(asar npm python2)
source=(https://repo.skype.com/deb/pool/main/s/$pkgname/${pkgname}_${pkgver}_amd64.deb
        $pkgname.sh)
sha256sums=('147269e9064a4dcbeb86e5e3ad81693c16d3d458b44640e47e4b92cd9f020183'
            '0aca67c5c2cd1be1e7b7a2d2f126cdf0310f8a85985c1aba31540fcc2892eafa')

prepare() {
  tar -xf data.tar.xz
  asar extract usr/share/skypeforlinux/resources/app.asar skypeforlinux
  mv skypeforlinux/node_modules/skype-electron-wrapper .
  rm -r skypeforlinux/node_modules/*
  sed -i '13i\"dependencies": {"skype-electron-wrapper": "*", "debug": "2.4"},' skypeforlinux/package.json
  sed -i 's|\("keytar": \).*|\1"^3.0.2",|' skype-electron-wrapper/package.json
}

build() {
  mv skype-electron-wrapper skypeforlinux/node_modules
  cd $pkgname
  export npm_config_target=$(</usr/lib/electron/version)
  export npm_config_disturl=https://atom.io/download/atom-shell
  HOME=~/.electron-gyp npm install --production
}

package() {
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
