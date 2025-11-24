# Maintainer: Matt Quintanilla <matt @ matt quintanilla .xyz>
# Maintainer: ArjixWasTaken <me@arjix.dev>

pkgname=winboat
pkgver=0.9.0
pkgrel=2
pkgdesc="Run Windows apps on Linux with seamless integration"
arch=('x86_64')
url="https://www.winboat.app"
license=('MIT')
depends=(
  'alsa-lib'
  'docker'
  'docker-compose'
  'freerdp'
  'gtk3'
  'nss'
)
makedepends=(
  'git'
  'npm'
  'go'
  'zip'
  'imagemagick'
)
options=('!strip')
source=("git+https://github.com/TibixDev/winboat.git#tag=v$pkgver")
sha256sums=('11051ae91c399ccc75ef69910d4e8a526f6cc50210f9c70525829d5017715cce')

prepare(){
  cd "$pkgname"

  sed -i 's/electron-builder --linux/electron-builder --linux dir/' package.json
}

build() {
  cd "$pkgname"

  export npm_config_cache="$srcdir/npm_cache"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  npm install
  npm run build:linux-gs

  # Clean module cache for makepkg -C
  go clean -modcache

  mkdir dist/.icon-set
  for i in 16 32 48 64 128 256 512; do
    magick -background none icons/winboat_logo.svg -resize "${i}x${i}" "dist/.icon-set/icon_${i}x${i}.png"
  done
}

package() {
  cd "$pkgname"
  install -d "$pkgdir/opt/$pkgname/"
  cp -a dist/linux-unpacked/* "$pkgdir/opt/$pkgname/"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

  for i in 16 32 48 64 128 256 512; do
    install -Dm644 dist/.icon-set/icon_${i}x${i}.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
  done

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Name=WinBoat
Exec=/opt/$pkgname/$pkgname
Icon=$pkgname
Terminal=false
Type=Application
Comment=Run Windows apps on Linux with seamless integration
EOF
}
