# Maintainer: Arthur "arthuro555" Pacaud <arthur.pacaud@hotmail.fr>
# Contributor: Popolon <popolon@popolon.org>
# Contributor: Paulequilibrio
# Contributor: JKA Network <contacto@jkanetwork.com>
# Contributor: Todor Imreorov for github <blurymind@gmail.com>

pkgname=gdevelop
pkgver=5.6.273
pkgrel=1
pkgdesc="A full-featured, open source game engine, allowing to create HTML5 with powerful visual scripting."
arch=(x86_64 armv7l arm64)
url=https://gdevelop.io
license=('MIT')
provides=("gdevelop=${pkgver}")
conflicts=('gdevelop-bin' 'gdevelop-git')
makedepends=('npm' 'git' 'clang')
_electron='electron41'
_emsdk='3.1.21'
depends=("$_electron")
source=("gdevelop::git+https://github.com/4ian/GDevelop.git#tag=v${pkgver}"
  'emsdk::git+https://github.com/emscripten-core/emsdk.git'
  'gdevelop.desktop')
sha256sums=('SKIP'
  'SKIP'
  '64fb52411e4fbc00237c589424d520d26e42199ed9a7b7e64d9dd375c6904e5c')

prepare() {
  "$srcdir/emsdk/emsdk" install $_emsdk
  "$srcdir/emsdk/emsdk" activate $_emsdk
}

build() {
  EMSDK_QUIET=1 source "$srcdir/emsdk/emsdk_env.sh"

  # Set basic build variables
  export NODE_ENV='production' # Enables optimisations in JS build tools
  export NODE_OPTIONS="--max-old-space-size=8192" # Allows NodeJS VM to allocate enough RAM to build the IDE
  export CC=$(which clang)
  export CXX=$(which clang++)
  # Arch's clang package contains a patch that changes clang's default flags: https://wiki.archlinux.org/title/Clang#Stack_protector
  # We disable this change, since this breaks emscripten.
  export CXXFLAGS="-fno-stack-protector -w"
  export CFLAGS="-fno-stack-protector -w"
  # Arch sets default linker flags which are incompatible with wasm-ld.
  export LDFLAGS=""
  # Try to build despite the CMake file being written for a deprecated CMake version.
  export CMAKE_POLICY_VERSION_MINIMUM="3.5"

  cd "$srcdir/gdevelop/GDevelop.js"
  npm install --no-audit --no-fund --prefer-offline --include dev
  npm run build

  cd "$srcdir/gdevelop/newIDE/app"

  npm install --no-audit --no-fund --prefer-offline --include dev
  NODE_ENV='development' npx -y update-browserslist-db@latest

  cd "$srcdir/gdevelop/newIDE/electron-app"

  local electronVer
  electronVer="$(</usr/lib/$_electron/version)"
  npm pkg set dependencies.electron=$electronVer
  npm pkg set devDependencies.electron=$electronVer
  npm install --no-audit --no-fund --prefer-offline --include dev
  npm run build -- --linux dir --"${!CARCH}" -c.electronDist="/usr/lib/$_electron" -c.electronVersion="$electronVer"
}

package() {
  mkdir -p "${pkgdir}/usr/share/gdevelop/"
  cp -a --no-preserve=ownership "$srcdir/gdevelop/newIDE/electron-app/dist/linux-unpacked/resources/." "${pkgdir}/usr/share/gdevelop/"
  chmod -R 755 "${pkgdir}/usr/share/gdevelop/"
  
  mkdir -p "${pkgdir}/usr/bin/"
  cat >>"${pkgdir}/usr/bin/gdevelop" <<EOD
#! /usr/bin/sh
ELECTRON_IS_DEV=0 exec $_electron /usr/share/gdevelop/app.asar "\$@"
EOD
  chmod 755 "${pkgdir}/usr/bin/gdevelop"
  
  install -Dm644 "$srcdir/gdevelop.desktop" "${pkgdir}/usr/share/applications/gdevelop.desktop"
  install -Dm644 "$srcdir/gdevelop/newIDE/app/public/android-chrome-192x192.png" "$pkgdir/usr/share/pixmaps/gdevelop.png"
}
