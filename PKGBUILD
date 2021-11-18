# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=boundary
pkgver=0.7.0
# UI version found at: internal/ui/VERSION
# tar -O -xf boundary-$pkgver.tar.gz boundary-$pkgver/internal/ui/VERSION | head -n 1 | cut -d ' ' -f 1
_uiver='8193aac84562b1883465724d67bd43cd763edd7e'
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
sha512sums=('01bf00282797887972d9dd79f3d8461f37b9a00fa8061da10e170377916decebfe5cae50e3e86c06bf19b8af628d606d057798c53dc38ec74c5f2e7e35038e8f'
        '08b2c70e89309e40e5afe68897864d1ac51195ce34e07cdcf8f49ccf7037c738453a5c3922d42a7d3516f028e2e27de4e30bf71b5bc9e0872dea2e8667576736'
        '21b2b2040aed7e6e9d9a8ae42ee70df61a0cff8a6a56eb6dbc8d9816fb298e246ebe655439a0985d79d188bb7dbb96914c3fa397f9233cd69eef57288c15519d'
        'c35684fbcd28d6aa23abf9e3765321a9434f3826c5d84f5dc95f0695df78007b2f1cb535eeab3a8157f27f7cb6c2444bf40efc468b6a8017de07f87a095e50a1'
        '155721b62bf6d820c59b711f547cfdb5c42c7ad713e1e0bb3d973af511b4d5fd57a913c59a39045af7213b19e6fb76e5836190a2c630e2f93bba975657cd719d'
        '6c1cf64c430d711b544d9655af746b6525d9ee9c441f7842ee2f115b52886e37c684f97cf30b753971b3ac18a731b4249c7ed8e5311cc759bd69d2a62e089aff')
b2sums=('01bf00282797887972d9dd79f3d8461f37b9a00fa8061da10e170377916decebfe5cae50e3e86c06bf19b8af628d606d057798c53dc38ec74c5f2e7e35038e8f'
        '08b2c70e89309e40e5afe68897864d1ac51195ce34e07cdcf8f49ccf7037c738453a5c3922d42a7d3516f028e2e27de4e30bf71b5bc9e0872dea2e8667576736'
        '21b2b2040aed7e6e9d9a8ae42ee70df61a0cff8a6a56eb6dbc8d9816fb298e246ebe655439a0985d79d188bb7dbb96914c3fa397f9233cd69eef57288c15519d'
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

  cd "$pkgname-$pkgver"

  # create directory for build output
  mkdir build

  # download go modules
  go mod download

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

  # boundary plugins
  # extracted from ./scripts/build.sh
  cd "$srcdir/$pkgname-$pkgver"
  ORIG_PATH=$(pwd)
  for PLUGIN_TYPE in host; do
    for CURR_PLUGIN in $(ls $ORIG_PATH/plugins/$PLUGIN_TYPE/mains); do
      cd $ORIG_PATH/plugins/$PLUGIN_TYPE/mains/$CURR_PLUGIN
      go build -v \
        -o $ORIG_PATH/plugins/$PLUGIN_TYPE/assets/boundary-plugin-${PLUGIN_TYPE}-${CURR_PLUGIN} \
        .
      cd $ORIG_PATH
    done
    cd $ORIG_PATH/plugins/$PLUGIN_TYPE/assets
    for CURR_PLUGIN in $(ls); do
      gzip -f -9 $CURR_PLUGIN
    done
    cd $ORIG_PATH
  done

  # boundary
  go build -v \
    -buildmode=pie \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS} \
    -X github.com/hashicorp/boundary/version.GitCommit=tarball \
    -X github.com/hashicorp/boundary/version.Version=$pkgver" \
    -tags "ui" \
    -o build ./cmd/...
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "build/$pkgname"

  # systemd integration
  install -vDm644 ../tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  install -vDm644 ../sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -vDm644 -t "$pkgdir/usr/lib/systemd/system" \
    "build/$pkgname-worker.service" \
    "build/$pkgname-controller.service"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
