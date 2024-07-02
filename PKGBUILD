# Maintainer: Jan Hensel <ja_he@uni-bremen.de>
pkgname=dayplan
pkgver=0.9.11
pkgrel=3
arch=('x86_64')
pkgdesc="Utility to plan your day and track your time"
license=('MIT')
url="https://github.com/ja-he/dayplan"
depends=('glibc')
makedepends=('go')
optdepends=()
backup=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ce24b24b0bc66875e8611b1a4c808e86a98bafc8360838a0622fa510d105ee4d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  project_base="github.com/ja-he/dayplan"
  source_root="${project_base}/internal"
  go build -v \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags="-X '${source_root}/control/cli.version=v${pkgver}' -X '${source_root}/control/cli.hash=aur build from v${pkgver}-${pkgrel}'" \
    -buildmode=pie \
    cmd/dayplan.go
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "./dayplan" "$pkgdir/usr/bin/dayplan"
  install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/dayplan/LICENSE"
}
