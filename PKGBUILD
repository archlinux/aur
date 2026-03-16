# Maintainer: Jason Go <jasongo@jasongo.net>
# Contributor: Taboon Egon <te451 -_AT_- netcourrier -_DOT_- com>
# Contributor: relrel <relrelbachar at gmail dot com>

pkgname="scratch3"
pkgver=3.31.1
pkgrel=4
pkgdesc='Scratch 3.0 as a self-contained desktop application'
arch=('x86_64' 'aarch64')
url='https://github.com/scratchfoundation/scratch-desktop'
license=('AGPL-3.0-only')
_electron='electron39'
depends=("$_electron")
makedepends=('git' 'nodejs' 'npm')
optdepends=('xdg-utils: To open Scratch files from URLs')
provides=('scratch3')
conflicts=('scratch3-bin' 'scratch-desktop')
replaces=('scratch-desktop')
options=(!strip !debug)
source=(
  "git+$url.git#tag=v$pkgver"
  scratch3.{sh.in,xml}
)
b2sums=('03e7aca64a35417ceecf520d6453428e00bdf0dcfd0816b7f409a8c080034ed288815aec9a27bc1270a251f500dd2ddb3f18b22696b0aaf8e20da2d2348a4f1a'
        'dbf626b6f14d8053e76b0cc240f26e026105aaab40236be905e1549134ca47b5de47f4866e951db6c3b1b1c67b9fd9ff8c21210be80e52e832ee7e12faa5795e'
        'd8cc625a9448674762ab94317235a38fa4e7e5581bb058e7d00c8f5ff38eb9ba1bc4260b4a519028f24267ef0cd2e3a312a66acd21c49b8500fe342dd2be733a')

prepare() {
  cd scratch-desktop

  # Patch: Set window icon
  sed -i "s#const window = new BrowserWindow({#const window = new BrowserWindow({ icon: '/usr/share/icons/hicolor/1024x1024/apps/scratch3.png',#g" ./src/main/index.js

  # Make system Electron see the right path for static files
  sed -i 's|process.resourcesPath + "/static"|"/usr/lib/scratch3/static"|' webpack.makeConfig.js

  # Use scratch3 as name
  sed -i "s|executableName: scratch-desktop|executableName: scratch3|" electron-builder.yaml

  # Add config for building deb
  # We prefer to build the deb format so we can have a ready made /usr/share/* much easily
  cat >> electron-builder.yaml << EOF
deb:
  packageName: scratch3
  maintainer: "Scratch Foundation <info@scratch.org>"
  category: "Development;Education;"
  compression:
EOF

  # Update electron-builder to work on latest system nodejs
  npm add -D electron-builder@latest

  # Use system electron binaries
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1

  npm install
  npm run clean
  npm run fetch
}

build() {
  cd scratch-desktop

  export NODE_ENV=production
  npm run compile
  npx electron-builder --linux deb --publish=never -c.electronDist=/usr/lib/"$_electron"
  
  # Extract the deb file
  bsdtar -xf ./dist/scratch*_amd64.deb --include='data.tar*' -O | bsdtar -xf - -C "$srcdir"

  cd "$srcdir"

  # Set the electron binary and fix paths
  sed -i "s|@ELECTRON@|$_electron|" scratch3.sh.in
  sed -i 's|/opt/Scratch 3/scratch3|/usr/bin/scratch3|' ./usr/share/applications/scratch3.desktop
  sed -i 's|/opt/Scratch 3/scratch3|/usr/bin/scratch3|' ./opt/"Scratch 3"/resources/apparmor-profile

  # Add mimetype in .desktop
  echo "MimeType=x-scratch-project;x.scratch.sb3;x.scratch.sprite3;" >> ./usr/share/applications/scratch3.desktop

  # Not needed
  rm -f ./opt/"Scratch 3"/resources/{default_app.asar,package-type}
}

package() {
  # 1. COPY THE BINARIES
  install -Dm755 scratch3.sh.in "$pkgdir/usr/bin/scratch3"
  mkdir -p "$pkgdir/usr/lib/scratch3/"
  cp -dr --no-preserve=ownership ./opt/"Scratch 3"/resources/* "$pkgdir/usr/lib/scratch3/"
  
  # 2. COPY THE REST OF THE /usr/share/* from deb file
  mkdir -p "$pkgdir/usr/share"
  cp -dr --no-preserve=ownership ./usr/share/* "$pkgdir/usr/share"

  # 3. COPY DOCS AND LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/scratch3/" ./scratch-desktop/README.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/scratch3/" ./scratch-desktop/{LICENSE,TRADEMARK}

  # 4. COPY APPARMOR PROFILE
  install -dm755 "$pkgdir/etc/apparmor.d/"
  mv "$pkgdir/usr/lib/scratch3/apparmor-profile" "$pkgdir/etc/apparmor.d/scratch3"

  # 5. COPY MIMETYPE CONFIG
  install -Dm644 -t "$pkgdir/usr/share/mime/packages/" ./scratch3.xml
}
