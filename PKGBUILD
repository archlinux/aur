# Maintainer: Tymon3310 <aur@tymon3310.dev>
pkgname=vortex
pkgver=2.0.0_beta.2
pkgrel=1
pkgdesc="Nexus Mods' mod manager - native Linux build (Beta)"
arch=('x86_64')
url="https://github.com/Nexus-Mods/Vortex"
license=('GPL-3.0-or-later')

depends=('gtk3' 'nss' 'libxss' 'libnotify' 'libappindicator-gtk3' 'libsecret' 'nodejs')
makedepends=('git' 'pnpm' 'npm' 'python' 'python-setuptools' 'dotnet-sdk-9.0')

conflicts=('vortex-git')
install=vortex.install

source=("git+https://github.com/Nexus-Mods/Vortex.git#tag=v${pkgver//_/-}"
        "vortex.desktop"
        "vortex.sh")

sha256sums=('6e4dc2415071c07d7751237a4f0269425104af531eae4c225e663216cc6150d8'
            '7e66931a83d05fb7ca0d086b27ab3fc3b926df02caf71826ee4ee4e8654ea4e5'
            'b75e3826dd3c0658b9d69ea700e9262609753b2dcb3459c26c1265273338dc1e')

options=('!strip' '!debug')

prepare() {
  cd "$srcdir/Vortex"

  msg2 "Patching package.json requirements..."
  node -e "
    const fs = require('fs');
    let pkg = JSON.parse(fs.readFileSync('package.json', 'utf8'));
    
    pkg.engines = pkg.engines || {};
    pkg.engines.node = '>=22.0.0';
    
    pkg.pnpm = pkg.pnpm || {};
    pkg.pnpm.overrides = pkg.pnpm.overrides || {};
    pkg.pnpm.overrides['node-addon-api'] = '8.5.0';
    pkg.pnpm.overrides['@types/react'] = '16';
    pkg.pnpm.overrides['@types/react-dom'] = '16';
    
    fs.writeFileSync('package.json', JSON.stringify(pkg, null, 2));
  "

  if [ -f "pnpm-workspace.yaml" ]; then
    sed -i 's/engineStrict: true/engineStrict: false/g' pnpm-workspace.yaml
  fi

  export npm_config_runtime="electron"
  export npm_config_target="39.8.0"
  export npm_config_disturl="https://electronjs.org/headers"
  export JOBS=4
  export MAKEFLAGS="-j4"

  pnpm install --no-frozen-lockfile
}

build() {
  cd "$srcdir/Vortex"

  export VORTEX_SKIP_SUBMODULES="1"
  export NO_PARALLEL="1"
  export npm_config_yes=true

  msg2 "Building project via pnpm..."
  pnpm run dist:all

  msg2 "Installing dotnetprobe..."
  cp assets/dotnetprobe app/assets/ 2>/dev/null || true
  chmod +x app/assets/dotnetprobe 2>/dev/null || true

  msg2 "Packaging Electron application..."
  cd src/main
  node ./prepare-dist-package.mjs

  echo "packages:" > dist/pnpm-workspace.yaml
  echo "  - '.'" >> dist/pnpm-workspace.yaml

  pnpm install --dir=./dist
  pnpm exec electron-builder --config ./electron-builder.config.json \
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
    "$pkgdir/opt/Vortex/resources/app.asar.unpacked/assets/dotnetprobe" 2>/dev/null || true

  chmod 4755 "$pkgdir/opt/Vortex/chrome-sandbox" 2>/dev/null || true

  install -Dm755 "$srcdir/vortex.sh" "$pkgdir/usr/bin/vortex"
  install -Dm644 "$srcdir/vortex.desktop" "$pkgdir/usr/share/applications/vortex.desktop"
  install -Dm644 "$srcdir/Vortex/assets/images/vortex.png" "$pkgdir/usr/share/pixmaps/vortex.png" 2>/dev/null || true
}
