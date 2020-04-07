# Maintainer: Dmitry Valter <`echo ZHZhbHRlciA8YXQ+IHByb3Rvbm1haWwgPGRvdD4gY29tCg== | base64 -d`>

pkgname=drawio-desktop
pkgver=12.9.9
pkgrel=1
pkgdesc='Diagram drawing application built on web technology'
arch=('x86_64')
url='https://github.com/jgraph/drawio'
license=('Apache')
depends=(electron libnotify)
makedepends=(yarn ant)
source=("drawio-$pkgver.tar.gz::https://github.com/jgraph/drawio/archive/v$pkgver.tar.gz"
        "drawio-desktop-$pkgver.tar.gz::https://github.com/jgraph/drawio-desktop/archive/v$pkgver.tar.gz")
sha256sums=('f6ce240ab383a4a0269c8e4b1ebd4f69120137bcb07f44d791c3e2fceb2af120'
            'a381aea4a5c58bff71d9efa0fd71cca2eb84673e7908cfefff598827f21e7c80')

build() {
  cd "$srcdir/drawio-$pkgver"/etc/build
  ant app
  cd "$srcdir/drawio-$pkgver"/src/main/webapp

  rm -rf "META-INF" "WEB-INF"

  # disable updater
  sed -e '/electron-updater/d' -i 'package.json'
  local updater='const autoUpdater = { on: () => {}, setFeedURL: () => {}, checkForUpdates: () => {} }'
  sed -e 's/.*require("electron-updater").*/'"$updater"'/' -e '/checkForUpdates,/d' -i 'electron.js'

  # fix version in package.json
  sed -i 's/"version": ".*"/"version": "'"$pkgver"'"/g' package.json

  yarn install --cache-folder ../npm-cache --prod
  yarn autoclean -I
  yarn autoclean -F

  # remove paths refering build directories
  find . -name 'package.json' -exec sed "s,$srcdir/src/drawio-$pkgver/src/main/webapp,/usr/lib/drawio,g" -i {} \;

  rm -f 'package-lock.json'
  find . -name '.yarnclean'         -exec rm -fv {} \;
  find . -name 'yarn.lock'          -exec rm -fv {} \;
  find . -name '.airtap.yml'        -exec rm -fv {} \;
  find . -name '.bin'               -exec rm -fvr {} +
  find . -name 'well-known'         -exec rm -fvr {} +
  find . -name '.coveralls.yml'     -exec rm -fv {} \;
  find . -name '.gitignore'         -exec rm -fv {} \;
  find . -name '.github'            -exec rm -fvr {} +
  find . -name '.eslintrc*'         -exec rm -fv {} \;
  find . -name '.jscs.json'         -exec rm -fv {} \;
  find . -name '.npmignore'         -exec rm -fv {} \;
  find . -name '.prettierrc.js'     -exec rm -fv {} \;
  find . -name '.travis.yml'        -exec rm -fv {} \;
  find . -name '.tonic_example.js'  -exec rm -fv {} \;

}

package() {
  cd "$srcdir/drawio-$pkgver"/src/main/webapp

  mkdir -p "$pkgdir/usr/lib"
  cp -rp . "$pkgdir/usr/lib/draw.io"

  # create run script
  mkdir -p "$pkgdir/usr/bin"
  printf '%s\n' \
  '#!/bin/sh' \
  'exec electron /usr/lib/draw.io "$@"' \
  > "$pkgdir/usr/bin/draw.io"
  chmod a+x "$pkgdir/usr/bin/draw.io"

  # create desktop file
  mkdir -p "$pkgdir/usr/share/applications"
  printf '%s\n' \
  '[Desktop Entry]' \
  'Name=draw.io' \
  'Comment=draw.io desktop' \
  'Exec=/usr/bin/draw.io %U' \
  'Terminal=false' \
  'Type=Application' \
  'Icon=draw.io' \
  'Categories=Graphics;' \
  > "$pkgdir/usr/share/applications/draw.io.desktop"

  MIMETYPE="$(grep mimeType "$srcdir/drawio-desktop-$pkgver/electron-builder-linux-mac.json" | sed 's/.*"mimeType":.*"\(.*\)".*/\1/g' | tr '\n' ';')"
  if [[ -n "${MIMETYPE}" ]]; then
      echo "MimeType=${MIMETYPE}" >> "$pkgdir/usr/share/applications/draw.io.desktop"
  fi

  # create icons
  cd "$srcdir/drawio-desktop-$pkgver"
  # fix 512px icon path
  mv build/{515x512,512x512}.png
  find 'build' -regex '.*/[0-9]+x[0-9]+\.png' |
  grep -o '[0-9]\+' | 
  sort -u |
  while read size; do
    if [[ -f "build/${size}x${size}.png" ]]; then
      install -Dm644 "build/${size}x${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/draw.io.png"
    fi
  done
}
