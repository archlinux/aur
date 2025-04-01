# Maintainer: Popolon <popolon@popolon.org>
# Maintainer: Arthur "arthuro555" Pacaud <arthur.pacaud@hotmail.fr>
# Contributor: Paulequilibrio
# Contributor: JKA Network <contacto@jkanetwork.com>
# Contributor: Todor Imreorov for github <blurymind@gmail.com>

pkgname=gdevelop
pkgver=5.5.228
pkgrel=1
pkgdesc="A full-featured, open source game engine, allowing to create HTML5 with powerful visual scripting."
arch=(x86_64 armv7l arm64)
url=https://gdevelop.io
license=('MIT')
groups=()
provides=("gdevelop=${pkgver}")
conflicts=('gdevelop-bin' 'gdevelop-git')
makedepends=('npm' 'git' 'jq' 'clang')
_electron='electron32'
_emsdk='3.1.21'
depends=("$_electron")
source=("gdevelop::git+https://github.com/4ian/GDevelop.git#tag=v${pkgver}"
  'emsdk::git+https://github.com/emscripten-core/emsdk.git'
  'gdevelop.desktop')
sha256sums=('SKIP'
  'SKIP'
  '240f24320686eff28e9d5226440d5f195098c1f59bff030bbfa88ed07aa72244')

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
  local package
  package="$(jq ".devDependencies.electron = \"$electronVer\"" package.json)"
  echo -E "${package}" > package.json
  package="$(jq ".dependencies.electron = \"$electronVer\"" package.json)"
  echo -E "${package}" > package.json

  # Note - This dependency update has been submitted upstream and will be removed once released.
  (
    cd app 
    npm install --no-audit --no-fund --prefer-offline --include dev @electron/remote@latest
  )

  npm install --no-audit --no-fund --prefer-offline --include dev \
    @electron/remote@latest electron-builder@latest # Note - This dependency update has been submitted upstream and will be removed once released.
  npm run build -- --linux dir --"${!CARCH}" -c.electronDist="/usr/lib/electron" -c.electronVersion="$_electron"
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
  install -Dm644 "$srcdir/gdevelop/newIDE/app/public/favicon-512.png" "$pkgdir/usr/share/pixmaps/gdevelop.png"
}
