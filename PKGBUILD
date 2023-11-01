# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname='gut'
pkgver=0.3.0
pkgrel=1
pkgdesc='An easy-to-use git client'
arch=('aarch64' 'x86_64')
url="https://github.com/julien040/$pkgname"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
options=('lto')
_pkgdate='2023-11-01'
_pkgver="$pkgver ($_pkgdate)"

prepare() {
  cd "$pkgname-$pkgver"

  sed -i "s|var gutVersion = \"dev\"|var gutVersion = \"$_pkgver\"|g" \
    src/telemetry/telemetry.go
}

build() {
  cd "$pkgname-$pkgver"

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  go mod tidy

  go build \
    -buildmode=pie \
    -trimpath \
    -ldflags="-linkmode=external" \
    -mod=readonly \
    -modcacherw \
     .
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 "$pkgname"   "$pkgdir/usr/bin/$pkgname"
  for _doc in README SECURITY future_of_gut; do
    install -Dm0644 "$_doc.md" "$pkgdir/usr/share/doc/$pkgname/$_doc.md"
  done
  install -Dm0644 "LICENSE"    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=(
  '3a419379fd27bb6d7b8383a684d29ec2ab137a17f3f9102c6d1dcc7670467d05'
)
b2sums=(
  '4a302c6b07aaad5f96b4c695fc3285bfed8b2223eb1f77677017d07aff2c6e3635f854d20c555024dd004e387fb1665db4366a3909d31302ff7895f164233203'
)

# 🪷 Beyond the Known — 365 Days of Exploration
#
# 📆 1st November
#
# True liberation is at the end.
#
# The end is the beginning.
#
# 🔗 https://magnetic-ink.dk/users/btk

# eof
