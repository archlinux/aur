# Maintainer: Dmitry Valter <`echo ZHZhbHRlciA8YXQ+IHByb3Rvbm1haWwgPGRvdD4gY29tCg== | base64 -d`>

pkgname=drawio-desktop
pkgver=21.2.8
pkgrel=1
pkgdesc='Diagram drawing application built on web technology'
arch=('any')
url='https://github.com/jgraph/drawio-desktop'
license=('Apache')
_electronver=21
depends=("electron$_electronver" libnotify shared-mime-info)
makedepends=(yarn ant 'nodejs>=12')
options=('!strip')
source=("drawio-$pkgver.tar.gz::https://github.com/jgraph/drawio/archive/v$pkgver.tar.gz"
        "drawio-desktop-$pkgver.tar.gz::https://github.com/jgraph/drawio-desktop/archive/v$pkgver.tar.gz"
        "drawio.xml")
sha512sums=('d32a4353e9931b13165ff9731d825c4ada016aac1d7690bd09e5e67993609e38a478bf5e7acfdf6e73f6942ff261cad1e8d8b0745c9b526489fbd5d298956a04'
            'c37923875fe638c11c556fa48d6ad826e75b62c1087ac53cf810e130b7a2afa3d69660f1298c445b65ca944c45b22ca7bb1255913446cffd1325d1bf35a9224a'
            '8899108b4112f065173a077ca68d4d915780bcc993c69924098e134fa05338a20cb0391720b7b45c27071f789fbe5a6a02228dd633570e91fb4482082c480539')

build() {
  rm -rf "$srcdir/drawio-desktop-$pkgver/drawio"
  mv "$srcdir/drawio-$pkgver" "$srcdir/drawio-desktop-$pkgver/drawio"
  cd "$srcdir/drawio-desktop-$pkgver"/drawio/etc/build
  ant app
  cd "$srcdir/drawio-desktop-$pkgver"

  rm -rf "META-INF" "WEB-INF"

  # Electron version compatibility check
  # echo "Checking electron version"
  # grep -qF "\"electron\": \"^$_electronver." 'package.json'

  # disable updater
  sed -e '/electron-updater/d' -i 'package.json'
  sed -e '/"electron":/d' -i 'package.json'
  sed -e '/"electron-builder":/d' -i 'package.json'
  sed -e '/"electron-notarize":/d' -i 'package.json'
  local updater='const autoUpdater = { on: () => {}, setFeedURL: () => {}, checkForUpdates: () => {} }'
  sed -e 's/.*require("electron-updater").*/'"$updater"'/' -e '/checkForUpdates,/d' -i 'drawio/src/main/webapp/electron.js'

  # fix version in package.json
  sed -i 's/"version": ".*"/"version": "'"$pkgver"'"/g' package.json

  cd "$srcdir/drawio-desktop-$pkgver"
  yarn install --cache-folder ../npm-cache --prod
  yarn autoclean -I
  yarn autoclean -F

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
  cd "$srcdir/drawio-desktop-$pkgver"

  mkdir -p "$pkgdir/usr/lib/draw.io"
  cp -rp package.json *.js drawio node_modules "$pkgdir/usr/lib/draw.io"

  # fix file permissions
  chmod -R g+r,o+r "$pkgdir/usr/lib/draw.io"

  # create run script
  mkdir -p "$pkgdir/usr/bin"
  printf '%s\n' \
  '#!/bin/sh' \
  "exec electron$_electronver /usr/lib/draw.io \"\$@\"" \
  > "$pkgdir/usr/bin/draw.io"
  chmod a+x "$pkgdir/usr/bin/draw.io"

  # create desktop file
  mkdir -p "$pkgdir/usr/share/applications"
  printf '%s\n' \
  '[Desktop Entry]' \
  'Name=drawio' \
  'Comment=draw.io desktop' \
  'Exec=/usr/bin/draw.io %U' \
  'Terminal=false' \
  'Type=Application' \
  'Icon=draw.io' \
  'StartupWMClass=draw.io' \
  'Categories=Graphics;' \
  > "$pkgdir/usr/share/applications/draw.io.desktop"

  ln -s /usr/bin/draw.io "$pkgdir/usr/bin/drawio"

 # shared-mime-info defines vsdx differently from vsd, thus upstream setup seems to be incorrect
  MIMETYPE="$(grep mimeType "$srcdir/drawio-desktop-$pkgver/electron-builder-linux-mac.json" | \
              sed 's/.*"mimeType":.*"\(.*\)".*/\1/g' | \
              sed 's/vnd\.visio/vnd.ms-visio.drawing.main+xml/g' | tr '\n' ';')"
  if [[ -n "${MIMETYPE}" ]]; then
      echo "MimeType=${MIMETYPE}" >> "$pkgdir/usr/share/applications/draw.io.desktop"
  fi

  # create icons
  cd "$srcdir/drawio-desktop-$pkgver"
  find 'build' -regex '.*/[0-9]+x[0-9]+\.png' |
  grep -o '[0-9]\+' | 
  sort -u |
  while read size; do
    if [[ -f "build/${size}x${size}.png" ]]; then
      install -Dm644 "build/${size}x${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/draw.io.png"
    fi
  install -Dm644 "$srcdir/drawio.xml" "$pkgdir/usr/share/mime/packages/drawio.xml" 
  done
}
