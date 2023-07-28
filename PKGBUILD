# Maintainer: Florijan Hamzic <florijanh@gmail.com>

pkgname=flannel-cni-plugin
pkgver=1.2.0
pkgrel=1
pkgdesc='Flannel cni plugin, maintained by flannel-io'
arch=(x86_64)
url="https://github.com/flannel-io/cni-plugin"
license=(Apache)
depends=(glibc)
makedepends=(go)
options=('emptydirs')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('cf2eb35bea94c1fe123d9f9871bb83ffe863c8375b10a8cffdb1c289b42296fdbb07fcb1e192ba7ed02930dc1163425883238b62a882836327adca9837438c19')
b2sums=('9fa3ebcfbde4bba89c7d81bbd0427c7b1d2c0bf104bd90f1cd93e4caed114621d24b00580beb9b040614d717710e4663a4f66b01108f664a05b0043732efe289')

build() {
  cd cni-plugin-$pkgver

  go mod vendor && go mod tidy

  make build_linux
}

package() {
  cd cni-plugin-$pkgver
  mv dist/flannel-amd64 dist/flannel
  install -vDm755 dist/flannel -t "$pkgdir/usr/lib/cni"

  # Some CNI stuff would build their binaries into /usr/lib/cni with the
  # old approach. This is unfortunate so we'll just symlink each binary
  # instead.
  install -vDm755 dist/flannel -t "$pkgdir/opt/cni/bin"
}
