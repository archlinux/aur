# Maintainer: Florijan Hamzic <florijanh@gmail.com>

pkgname=flannel-cni-plugin
pkgver=0.0.1
pkgrel=1
pkgdesc='Flannel cni plugin, maintained by flannel-io'
arch=(x86_64)
url="https://github.com/flannel-io/cni-plugin"
license=(Apache)
depends=(glibc)
makedepends=(go)
options=('emptydirs')
source=($pkgname-$pkgver.tar.gz::$url/archive/main.tar.gz)
sha512sums=('1c19bb77c2dc4ffb5b8ef1a0bad8b0f9216b8bce9b6135504755c5f1f8688adc3d7a7bd777b3dcf6f3375e2b3d86d101c0d9496706f3db62d9ebce3f962010e8')
b2sums=('1eda3d58978e4d1e5b443b75babe06fafaa543ef1f5911e62284333700a280833176ce7cd554d90669aa25c17e10efa9acc15a42aaeba282455ba0fe24fab1ea')

build() {
  cd cni-plugin-main

  go mod vendor && go mod tidy

  make build_linux
}

package() {
  cd cni-plugin-main
  install -vDm755 bin/* -t "$pkgdir/usr/lib/cni/"

  # Some CNI stuff would build their binaries into /usr/lib/cni with the
  # old approach. This is unfortunate so we'll just symlink each binary
  # instead.
  install -vDm755 bin/* -t "$pkgdir/opt/cni/bin/"
}
