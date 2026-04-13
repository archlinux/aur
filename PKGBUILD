# Maintainer: Julien Virey <julien.virey+aur@gmail.com>
# Contributor Martino Pilia <martino.pilia@gmail.com>

pkgname=checkmake
pkgver=0.3.2
pkgrel=1
pkgdesc="Linter/analyzer for Makefiles"
arch=('x86_64' 'aarch64')
url="https://github.com/mrtazz/checkmake"
license=('MIT')
depends=('glibc')
makedepends=('go' 'pandoc')
conflicts=('checkmake-git' 'checkmake-bin')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('450412ba6500ef7c4c8a0150a5e1a3d2e76591ce9f37609bcbd5508298ad9bef')

prepare() {
  cd "$pkgname-$pkgver"
  export GOMODCACHE="${GOMODCACHE:-$srcdir/gomod}"
  go mod download -modcacherw
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export BUILDER_NAME="${BUILDER_NAME:-$(git config user.name || echo makepkg)}"
  export BUILDER_EMAIL="${BUILDER_EMAIL:-$(git config user.email || echo makepkg)}"
  make EXT_LDFLAGS="-linkmode external" GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  # Clean up deps
  go clean -modcache
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 checkmake "${pkgdir}/usr/bin/checkmake"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 checkmake.1 "${pkgdir}/usr/share/man/man1/checkmake.1"
}
