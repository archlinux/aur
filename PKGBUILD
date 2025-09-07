# Maintainer: Matt Quintanilla <matt @ matt quintanilla .xyz>
pkgname='winboat-git'
_pkgname='winboat'
pkgver=r125.221847b
pkgrel=1
pkgdesc='Run Windows apps on Linux with seamless integration'
arch=(x86_64)
url='https://www.winboat.app'
license=('MIT')
provides=(${_pkgname})
conflicts=(${_pkgname})
depends=('docker' 'electron' 'docker-compose' 'freerdp' 'gtk3' 'alsa-lib' 'nss')
makedepends=('zip' 'npm' 'go' 'git')
options=("!strip" "!debug")
source=("git+https://github.com/tibixdev/winboat.git")

sha256sums=('SKIP')

pkgver() {
  cd "winboat"
  #git describe --tags | sed 's/-/+/g'
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
 }
prepare(){
cd "$_pkgname"
sed -i 's/"rpm",//g' electron-builder.json
}
build() {
  cd "$_pkgname"
  export npm_config_cache="$srcdir/npm_cache"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  npm ci
  npm run build:linux-gs

  # Clean module cache for makepkg -C
  go clean -modcache
}

package() {
  cd "$_pkgname"
  install -d "$pkgdir/opt/$_pkgname/"
  cp -a dist/linux-unpacked/* "$pkgdir/opt/$_pkgname/"

  install -d "$pkgdir/usr/bin"
  ln -s "opt/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  for i in 16 32 48 64 128 256 512; do
    install -Dm644 dist/.icon-set/icon_${i}x${i}.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png"
  done

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" <<EOF
[Desktop Entry]
Name=WinBoat
Exec=/opt/$_pkgname/$_pkgname
Icon=$_pkgname
Terminal=false
Type=Application
Comment=Run Windows apps on Linux with seamless integration
EOF
}
