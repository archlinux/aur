# Maintainer: Tymon3310 <aur@tymon3310.dev>
pkgname=vortex
pkgver=1.16.8
pkgrel=1
pkgdesc="Nexus Mods' mod manager - native Linux build (Stable)"
arch=('x86_64')
url="https://github.com/Nexus-Mods/Vortex"
license=('GPL-3.0-or-later')

depends=('gtk3' 'nss' 'libxss' 'libnotify' 'libappindicator-gtk3' 'libsecret' 'nodejs')
makedepends=('git' 'yarn' 'npm' 'python' 'python-setuptools' 'dotnet-sdk-9.0')

conflicts=('vortex-git')
install=vortex.install

source=("git+https://github.com/Nexus-Mods/Vortex.git#tag=v${pkgver}"
  "vortex.desktop"
  "vortex.sh")
sha256sums=('0c601395a4cf65aaeeb708b6729fe71887059b40f370b0322de47659a7a3c130'
            '7e66931a83d05fb7ca0d086b27ab3fc3b926df02caf71826ee4ee4e8654ea4e5'
            'b75e3826dd3c0658b9d69ea700e9262609753b2dcb3459c26c1265273338dc1e')

options=('!strip' '!debug')

prepare() {
  cd "$srcdir/Vortex"

  _node_ver=$(node -v | sed 's/v//')
  sed -i "s/\"node\": \"[0-9.]*\"/\"node\": \">=$_node_ver\"/" package.json

  yarn install --non-interactive --check-files --frozen-lockfile
}

build() {
  cd "$srcdir/Vortex"

  export VORTEX_SKIP_SUBMODULES="1"
  export NO_PARALLEL="1"

  msg2 "Disabling source maps..."
  sed -i "s/devtool: 'source-map'/devtool: false/g" webpack.main.config.js
  sed -i "s/devtool: 'source-map'/devtool: false/g" webpack.renderer.config.js

  msg2 "Building API..."
  yarn run build_api

  msg2 "Installing App dependencies..."
  yarn run _install_app

  msg2 "Building Subprojects (Sequentially)..."
  yarn run subprojects_app_ci

  msg2 "Building Assets..."
  yarn run _assets_app

  msg2 "Installing dotnetprobe..."
  cp assets/dotnetprobe app/assets/
  chmod +x app/assets/dotnetprobe

  msg2 "Compiling Webpack bundles..."
  yarn run build_dist

  msg2 "Packaging Electron application..."
  yarn electron-builder --config electron-builder-config.json \
    --publish never \
    --linux dir \
    --x64 \
    -c.compression=store
}

package() {
  cd "$srcdir/Vortex/dist/linux-unpacked"

  install -dm755 "$pkgdir/opt/Vortex"
  cp -a . "$pkgdir/opt/Vortex/"

  install -dm755 "$pkgdir/opt/Vortex/resources/app.asar.unpacked/assets"
  install -Dm755 "$srcdir/Vortex/assets/dotnetprobe" \
    "$pkgdir/opt/Vortex/resources/app.asar.unpacked/assets/dotnetprobe"

  chmod 4755 "$pkgdir/opt/Vortex/chrome-sandbox"

  install -Dm755 "$srcdir/vortex.sh" "$pkgdir/usr/bin/vortex"

  install -Dm644 "$srcdir/vortex.desktop" "$pkgdir/usr/share/applications/vortex.desktop"

  install -Dm644 "$srcdir/Vortex/assets/images/vortex.png" "$pkgdir/usr/share/pixmaps/vortex.png"
}
