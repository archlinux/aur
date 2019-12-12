# $Id$
# Contributor: Albakham <contact@geber.ga>

pkgname=protonmail-desktop
pkgver=1.0.4
pkgrel=2
pkgdesc="Unofficial app that emulates a native client for the ProtonMail e-mail service"
arch=(any)
url="https://github.com/protonmail-desktop/application"
license=(MIT)
depends=(electron)
makedepends=(npm)
options=(!strip)
source=($pkgname-$pkgver.tar.gz::https://github.com/protonmail-desktop/application/archive/v$pkgver.tar.gz
        $pkgname.sh
        $pkgname.desktop)
sha256sums=('830a00ea5092d44d35eacd3ca340de87a562767bce6a740606840a672f8643e1'
            'f830633b18a59b7d2a7787e9f0b4d8de802522e0c7732d1032ced354ab861532'
            '4482041b9daabaf1ad4225e775cdb694078f1e17d026a3f9dbe72731b3bbec0d')

build() {
  cd application-$pkgver
  sed -i '/"postinstall"/d' package.json
  npm uninstall eslint gulp-sass --save
  npm install eslint gulp-sass --save-dev
  npm run build
  npm prune --production
}

package() {
  mkdir -p "$pkgdir"/usr/{lib,share/pixmaps}
  cp -r application-$pkgver "$pkgdir/usr/lib/$pkgname"
  ln -s ../../lib/$pkgname/app/images/Icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
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
