# Maintainer: Dmitry Valter <`echo ZHZhbHRlciA8YXQ+IHByb3Rvbm1haWwgPGRvdD4gY29tCg== | base64 -d`>

pkgname=drawio-desktop
pkgver=24.7.5
pkgrel=1
pkgdesc='Diagram drawing application built on web technology'
arch=('any')
url='https://github.com/jgraph/drawio-desktop'
license=('Apache-2.0')
_electronver=31
_nodever=20
depends=("electron$_electronver" libnotify shared-mime-info)
makedepends=(yarn ant "nodejs>=$_nodever")
options=('!strip')
source=("drawio-$pkgver.tar.gz::https://github.com/jgraph/drawio/archive/v$pkgver.tar.gz"
        "drawio-desktop-$pkgver.tar.gz::https://github.com/jgraph/drawio-desktop/archive/v$pkgver.tar.gz"
        "drawio.xml")
sha512sums=('bc0aae1ef1bf9c7bad3ffb04ccebab5d9f93c0dfe7312cb097f9b95f8d9b8f4118726d5f989638d697cdb5ab988877b0fdaf33a904250a1d39cbd8a864a05782'
            'efd958693f24e65936fac66adede8c870bbde2a7f8ac8c410e76fccdd0023e773884c17bdbf1c2ddc01916aa65b16c3c43ae899f10117ebf1b48281215be6786'
            '8899108b4112f065173a077ca68d4d915780bcc993c69924098e134fa05338a20cb0391720b7b45c27071f789fbe5a6a02228dd633570e91fb4482082c480539')

build() {
  rm -rf "$srcdir/drawio-desktop-$pkgver/drawio"
  mv "$srcdir/drawio-$pkgver" "$srcdir/drawio-desktop-$pkgver/drawio"

  # rebuild min.js
  cd "$srcdir/drawio-desktop-$pkgver"/drawio/
  rm -fv src/main/webapp/js/app.min.js src/main/webapp/js/extensions.min.js src/main/webapp/js/stencils.min.js
  cd "$srcdir/drawio-desktop-$pkgver"/drawio/etc/build
  LC_ALL=C.UTF-8 ant app

  # clean unused files up
  cd "$srcdir/drawio-desktop-$pkgver"/drawio/
  rm -rfv src/main/webapp/META-INF src/main/webapp/WEB-INF
  # copied from https://github.com/jgraph/drawio-desktop/blob/5bab12f0829768748d25dec0a4f8e9ae4b3db090/.github/workflows/electron-builder.yml#L53
  rm -rfv etc src/main/java src/main/mxgraph src/main/webapp/connect src/main/webapp/shapes src/main/webapp/stencils src/main/webapp/service-worker* src/main/webapp/workbox-*
  cd src/main/webapp/js
  cp diagramly/DesktopLibrary.js diagramly/ElectronApp.js .
  rm -rfv atlas-viewer.min.js atlas.min.js cryptojs deflate diagramly dropbox embed* freehand grapheditor integrate.min.js jquery jscolor onedrive orgchart reader.min.js rough sanitizer shapes.min.js simplepeer spin viewer-static.min.js viewer.min.js
  mkdir diagramly
  mv DesktopLibrary.js ElectronApp.js diagramly
  cd "$srcdir/drawio-desktop-$pkgver"/

  # Electron version compatibility check
  echo "Checking electron version"
  grep -qF "\"electron\": \"$_electronver." 'package.json'

  # Node version compatibility check
  echo "Checking nodejs version"
  grep -qozP  "\"engines\":\s*\{\n\s*\"node\":\s*\">=$_nodever\"" package.json

  # disable updater
  sed -e '/electron-updater/d' -i 'package.json'
  sed -e '/"electron":/d' -i 'package.json'
  sed -e '/"electron-builder":/d' -i 'package.json'
  sed -e '/"electron-notarize":/d' -i 'package.json'
  local updater='const autoUpdater = { on: () => {}, setFeedURL: () => {}, checkForUpdates: () => {} }'
  sed -e '/electron-updater/d' -e 's/.*elecUpPkg.*/'"$updater"'/' -e '/checkForUpdates,/d' -i 'src/main/electron.js'

  # fix version in package.json
  sed -i 's/"version": ".*"/"version": "'"$pkgver"'"/g' package.json

  cd "$srcdir/drawio-desktop-$pkgver"
  yarn install --cache-folder ../npm-cache --prod
  yarn autoclean -I
  yarn autoclean -F

  rm -fv 'package-lock.json'
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
  find . -name '.yarn-integrity'    -exec rm -fv {} \;
  find . -name '*.ts'               -exec rm -fv {} \;

}

package() {
  cd "$srcdir/drawio-desktop-$pkgver"

  mkdir -p "$pkgdir/usr/lib/draw.io"
  cp -rp package.json *.js drawio src node_modules "$pkgdir/usr/lib/draw.io"

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
