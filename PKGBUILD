# $Id$
# Contributor: Albakham <contact@geber.ga>

pkgname=protonmail-desktop-unofficial
pkgver=1.0.2
pkgrel=1
pkgdesc="Unofficial app that emulates a native client for the ProtonMail e-mail service"
arch=(any)
url="https://github.com/protonmail-desktop/application"
license=(MIT)
depends=(electron)
makedepends=(npm)
provides=(protonmail-desktop)
conflicts=(protonmail-desktop)
options=(!strip)
source=($pkgname-$pkgver.tar.gz::https://github.com/protonmail-desktop/application/archive/v$pkgver.tar.gz
        $pkgname.sh
        $pkgname.desktop)
sha256sums=('cce2d6754a1f459b24e8b64b0c16da36f944a1d622a00cb44712554f29eeab51'
            'e559e107e78fb29fed68fe7c9d5f0ab464c3f092148770ce10672514464fe843'
            'f718cb9a690a373834a1a93e888d53a69ed8c835a454e537adf63d9a1564b3e1')
build() {
  cd application-$pkgver
  npm uninstall eslint gulp-sass --save
  npm install eslint gulp-sass --save-dev
  npm run build
  npm prune --production
}

package() {
  mkdir -p "$pkgdir"/usr/{lib,share/pixmaps}
  cp -r application-$pkgver "$pkgdir/usr/lib/$pkgname"
  ln -s ../../lib/$pkgname/app/static/Icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 application-$pkgver/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

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
      -or -name "deps" -prune -exec rm -r '{}' \; \
      -or -name "doc" -prune -exec rm -r '{}' \; \
      -or -name "example" -prune -exec rm -r '{}' \; \
      -or -name "man" -prune -exec rm -r '{}' \; \
      -or -name "nan" -prune -exec rm -r '{}' \; \
      -or -name "obj.target" -prune -exec rm -r '{}' \; \
      -or -name "script" -prune -exec rm -r '{}' \; \
      -or -name "test" -prune -exec rm -r '{}' \; \
      -or -name "tmp" -prune -exec rm -r '{}' \;
}

