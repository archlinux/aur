# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Maintainer: Giovanni Santini
# Contributor: Cedric Roijakkers <cedric [the at sign goes here] roijakkers [the dot sign goes here] be>.
# Inspired from the PKGBUILD for ferdi-git.

_electron='electron43'
_recipes_commit='bc708f6aad02fc43168e976d1d65678eaf96f21b'

pkgname="ferdium-electron"
pkgver=7.2.3
pkgrel=2
pkgdesc='A messaging browser that allows you to combine your favorite messaging services into one application (git build from latest release) - System-wide Electron edition'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://ferdium.org/"
license=('Apache-2.0')
depends=("$_electron")
makedepends=('git' 'python' 'jq' 'asar' 'nodejs' 'corepack')
provides=('ferdium')
conflicts=('ferdium')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ferdium/ferdium-app/archive/v$pkgver.tar.gz"
        "ferdium-recipes-$pkgver.tar.gz::https://github.com/ferdium/ferdium-recipes/archive/$_recipes_commit.tar.gz"
        ferdium.desktop
        ferdium-image-upload.patch)
sha256sums=('ba266a71335c5e5a29d4a06990b1f8a279238a68fc2d077bb32d5e7ea790b3d5'
            '8d2ddde9a1dda7a4656f5eb2c3deb9a4f536b7893c20521e0b47cf9080358b18'
            'd6e129220ed947cb5fa205211dabc6311a3d9c92434b6bc8deb2fae802c0b0d0'
            'f9e510a2d6526056c166458653635cf1c1e5c34c16282f91f506d6051d40c8c1')
b2sums=('5bf96b53484f00a9314cbb687dcd2adef2195781360100ef583447b3def72fc2497d2eaaf90033de9a63a04bb65e05de607fab9b3a3cd6d33f8d37fd0c258b86'
        'ca6a36c447d845f258604f7b598f4b9a2088a92476918ba4584d0a541317f6cc4428dd2895993e09d84e1283d7a17b351b5ba7f63bcda284a19fd3e7563436a9'
        'a91539c5c9996b7197c28aa8c1b592841b8e3c967e57c711424141d81f1fb0be9cc81dcaca83ed051f42c0a04de4ef2e1eec9891c7bda4894a578fa6de71c858'
        '52e10ddb82be8600439bc5e08fbe8e2a9c41569bff13cc2094204bc5c052b090c6e6261e0b2199bf1f3905ae26d401bbae43bebb047af7a1a51e76e8174346f3')

prepare() {
  cd "ferdium-app-$pkgver"

  cp -Tr "$srcdir/ferdium-recipes-$_recipes_commit" recipes

  local node_ver=$(node -v | sed -e 's/^v//')
  local electron_ver=$(cat "/usr/lib/${_electron}/version")

  local jq_expr=".engines.node = \"$node_ver\" | .devDependencies.electron = \"$electron_ver\""

  jq "$jq_expr" package.json > package.tmp.json
  mv package.tmp.json package.json

  jq "$jq_expr" recipes/package.json > package.tmp.json
  mv package.tmp.json recipes/package.json

  # Specify path for autostart file
  sed -i -e "s#path: executablePath,#path: '/usr/bin/ferdium',#g" src/stores/AppStore.ts
  # Set noUnusedLocals to false to avoid compilation error in AppStore.ts
  sed -i -e 's#"noUnusedLocals": true#"noUnusedLocals": false#g' tsconfig.json

  # Electron >= 32 removed File.path, use webUtils.getPathForFile for image uploads
  patch -Np1 -i "$srcdir/ferdium-image-upload.patch"
}

build() {
  cd "ferdium-app-$pkgver"

  export CI=true

  mkdir -p "$srcdir/.buildtools"
  export PATH="$srcdir/.buildtools:$PATH"

  corepack enable --install-directory "$srcdir/.buildtools"

  pnpm install --no-frozen-lockfile --ignore-script

  cd "recipes"

  pnpm install --no-frozen-lockfile --ignore-script
  pnpm run package

  cd ..

  NODE_ENV=production pnpm run build \
    --linux --x64 --dir \
    -c.electronDist="/usr/lib/$_electron" \
    -c.electronVersion="$(cat "/usr/lib/$_electron/version" | sed -e 's/^v//')"
}

package() {
  cd "ferdium-app-$pkgver"

  install -dm0755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/ferdium" <<EOF
#!/bin/sh
ELECTRON_IS_DEV=0 exec /usr/bin/$_electron /usr/lib/ferdium "\$@"
EOF
  chmod +x "$pkgdir/usr/bin/ferdium"

  install -dm0755 "$pkgdir/usr/lib/ferdium"
  asar e out/linux-unpacked/resources/app.asar "$pkgdir/usr/lib/ferdium"

  install -Dm0644 -t "$pkgdir/usr/share/applications/" "$srcdir/ferdium.desktop"
  for _size in 16 24 32 48 64 96 128 256 512 1024; do
    install -Dm644 "build-helpers/images/icons/${_size}x${_size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/ferdium.png"
  done

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
