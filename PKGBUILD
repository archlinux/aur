# Maintainer: atretador
pkgname=classic-addon-manager-git
_pkgname=classic-addon-manager
pkgver=r0.0000000
pkgrel=1
pkgdesc="An addon manager for ArcheAge Classic, built with Go from latest git master"
arch=('x86_64')
url="https://github.com/classic-addon-manager/classic-addon-manager"
license=('MIT')
depends=('glibc')
makedepends=('go' 'npm' 'go-task' 'git' 'wails')
source=(
  "git+$url.git"
  "$_pkgname.desktop"
  "$_pkgname.install"
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

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

  # Build backend first (generates bindings needed by frontend)
  go-task build:prod

  # Then build frontend
  npm install --prefix frontend
  npm run --prefix frontend build
}

package() {
  cd "$srcdir/$_pkgname"

  # Install binary
  install -Dm755 "build/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  # Install desktop file
  install -Dm644 "$srcdir/$_pkgname/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"

  # Install icon from frontend assets
  if [ -f "frontend/src/assets/images/alt_aac-logo.png" ]; then
    install -Dm644 "frontend/src/assets/images/alt_aac-logo.png" \
      "$pkgdir/usr/share/icons/hicolor/128x128/apps/$_pkgname.png"
  fi
}