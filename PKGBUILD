# Maintainer: Blazingblast <lukabijma1@gmail.com>
# Contributor: ObserverOfTime <chronobserver@disroot.org>

pkgname=gdlauncher-git
pkgver=1.1.30.r1.g97c33ac7
pkgrel=2
pkgdesc='Modded Minecraft launcher built with Rust and Electron/React (git version)'
arch=('x86_64')
url='https://gdevs.io'
license=('GPL3')
provides=('gdlauncher')
conflicts=('gdlauncher' 'gdlauncher-appimage' 'gdlauncher-bin' 'gdlauncher-classic')
depends=('electron' 'libnotify' 'libxss' 'libxtst' 'libindicator-gtk3' 'libappindicator-gtk3' 'p7zip')
makedepends=('git' 'nodejs>=17' 'npm' 'rust')
source=('git+https://github.com/gorilla-devs/GDLauncher.git'
        'gdlauncher.png::https://avatars0.githubusercontent.com/u/49373890?s=256'
        'use-system-7za-and-disable-updater.patch')
sha256sums=('SKIP'
            'c77b67c7afe1d0e3a4cd11aaf262d2547f91773fd8afe2867463ea1b01e1cfc4'
            '300675d00b00681c12870cf3832e4e3bcbfaf71ccfd01c0ee474bc2887b8b666')

pkgver() {
  cd "$srcdir"/GDLauncher

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir"/GDLauncher

  sed -i package.json \
    -e '/electron-updater/d;/7zip-bin/d' \
    -e 's$public/electron.js$build/electron.js$'
  sed -i craco.config.js \
    -e "/class-properties/a '@babel\/plugin-proposal-private-methods'," \
    -e "/class-properties/a '@babel\/plugin-proposal-private-property-in-object',"
  patch -p1 -i ../use-system-7za-and-disable-updater.patch
}

build() {
  cd "$srcdir"/GDLauncher

  export CARGO_HOME="$srcdir"/cargo-cache
  npm i --legacy-peer-deps --cache="$srcdir"/npm-cache

  export CI=false \
         APP_TYPE=electron \
         NODE_ENV=production \
         REACT_APP_RELEASE_TYPE=setup \
         NODE_OPTIONS="--openssl-legacy-provider"
  npx craco build
  npx webpack --config scripts/electronWebpackConfig.js
}

package() {
  cd "$srcdir"/GDLauncher

  # copy runtime files
  mkdir -p "$pkgdir"/usr/lib/gdlauncher
  rm build/installer{.nsh,{Header,Sidebar}.bmp}
  cp -r package.json build "$pkgdir"/usr/lib/gdlauncher

  # copy icon
  mkdir -p "$pkgdir"/usr/share/icons/hicolor/256x256/apps
  cp ../gdlauncher.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps

  # create run script
  mkdir -p "$pkgdir"/usr/bin
  printf >"$pkgdir"/usr/bin/gdlauncher \
      '#!/bin/sh\n\nexec electron /usr/lib/gdlauncher "$@"\n'
  chmod a+x "$pkgdir"/usr/bin/gdlauncher

  # create desktop file
  mkdir -p "$pkgdir"/usr/share/applications
  cat >"$pkgdir"/usr/share/applications/gdlauncher.desktop <<'EOF'
[Desktop Entry]
Name=GDLauncher
Comment=A Custom Minecraft Launcher
Exec=/usr/bin/gdlauncher %U
Terminal=false
StartupWMClass=GDLauncher
Icon=gdlauncher
Categories=Game;
Type=Application
EOF
}
