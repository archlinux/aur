# Maintainer: Florijan Hamzic <florijanh@gmail.com>

pkgname=flannel-cni-plugin
pkgver=1.0.0
pkgrel=1
pkgdesc='Flannel cni plugin, maintained by flannel-io'
arch=(x86_64)
url="https://github.com/flannel-io/cni-plugin"
license=(Apache)
depends=(glibc)
makedepends=(go)
options=('emptydirs')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('4b75cfe2af334b974093e520657a92f69e2d20b43319d8425d7f024aef0ed5b923908a55fe146a561a5e3e83be9fda218e4317b29d9e58c2f414402c58f0fea6')
b2sums=('785bc80a097a9e8cf1fd98f3bd53d68828f150b3caff14c7a59071656989add536bfd01028efc86a5751a069363d06e46bfba6a8d0baf3bd27f3539271df88b5')

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
