# Maintainer: TheElevatedOne <adam.mlady@elevated.ovh>

pkgname=k86-software-bin
_pkgname=k86-software
_tarname=attackshark-k86
pkgver=0.2.1
pkgrel=1
pkgdesc='Configuration software for the Attack Shark K86 keyboard (CLI, GTK 3 GUI and C library, prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/TheElevatedOne/K86-Software-Linux'
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc' 'gtk3' 'libayatana-appindicator')
provides=("$_pkgname=$pkgver" 'libk86.so')
conflicts=("$_pkgname" "$_tarname")
# The release binaries are already stripped.
options=('!debug' '!strip')
# Release tags have no "v" prefix.
source_x86_64=("$url/releases/download/$pkgver/$_tarname-$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$url/releases/download/$pkgver/$_tarname-$pkgver-linux-aarch64.tar.gz")
sha256sums_x86_64=('2c3d0597c2f8d7fec1864f5d619ec38fb2dd9c7025c0de4708172a3a422913b6')
sha256sums_aarch64=('e71d9f01deb7df2a2ff279ca32b008dd562c93c45b228a9a590558985fdb582e')

package() {
  cd "$_tarname-$pkgver-linux-$CARCH"
  install -Dm755 bin/k86ctl bin/k86-gui -t "$pkgdir/usr/bin"
  install -Dm644 lib/udev/rules.d/70-attackshark-k86.rules -t "$pkgdir/usr/lib/udev/rules.d"
  # libk86 (C API)
  install -Dm755 lib/libk86.so.0 -t "$pkgdir/usr/lib"
  ln -s libk86.so.0 "$pkgdir/usr/lib/libk86.so"
  install -Dm644 lib/pkgconfig/k86.pc -t "$pkgdir/usr/lib/pkgconfig"
  install -Dm644 include/k86/k86.h -t "$pkgdir/usr/include/k86"
  # Desktop entry and icons
  find share -type f -exec install -Dm644 {} "$pkgdir/usr/{}" \;
  install -Dm644 README.md PROTOCOL.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
