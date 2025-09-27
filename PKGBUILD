# Maintainer: atretador
pkgname=classic-addon-manager-git
_pkgname=classic-addon-manager
pkgver=0.0
pkgrel=1
pkgdesc="An addon manager for ArcheAge Classic, built with Go from latest git master"
arch=('x86_64')
url="https://github.com/classic-addon-manager/classic-addon-manager"
license=('MIT')
depends=('glibc')
makedepends=('go' 'npm' 'go-task' 'git')
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
  # Ensure local desktop file and install script exist
  cp "$srcdir/$_pkgname.desktop" "$srcdir/$_pkgname/$_pkgname.desktop"
  cp "$srcdir/$_pkgname.install" "$srcdir/$_pkgname/$_pkgname.install"
}

build() {
  cd "$srcdir/$_pkgname"

  export CGO_ENABLED=1
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export GOPATH="${srcdir}/gopath"
  mkdir -p "$GOPATH"

  # Ensure clean build
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

  # Install icon
  for size in 16 22 32 48 64 128 256; do
    install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/classicaddonmanager.png"
  done
}