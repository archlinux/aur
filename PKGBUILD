# Maintainer: Florijan Hamzic <florijanh@gmail.com>

pkgname=flannel-cni-plugin
pkgver=1.1
pkgrel=2
pkgdesc='Flannel cni plugin, maintained by flannel-io'
arch=(x86_64)
url="https://github.com/flannel-io/cni-plugin"
license=(Apache)
depends=(glibc)
makedepends=(go)
options=('emptydirs')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('cfd966568095f82ff5af5d49f40f723454f70df5ee1c30dd27210afd2b71f7de4cd52c5e3fe9a8187885e8ae59065d6f87358a68a7a78e2379a0d13f899bb7d0')
b2sums=('22b87abbbfa56c9dac4e9023d5c7ad905ddc59ebd8994c3faf902f591f682a8181ddc7f6356b81d4e5a5153cc9d06e62bd17a46f1f866c51cabe73c681d0dbe7')

build() {
  cd cni-plugin-$pkgver

  go mod vendor && go mod tidy

  make build_linux
}

package() {
  cd cni-plugin-$pkgver
  install -vDm755 bin/* -t "$pkgdir/usr/lib/cni/"

  # Some CNI stuff would build their binaries into /usr/lib/cni with the
  # old approach. This is unfortunate so we'll just symlink each binary
  # instead.
  install -vDm755 bin/* -t "$pkgdir/opt/cni/bin/"
}
