# Maintainer: Tymon3310 <aur@tymon3310.dev>
pkgname=vortex
pkgver=2.6.2
pkgrel=1
epoch=1
pkgdesc="Nexus Mods' mod manager - native Linux build"
arch=('x86_64')
url="https://github.com/Nexus-Mods/Vortex"
license=('GPL-3.0-or-later')

depends=('gtk3' 'nss' 'libxss' 'libnotify' 'libappindicator-gtk3' 'libsecret' 'nodejs' 'dotnet-runtime-9.0')
makedepends=('git' 'corepack' 'npm' 'python' 'python-setuptools' 'dotnet-sdk-9.0')

conflicts=('vortex-git')
install=vortex.install

source=("git+https://github.com/Nexus-Mods/Vortex.git#tag=v${pkgver}"
  "vortex.desktop"
  "vortex.sh")

sha256sums=('332cdd8718540926a4c4327a3a2d191e341140c056b16151d0e02f9973c8491c'
            '7e66931a83d05fb7ca0d086b27ab3fc3b926df02caf71826ee4ee4e8654ea4e5'
            'b75e3826dd3c0658b9d69ea700e9262609753b2dcb3459c26c1265273338dc1e')

options=('!strip' '!debug')

prepare() {
  cd "$srcdir/Vortex"

  export COREPACK_ENABLE_DOWNLOAD_PROMPT=0
  export pnpm_config_verify_deps_before_run=false

  mkdir -p .bin
  corepack enable --install-directory "$srcdir/Vortex/.bin" pnpm
  export PATH="$srcdir/Vortex/.bin:$PATH"

  msg2 "Patching package metadata..."
  node -e "
    const fs = require('fs');
    let pkg = JSON.parse(fs.readFileSync('package.json', 'utf8'));
    pkg.engines.node = '>=22.0.0';
    delete pkg.devEngines;
    fs.writeFileSync('package.json', JSON.stringify(pkg, null, 2) + '\n');

    let main = JSON.parse(fs.readFileSync('src/main/package.json', 'utf8'));
    main.version = '$pkgver';
    fs.writeFileSync('src/main/package.json', JSON.stringify(main, null, 2) + '\n');

    const ebPath = 'src/main/electron-builder.config.json';
    let eb = JSON.parse(fs.readFileSync(ebPath, 'utf8'));
    // Windows-only redist runtimes are not part of the Linux packaging
    eb.extraResources = eb.extraResources.filter(
      (e) => typeof e !== 'string' || !e.startsWith('./temp/')
    );
    fs.writeFileSync(ebPath, JSON.stringify(eb, null, 2) + '\n');
  "

  sed -i 's/engineStrict: true/engineStrict: false/g' pnpm-workspace.yaml

  msg2 "Installing dependencies (pnpm $(pnpm --version))..."
  pnpm install --frozen-lockfile

  msg2 "Downloading Electron runtime..."
  (cd src/main && pnpm exec install-electron)
}

build() {
  cd "$srcdir/Vortex"

  export PATH="$srcdir/Vortex/.bin:$PATH"
  export COREPACK_ENABLE_DOWNLOAD_PROMPT=0
  export pnpm_config_verify_deps_before_run=false
  export NODE_ENV=production
  export NO_PARALLEL=1

  msg2 "Building workspace..."
  pnpm nx run @vortex/main:build

  msg2 "Deploying dist package..."
  export VORTEX_ELECTRON_REBUILD=skip
  pnpm nx run @vortex/main:publish

  msg2 "Removing Windows-only native modules from dist..."
  rm -rf src/main/dist/node_modules/winapi-bindings

  msg2 "Packaging Electron application..."
  cd src/main/dist
  ./node_modules/.bin/electron-builder --config ./electron-builder.config.json \
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
  install -Dm755 "$srcdir/Vortex/src/main/build/assets/dotnetprobe" \
    "$pkgdir/opt/Vortex/resources/app.asar.unpacked/assets/dotnetprobe"

  chmod 4755 "$pkgdir/opt/Vortex/chrome-sandbox"

  install -Dm755 "$srcdir/vortex.sh" "$pkgdir/usr/bin/vortex"
  install -Dm644 "$srcdir/vortex.desktop" "$pkgdir/usr/share/applications/vortex.desktop"
  install -Dm644 "$srcdir/Vortex/assets/images/vortex.png" "$pkgdir/usr/share/pixmaps/vortex.png"

  chmod -R 777 "$pkgdir/opt/Vortex/resources/app.asar.unpacked/assets"
}
