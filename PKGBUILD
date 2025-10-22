# Maintainer: Matt Quintanilla <matt @ matt quintanilla .xyz>
# Maintainer: ArjixWasTaken <me@arjix.dev>
# Contributor: tiziodcaio <d dot bass05 at pm dot me>

_pkgname=winboat
pkgname=winboat-electron
pkgver=0.8.7
pkgrel=4
pkgdesc="Run Windows apps on Linux with seamless integration"
arch=('x86_64')
url="https://www.winboat.app"
license=('MIT')
_electron=electron38
depends=(
  'alsa-lib'
  'docker'
  'docker-compose'
  'freerdp'
  'gtk3'
  'nss'
  "$_electron"
)
makedepends=(
  'git'
  'npm'
  'go'
  'zip'
  'imagemagick'
  # 'asar'
)
options=('!strip')
source=("git+https://github.com/TibixDev/winboat.git#tag=v$pkgver")
sha256sums=('bf74ba69a303235d671a61b881dc42c9ce0dc99bcbcaab6713f43eb160984014')
provides=('winboat')
conflicts=('winboat')

prepare(){
  cd "$_pkgname"

  ## don't use resourcesPath
  sed --in-place -e "s/process\.resourcesPath, '/'\/usr\/lib\/winboat\//g" ./src/renderer/lib/*.ts

  export npm_config_cache="$srcdir/npm_cache"
  npm install
}

build() {
  cd "$_pkgname"

  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  #build:linux-gs
  bash build-guest-server.sh
  node scripts/build.ts
  npx electron-builder --linux  --dir \
         -c.electronDist=/usr/lib/"$_electron" \
         -c.electronVersion="$(</usr/lib/${_electron}/version)"

  # Clean module cache for makepkg -C
  go clean -modcache

  mkdir -p dist/.icon-set
  for i in 16 32 48 64 128 256 512; do
    magick icons/icon.png -resize "${i}x${i}" "dist/.icon-set/icon_${i}x${i}.png"
  done
}

package() {
  cd "$_pkgname"
  install -Dm755 /dev/null "${pkgdir}/usr/bin/$_pkgname"
  cat >>"${pkgdir}/usr/bin/$_pkgname" <<EOD
#! /usr/bin/sh
exec $_electron /usr/lib/$_pkgname/app.asar "\$@"
EOD
  install -d "$pkgdir/usr/lib/$_pkgname/"

  cp -a dist/linux-unpacked/resources/** "$pkgdir/usr/lib/$_pkgname"

  for i in 16 32 48 64 128 256 512; do
    install -Dm644 dist/.icon-set/icon_${i}x${i}.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png"
  done

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" <<EOF
[Desktop Entry]
Name=WinBoat
Exec=/usr/bin/$_pkgname
Icon=$_pkgname
Terminal=false
Type=Application
Comment=Run Windows apps on Linux with seamless integration
EOF
}
