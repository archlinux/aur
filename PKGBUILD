# Maintainer: Cedric Roijakkers <cedric [the at sign goes here] roijakkers [the dot sign goes here] be>.
# Inspired from the PKGBUILD for ferdi-git.

_electron='electron31'
_recipes_commit='e419e881b386c2fdc3faec145d8b6499b80fdf02'

pkgname="ferdium-electron"
pkgver=6.7.7
pkgrel=1
pkgdesc='A messaging browser that allows you to combine your favorite messaging services into one application (git build from latest release) - System-wide Electron edition'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://ferdium.org/"
license=('Apache-2.0')
depends=("$_electron")
makedepends=('git' 'python' 'jq' 'asar' 'nodejs')
provides=('ferdium')
conflicts=('ferdium')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ferdium/ferdium-app/archive/v$pkgver.tar.gz"
        "ferdium-recipes-$pkgver.tar.gz::https://github.com/ferdium/ferdium-recipes/archive/$_recipes_commit.tar.gz"
        ferdium.desktop)
sha256sums=('4153ebbd80937d668135c48f2b33dc461fcece3c5e6aa52a99224e64c030f3fe'
            '73116398dda880ce78fc3f6c7ce48a8b6150aca3aee843fec4c08e4ef14534b5'
            'd6e129220ed947cb5fa205211dabc6311a3d9c92434b6bc8deb2fae802c0b0d0')

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
