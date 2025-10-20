# Maintainer: atretador
pkgname=classic-addon-manager-git
_pkgname=classic-addon-manager
pkgver=3.0.4.18.g6e1a44d
pkgrel=1
pkgdesc="An addon manager for ArcheAge Classic, built with Go from latest git master"
arch=('x86_64')
url="https://github.com/classic-addon-manager/classic-addon-manager"
license=('MIT')
depends=('glibc')
makedepends=('go' 'npm' 'go-task' 'git' 'gtk3' 'webkit2gtk-4.1')
source=(
  "git+$url.git"
  "$_pkgname.desktop"
  "$_pkgname.install"
  "icon.png"
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

install=$_pkgname.install

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags --long 2>/dev/null | sed 's/^v//;s/-/./g' || \
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  cp "$srcdir/$_pkgname.desktop" "$srcdir/$_pkgname/$_pkgname.desktop"
  cp "$srcdir/$_pkgname.install" "$srcdir/$_pkgname/$_pkgname.install"
}

build() {
  cd "$srcdir/$_pkgname"

  export PKG_CONFIG_PATH="/usr/lib/pkgconfig:$PKG_CONFIG_PATH"

  export CGO_ENABLED=1
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export GOPATH="${srcdir}/gopath"
  mkdir -p "$GOPATH"

  export PATH="$GOPATH/bin:$PATH"
  go install github.com/wailsapp/wails/v3/cmd/wails3@latest

  rm -rf frontend/node_modules frontend/dist

  # Build
  go-task build:prod
}

package() {
  cd "$srcdir/$_pkgname"

  # Install binary
  install -Dm755 "build/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  # Install desktop file
  install -Dm644 "$srcdir/$_pkgname/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
