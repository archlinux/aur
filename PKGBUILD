# Maintainer: Debendra Oli <debendraoli@pm.me>

pkgname=iam-policy-json-to-terraform
pkgver=1.8.0
pkgrel=1
pkgdesc="Small tool to convert an IAM Policy in JSON format into a Terraform aws_iam_policy_document"
arch=('any')
url="https://github.com/flosell/iam-policy-json-to-terraform"
license=('Apache License 2.0')
makedepends=('go' 'make')
sha256sums=('428ee4c7c40a77c3f2c08f1ea5b5ac145db684bba038ab113848e1697ef906dc')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
)

build() {
  cd "$pkgname-$pkgver"

   # define buildtime for use in man page & binary
  local build_time="$(date -d@"$SOURCE_DATE_EPOCH" +%Y%m%d-%H:%M:%S)"

  # verify go modules
  go mod verify

  # build binary
  CGO_ENABLED=1 go build -v \
    -trimpath \
    -modcacherw \
    -ldflags "-extldflags ${LDFLAGS} \
      -X main.Version=${pkgver} \
      -X main.BuildTime=${build_time}" \
    -o $pkgname

 }

package() {
  cd "$pkgname-$pkgver"
  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "$pkgname"
}
