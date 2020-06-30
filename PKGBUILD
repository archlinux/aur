# Maintainer: ObserverOfTime <chronobserver@disroot.org>

pkgname=gdlauncher-git
pkgver=1.0.8.r0.g735449de
pkgrel=3
pkgdesc='Modded Minecraft launcher built with Electron/React (git version)'
arch=('x86_64')
url='https://gdevs.io'
license=('GPL3')
provides=('gdlauncher')
conflicts=('gdlauncher' 'gdlauncher-appimage' 'gdlauncher-bin' 'gdlauncher-classic')
depends=('electron8' 'libnotify' 'libxss' 'libxtst' 'libindicator-gtk3' 'libappindicator-gtk3' 'p7zip')
makedepends=('git' 'yarn' 'rust')
source=('git+https://github.com/gorilla-devs/GDLauncher.git'
        'gdlauncher.png::https://avatars0.githubusercontent.com/u/49373890?s=256'
        'use-system-7za-and-disable-updater.patch')
sha256sums=('SKIP'
            'f4cbb8a47e80c498972e548897a01190ac1975fbed0879565ff8fc57b8e9dbf0'
            '26f2b1d6b01c5eb51de2310ccac4bbb8b6e07de8954fd792c8aa76aa8042cf34')

pkgver() {
  cd "$srcdir"/GDLauncher

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir"/GDLauncher

  sed -i package.json \
    -e '/electron-updater/d;/7zip-bin/d' \
    -e 's$public/electron.js$build/electron.js$'
  patch -p1 -i ../use-system-7za-and-disable-updater.patch
}

build() {
  cd "$srcdir"/GDLauncher

  yarn --cache-folder="$srcdir"/npm-cache
  export NODE_ENV=production APP_TYPE=electron CI=false REACT_APP_RELEASE_TYPE=setup
  yarn run craco build
  yarn run webpack --config scripts/electronWebpackConfig.js
  yarn moveBuildEntryPoint
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
  cat >"$pkgdir"/usr/bin/gdlauncher <<'EOF'
#!/bin/sh
exec electron8 /usr/lib/gdlauncher "$@"
EOF
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
EOF
}
