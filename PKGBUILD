# Maintainer: Jan Hensel <ja_he@uni-bremen.de>
pkgname=dayplan
pkgver=0.9.0
pkgrel=1
arch=('x86_64')
pkgdesc="Utility to plan your day and track your time"
license=('MIT')
url="https://github.com/ja-he/dayplan"
depends=('glibc')
makedepends=('go')
optdepends=()
backup=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('872ab536d97b908ba6f42a6669806cf10d01daf4c700fd2538f7731e6e1d9a3d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  project_base="github.com/ja-he/dayplan"
  source_root="${project_base}/internal"
  go build -v \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags="-X '${source_root}/control/cli.version=v${pkgver}' -X '${source_root}/control/cli.hash=aur build from v${pkgver}'" \
    -buildmode=pie \
    cmd/dayplan.go
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "./dayplan" "$pkgdir/usr/bin/dayplan"
  install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/dayplan/LICENSE"
}
