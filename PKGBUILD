# $Id$
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=openwmail
_pkgname=openWMail
pkgver=1.0.0
pkgrel=1
pkgdesc="The missing desktop client for Gmail & Google Inbox"
arch=(x86_64)
url="https://openwmail.github.io/"
license=(MPL)
depends=(electron)
makedepends=(git npm python2)
options=(!strip)
source=($_pkgname-$pkgver.tar.gz::https://github.com/openWMail/$pkgname/archive/v$pkgver.tar.gz
        $pkgname.sh
        $pkgname.desktop
        credentials.js)
sha256sums=('445f54c02e3b83a5e5997eede34b3c969a67b3bd15f5f921b53e626f2777ebde'
            '5fa3dc9f2c022deab663541ec6269761d2683db0e1edc0d806ebd23a806bc0bd'
            'dbc45544162aeebf06ce8037c53c67642c1e170824828d6ee87c0f5435050750'
            'f51147540936c439249076b96679da2fc971ea00c9220d736b12f0879ed89467')

build() {
  cd $_pkgname-$pkgver
  sed -i "s/ROOT_DIR, 'package.json'/__dirname, 'package.json'/" src/app/webpack.config.js
  sed -i 's|"wmail-spellchecker": "openWMail/wmail-spellchecker#1.0.5"|"nodehun": "2.0.11"|' src/app/package.json 
  sed -i 's/wmail-spellchecker/nodehun/' src/scenes/platform/src/webviewInjection/Browser/Spellchecker.js

  cp ../credentials.js src/shared/credentials.js
  npm install
  pushd src/scenes/mailboxes
  npm install
  popd
  node_modules/.bin/webpack
  cd bin/app
  PYTHON=python2 npm install --production
  npm rebuild --runtime=electron --target=$(</usr/lib/electron/version) --disturl=https://atom.io/download/electron --build-from-source
}

package() {
  mkdir -p "$pkgdir"/usr/{lib,share}
  cp -r $_pkgname-$pkgver/bin "$pkgdir/usr/lib/$pkgname"

  for s in 16 24 32 48 64 96 128 256 512; do
    install -Dm644 $_pkgname-$pkgver/assets/icons/app_$s.png "$pkgdir"/usr/share/icons/hicolor/${s}x${s}/apps/mailspring.png
  done

  install -Dm644 $_pkgname-$pkgver/assets/icons/app.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/mailspring.svg
  install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"

  # Clean up
  find "$pkgdir/usr/lib/$pkgname/app/node_modules" \
      -name "package.json" \
        -exec sed -e "s|$srcdir/$_pkgname|/usr/lib/$pkgname|" \
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
