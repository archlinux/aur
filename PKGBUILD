# Maintainer: Marcel Campello <marcel@prafrentex.com.br>
pkgname=opentofu
pkgver=1.6.0_rc1
_pkgver="${pkgver//_/-}"
pkgrel=1
pkgdesc="The open source infrastructure as code tool."
arch=('x86_64')
url="https://opentofu.org"
license=('MPL2')
makedepends=(
  'go>=1.21.3'
)
source=("https://github.com/opentofu/opentofu/archive/refs/tags/v$_pkgver.tar.gz")
sha256sums=('39a0d341ac64c129b6d0d6a9d1707f78d3252606cdee036826e592b95b663f3d')

build() {
  cd "$pkgname-$_pkgver"
  go build \
     -buildmode=pie \
     -trimpath \
     -mod=readonly \
     -modcacherw \
     -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" -w -s -X 'github.com/opentofu/opentofu/version.dev=no'" \
     -o ./ \
     ./cmd/...
}

check() {
  cd "$pkgname-$_pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$_pkgver"

  # executable
  install tofu -t "$pkgdir"/usr/bin/ -D -m 0755

  # documentation
  local docdir="$pkgdir/usr/share/doc/$pkgname/"
  docs=( BUILDING.md
         CHANGELOG.md
         CODE_OF_CONDUCT.md
         CONTRIBUTING.md
         DEBUGGING.md
         MAINTAINERS
         MIGRATION_GUIDE.md
         README.md
         SECURITY.md )
  for doc in ${docs[@]}; do
    install $doc -t "$docdir" -D -m 0644
  done
  cp -r docs "$docdir/core_codebase_documentation"

  # license
  install LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/" -D -m 0644
}
