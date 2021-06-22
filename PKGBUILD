# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=boundary
pkgver=0.3.0
# UI version found at: internal/ui/VERSION
# head -n 1 $pkgname-$pkgver/internal/ui/VERSION | cut -d ' ' -f 1
_uiver=40ee317f47100e0be459f9c6aee12e966efd7961
pkgrel=1
pkgdesc="Enables identity-based access management for dynamic infrastructure"
arch=('x86_64')
url="https://www.boundaryproject.io/"
license=('GPL')
depends=('glibc')
makedepends=(
  # boundary
  'git' 'go'
  # boundary-ui
  'nodejs-lts-fermium' 'yarn'
)
optdepends=('postgresql: for local postgresql instance')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/hashicorp/boundary/archive/v$pkgver.tar.gz"
  "$pkgname-ui-$_uiver.tar.gz::https://github.com/hashicorp/boundary-ui/archive/$_uiver.tar.gz"
  'systemd.service'
  'tmpfiles.conf'
  'sysusers.conf'
)
noextract=("$pkgname-ui-$_uiver.tar.gz")
b2sums=('7e0e1d87cfea9a228b1188b9e85eecd969c5a0e481111defcd0853b1027f26941055a200d806d63c07667feae316f8899b1120c3b522e06758f396bdfae976d4'
        'e0e24dc3dde4293d8d129d41c7bdf2a9c80995fdd05d1b4c1093f4275145e60921fd0ef8b330eeca89fb2939758381ceeecd009d268e32742479c8c13e66a8dd'
        'c35684fbcd28d6aa23abf9e3765321a9434f3826c5d84f5dc95f0695df78007b2f1cb535eeab3a8157f27f7cb6c2444bf40efc468b6a8017de07f87a095e50a1'
        '155721b62bf6d820c59b711f547cfdb5c42c7ad713e1e0bb3d973af511b4d5fd57a913c59a39045af7213b19e6fb76e5836190a2c630e2f93bba975657cd719d'
        '6c1cf64c430d711b544d9655af746b6525d9ee9c441f7842ee2f115b52886e37c684f97cf30b753971b3ac18a731b4249c7ed8e5311cc759bd69d2a62e089aff')

prepare() {
  # extract boundary-ui
  mkdir -p "$pkgname-$pkgver/internal/ui/.tmp/boundary-ui"
  bsdtar \
    --strip-components 1 \
    --directory "$pkgname-$pkgver/internal/ui/.tmp/boundary-ui" \
    --extract --file "$pkgname-ui-$_uiver.tar.gz"

  # download go modules
  cd "$pkgname-$pkgver"
  mkdir build
  go mod vendor

  # create systemd units from template
  cd build
  for unit in worker controller; do
    sed "s/@@TYPE@@/$unit/" "$srcdir/systemd.service" > "$pkgname-$unit.service"
  done
}

build() {
  # boundary-ui
  cd "$pkgname-$pkgver/internal/ui/.tmp/boundary-ui"
  yarn install
  yarn build

  # boundary
  cd "$srcdir/$pkgname-$pkgver"
  go build -v \
    -buildmode=pie \
    -trimpath \
    -mod=vendor \
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS} \
    -X github.com/hashicorp/boundary/version.GitCommit=$pkgver" \
    -tags "ui" \
    -o build ./cmd/...
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 "build/$pkgname" -t "$pkgdir/usr/bin"

  # systemd integration
  install -vDm644 ../tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  install -vDm644 ../sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -vDm644 -t "$pkgdir/usr/lib/systemd/system" \
    "build/$pkgname-worker.service" \
    "build/$pkgname-controller.service" \

  # license
  install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
