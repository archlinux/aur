# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=tecli
pkgver=v0.5.0
_pkgver=$pkgver-alpha
pkgrel=3
# pkglint: ignore=PB906
pkgdesc="In a world where everything is Terraform, teams use Terraform Cloud API to manage their workloads. TECLI increases teams productivity by facilitating such interaction and by providing easy commands that can be executed on a terminal or on CI/CD systems."
arch=('x86_64' 'aarch64')
url="https://github.com/awslabs/tecli"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go' 'git')
_commit='cd66488cad56325188b4d8da2a5110d588323f52'
source=("git+https://github.com/awslabs/tecli.git#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname" || exit
  go mod download -modcacherw
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  cd "$pkgname" || exit
  go build -buildmode=pie \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags='-s -w' \
    -o $pkgname \
    .
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
