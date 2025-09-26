# Maintainer: Your Name <your@email>
pkgname=classic-addon-manager-git
_pkgname=classic-addon-manager
pkgver=r0.0000000
pkgrel=1
pkgdesc="An addon manager for ArcheAge Classic, built with Go latest git master"
arch=('x86_64')
url="https://github.com/classic-addon-manager/classic-addon-manager"
license=('MIT')
depends=('glibc')
makedepends=('go' 'npm' 'go-task' 'git')
source=(
  "git+$url.git"
  "$_pkgname.desktop"
)
sha256sums=('SKIP' 'SKIP')

install=$_pkgname.install

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags --long 2>/dev/null | sed 's/^v//;s/-/./g' || \
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"

  export CGO_ENABLED=1
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export GOPATH="${srcdir}/gopath"
  mkdir -p "$GOPATH"

  npm install --prefix frontend
  npm run --prefix frontend build

  go-task build:prod
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 "build/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"

  if [ -f "resources/icon.png" ]; then
    install -Dm644 resources/icon.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/$_pkgname.png"
  fi
}