# Maintainer: João Costa <joaocosta.work@posteo.net>
pkgname="babelfish-fish-git"
_pkgname="babelfish"
pkgver=1.1.0.r4.g2123634
pkgrel=1
pkgdesc="Translate bash scripts to fish"
arch=('x86_64')
url="https://github.com/bouk/babelfish"
license=("custom:MIT")
depends=(
  'glibc'
  'git'
  )
makedepends=('go')
conflicts=('babelfish-fish')
provides=("${pkgname}")
source=("${_pkgname}::git+https://github.com/bouk/babelfish.git")
sha256sums=("SKIP")

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    .
}

package() {
  cd "$_pkgname"

  install -Dvm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "babel.fish" "$pkgdir/usr/share/fish/vendor_conf.d/babel.fish"
  
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

