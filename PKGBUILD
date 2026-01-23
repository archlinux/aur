# Maintainer: Matt Quintanilla <matt @ matt quintanilla .xyz>
pkgname='winboat-git'
_pkgname='winboat'
pkgver=r297.c317316
pkgrel=2
pkgdesc='Run Windows apps on Linux with seamless integration'
arch=(x86_64)
url='https://www.winboat.app'
license=('MIT')
provides=(${_pkgname})
conflicts=(${_pkgname})
depends=('libxcrypt-compat' 'electron' 'freerdp' 'gtk3' 'alsa-lib' 'nss')
makedepends=('zip' 'npm' 'go' 'git')
optdepends=('docker: To use docker as a container runtime' 'podman-compose: To use podman as a container runtime')
options=("!strip" "!debug")
source=("git+https://github.com/tibixdev/winboat.git" "winboat.install")

sha256sums=('SKIP'
            '28a16c9651a8283793d4ed0f8a8358ada22a467cd1a1a4ed091eb6a9674da41d')

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

  mkdir dist/.icon-set
  for i in 16 32 48 64 128 256 512; do
    magick -background none icons/winboat_logo.svg -resize "${i}x${i}" "dist/.icon-set/icon_${i}x${i}.png"
    done
    install -Dm644 dist/.icon-set/icon_${i}x${i}.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" <<EOF
[Desktop Entry]
Name=WinBoat
Exec=/opt/$_pkgname/$_pkgname
Icon=$_pkgname
Terminal=false
Categories=System
Type=Application
Comment=Run Windows apps on Linux with seamless integration
EOF
}
