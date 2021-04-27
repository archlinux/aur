# Maintainer: ObserverOfTime <chronobserver@disroot.org>

pkgname=gdlauncher-git
pkgver=1.1.2.r0.g92dab09b
pkgrel=3
pkgdesc='Modded Minecraft launcher built with Electron/React (git version)'
arch=('x86_64')
url='https://gdevs.io'
license=('GPL3')
provides=('gdlauncher')
conflicts=('gdlauncher' 'gdlauncher-appimage' 'gdlauncher-bin' 'gdlauncher-classic')
depends=('libnotify' 'libxss' 'libxtst' 'libindicator-gtk3' 'libappindicator-gtk3' 'p7zip')
makedepends=('git' 'npm' 'rust')
source=('git+https://github.com/gorilla-devs/GDLauncher.git'
        'gdlauncher.png::https://avatars0.githubusercontent.com/u/49373890?s=256'
        'use-system-7za-and-disable-updater.patch')
sha256sums=('SKIP'
            'f4cbb8a47e80c498972e548897a01190ac1975fbed0879565ff8fc57b8e9dbf0'
            'e23404aeee7173c79007ac3877b3a84aeb8cdc68d9b920d82754e6b679992b50')

pkgver() {
  cd "$srcdir"/GDLauncher

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir"/GDLauncher

  sed -i package.json \
    -e '/electron-updater/d;/7zip-bin/d' \
    -e 's$public/electron.js$build/electron.js$' \
    -e '/"dependencies"/i\  "bundledDependencies": ["7zip-bin"],'
  patch -p1 -i ../use-system-7za-and-disable-updater.patch
}

build() {
  cd "$srcdir"/GDLauncher

  export CARGO_HOME="$srcdir"/cargo-cache
  npm install --cache="$srcdir"/npm-cache

  export CI=false \
         APP_TYPE=electron \
         NODE_ENV=production \
         REACT_APP_RELEASE_TYPE=setup
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
  cat >"$pkgdir"/usr/bin/gdlauncher <<< \
      '#!/bin/sh'$'\n''exec electron /usr/lib/gdlauncher "$@"'
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
