# Maintainer: Bernardo P. G. <bernardopg@users.noreply.github.com>

pkgname=steam-game-idler-git
_pkgname=steam-game-idler
pkgver=5.0.4.r1709.g40d6a453
pkgrel=1
pkgdesc='Idle Steam games and farm trading cards with Linux support'
arch=('x86_64')
url='https://github.com/bernardopg/SGI'
license=('GPL-3.0-only')
depends=(
  'gtk3'
  'libayatana-appindicator'
  'openssl'
  'webkit2gtk-4.1'
)
makedepends=(
  'cargo'
  'dotnet-sdk'
  'git'
  'nodejs'
  'pnpm'
  'rust'
)
provides=('steam-game-idler')
conflicts=('steam-game-idler')
options=('!lto')
source=('git+https://github.com/bernardopg/SGI.git#branch=master')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/SGI"
  git submodule update --init --recursive

  local appver
  local rev
  local hash

  appver=$(grep -m1 '"version"' steam-game-idler/src-tauri/tauri.conf.json | sed -E 's/.*"version": "([^"]+)".*/\1/')
  rev=$(git -C steam-game-idler rev-list --count HEAD)
  hash=$(git -C steam-game-idler rev-parse --short HEAD)

  printf '%s.r%s.g%s' "$appver" "$rev" "$hash"
}

prepare() {
  cd "$srcdir/SGI"
  git submodule update --init --recursive

  cd steam-game-idler
  pnpm install --frozen-lockfile
}

build() {
  cd "$srcdir/SGI/steam-utility-multiplataform"
  dotnet publish src/SteamUtility.Cli/SteamUtility.Cli.csproj \
    -c Release \
    -r linux-x64 \
    --self-contained true \
    -p:PublishSingleFile=true \
    -o "$srcdir/SGI/steam-game-idler/src-tauri/libs"

  cd "$srcdir/SGI/steam-game-idler"
  printf 'KEY=""\n' > .env.prod

  export NEXT_TELEMETRY_DISABLED=1
  export TAURI_CI=1
  pnpm tauri build --bundles deb
}

package() {
  cd "$srcdir/SGI/steam-game-idler"

  local deb
  deb=$(find src-tauri/target/release/bundle/deb -type f -name '*.deb' | head -n1)

  if [[ -z "$deb" ]]; then
    echo 'Tauri did not produce a .deb bundle' >&2
    return 1
  fi

  mkdir -p "$srcdir/deb-extract"
  bsdtar -xf "$deb" -C "$srcdir/deb-extract"
  bsdtar -xf "$srcdir/deb-extract"/data.tar.* -C "$pkgdir"
}
