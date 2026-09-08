# Maintainer: Lorenzo Cozzaglio <info@lori28167.it>

pkgname=ueransim
pkgver=3.3.0
pkgrel=1
pkgdesc="Open source 5G UE and RAN (gNodeB) implementation"
arch=('x86_64' 'aarch64')
url="https://github.com/aligungr/UERANSIM"
license=('AGPL-3.0-or-later')
depends=('lksctp-tools' 'gcc-libs' 'glibc')
makedepends=('cmake')
backup=('etc/ueransim/custom-gnb.yaml'
        'etc/ueransim/custom-ue.yaml'
        'etc/ueransim/free5gc-gnb.yaml'
        'etc/ueransim/free5gc-ue.yaml'
        'etc/ueransim/open5gs-gnb.yaml'
        'etc/ueransim/open5gs-ue.yaml')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('80b17bb4959dc4d841ea41a6b6b8d694c58497fa79dc13edc14b677e6c0548f6')

_srcdir="UERANSIM-$pkgver"

prepare() {
  # nr-binder preloads the shim from the current directory; point it at the
  # installed library instead.
  sed -i 's|LD_PRELOAD=\./libdevbnd\.so|LD_PRELOAD=/usr/lib/libdevbnd.so|' \
    "$_srcdir/tools/nr-binder"
}

build() {
  cmake -B build -S "$_srcdir" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

package() {
  install -Dm755 -t "$pkgdir/usr/bin" \
    build/nr-gnb build/nr-ue build/nr-cli
  install -Dm755 "$_srcdir/tools/nr-binder" "$pkgdir/usr/bin/nr-binder"
  install -Dm755 build/libdevbnd.so "$pkgdir/usr/lib/libdevbnd.so"

  install -Dm644 -t "$pkgdir/etc/ueransim" "$_srcdir"/config/*.yaml
  install -Dm644 -t "$pkgdir/usr/share/ueransim" \
    "$_srcdir/tools/rls-wireshark-dissector.lua"

  install -Dm644 "$_srcdir/README.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$_srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
