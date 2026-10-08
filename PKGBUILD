# Maintainer: Andres <andresdortiz@gmail.com>
pkgname=dreamdump-bin
pkgver=0.6.0
pkgrel=1
pkgdesc='Dump Sega Dreamcast GD-ROM discs'
arch=('i686' 'x86_64' 'aarch64')
url='https://codeberg.org/MoriGM/dreamdump'
license=('MIT')
provides=('dreamdump')
conflicts=('dreamdump' 'dreamdump-git')
# Upstream's static Go binary has DWARF that debugedit cannot rewrite.
options=('!strip' '!debug')
# Upstream release assets are named dreamdump-_linux_<goarch>.
source=(
  "dreamdump-$pkgver.tar.gz::https://codeberg.org/MoriGM/dreamdump/archive/$pkgver.tar.gz"
)
source_i686=("dreamdump-$pkgver-linux-386::https://codeberg.org/MoriGM/dreamdump/releases/download/$pkgver/dreamdump-_linux_386")
source_x86_64=("dreamdump-$pkgver-linux-amd64::https://codeberg.org/MoriGM/dreamdump/releases/download/$pkgver/dreamdump-_linux_amd64")
source_aarch64=("dreamdump-$pkgver-linux-arm64::https://codeberg.org/MoriGM/dreamdump/releases/download/$pkgver/dreamdump-_linux_arm64")
noextract=(
  "dreamdump-$pkgver-linux-386"
  "dreamdump-$pkgver-linux-amd64"
  "dreamdump-$pkgver-linux-arm64"
)
sha256sums=('7ec6930802a6a952e45ac551f0d773c833b4524bda8b3e4168e0ede4e0226f88')
sha256sums_i686=('feaf4688b938f90fe62e903544d6aa30066503416122f526173b94f153170a92')
sha256sums_x86_64=('45ccf5152536ce2eb36c3bc8420c9d3615c2ec401c7ecd04478d4b79a787d0d7')
sha256sums_aarch64=('c72df283245729f71d34d5a52c1e3b68ec1b5631cc0b17100f08775941e7b561')

package() {
  local bins=("$srcdir/dreamdump-$pkgver-linux-"*)
  if (( ${#bins[@]} != 1 )) || [[ ! -f ${bins[0]} ]]; then
    printf 'Expected one upstream binary, found: %s\n' "${bins[*]}" >&2
    return 1
  fi

  install -Dm755 "${bins[0]}" "$pkgdir/usr/bin/dreamdump"
  install -Dm644 "$srcdir/dreamdump/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/dreamdump/DRIVES.csv" "$pkgdir/usr/share/doc/$pkgname/DRIVES.csv"
  install -Dm644 "$srcdir/dreamdump/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
