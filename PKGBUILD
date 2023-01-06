# Maintainer: Cedric Roijakkers <cedric [the at sign goes here] roijakkers [the dot sign goes here] be>.
# Inspired from the PKGBUILD for ferdi-git.

_electron='electron21'

pkgname="ferdium-electron"
pkgver=6.2.3
pkgrel=1
pkgdesc='A messaging browser that allows you to combine your favorite messaging services into one application (git build from latest release) - System-wide Electron edition'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://ferdium.org/"
license=('Apache')
depends=("$_electron")
makedepends=('git' 'python' 'pnpm' 'jq' 'asar' 'nodejs')
provides=('ferdium')
conflicts=('ferdium')
source=("$pkgname::git+https://github.com/ferdium/ferdium-app#tag=v$pkgver"
        ferdium.desktop)
sha512sums=('SKIP'
            'e227a9c1cd3bbf2014be0897e05a809be6c0bf185351b6a8c97451af5c6a267283dfaea24bad9e6e300ed4ed91502658787ccba87a6c71f84385c3875c418189')

prepare() {
  cd "$pkgname"

  git submodule update --init --recursive --force

  local node_ver=$(node -v | sed -e 's/^v//')
  local pnpm_ver=$(pnpm -v)

  local jq_expr=".engines.node = \"$node_ver\" | .engines.pnpm = \"$pnpm_ver\""

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
  cd "$pkgname"

  export CI=true

  pnpm install || true
  pnpm run prepare-code || true

  cd "recipes"

  pnpm install || true
  pnpm run package

  cd ..

  NODE_ENV=production pnpm run build \
    --linux --x64 --dir \
    -c.electronDist="/usr/lib/$_electron" \
    -c.electronVersion="$(cat "/usr/lib/$_electron/version" | sed -e 's/^v//')"
}

package() {
  cd "$pkgname"

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
