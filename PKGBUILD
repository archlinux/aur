# Maintainer: Lorenzo Cozzaglio <info@lori28167.it>

pkgname=ueransim-git
_pkgname=ueransim
pkgver=3.3.0.r0.gd5a3ba6
pkgrel=1
pkgdesc="Open source 5G UE and RAN (gNodeB) implementation (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/aligungr/UERANSIM"
license=('AGPL-3.0-or-later')
depends=('lksctp-tools' 'gcc-libs' 'glibc')
makedepends=('cmake' 'git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
backup=('etc/ueransim/custom-gnb.yaml'
        'etc/ueransim/custom-ue.yaml'
        'etc/ueransim/free5gc-gnb.yaml'
        'etc/ueransim/free5gc-ue.yaml'
        'etc/ueransim/open5gs-gnb.yaml'
        'etc/ueransim/open5gs-ue.yaml')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # nr-binder preloads the shim from the current directory; point it at the
  # installed library instead.
  sed -i 's|LD_PRELOAD=\./libdevbnd\.so|LD_PRELOAD=/usr/lib/libdevbnd.so|' \
    "$_pkgname/tools/nr-binder"
}

build() {
  cmake -B build -S "$_pkgname" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  install -Dm755 -t "$pkgdir/usr/bin" \
    build/nr-gnb build/nr-ue build/nr-cli
  install -Dm755 "$_pkgname/tools/nr-binder" "$pkgdir/usr/bin/nr-binder"
  install -Dm755 build/libdevbnd.so "$pkgdir/usr/lib/libdevbnd.so"

  install -Dm644 -t "$pkgdir/etc/ueransim" "$_pkgname"/config/*.yaml
  install -Dm644 -t "$pkgdir/usr/share/ueransim" \
    "$_pkgname/tools/rls-wireshark-dissector.lua"

  install -Dm644 "$_pkgname/README.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$_pkgname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
