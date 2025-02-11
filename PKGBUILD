# Maintainer: Javs <admin@fxs.life>
# Description: Precompiled binary for gogo, a versatile port-based automation engine for red team operations.

pkgname=gogo-bin
pkgver=2.13.6
pkgrel=1
pkgdesc="Precompiled binary for gogo, a versatile port-based automation engine for red team operations"
arch=('i686' 'x86_64' 'armv7h' 'aarch64' 'mips')
url="https://github.com/chainreactors/gogo/releases"
license=('GPL')
SKIPSTRIP=true

pkgver() {
  echo "$pkgver"
}

prepare() {
  arch_type=$(uname -m)
  
  case $arch_type in
    x86_64)
      source_url="https://github.com/chainreactors/gogo/releases/download/v$pkgver/gogo_linux_amd64"
      ;;
    armv7l|aarch64)
      source_url="https://github.com/chainreactors/gogo/releases/download/v$pkgver/gogo_linux_arm64"
      ;;
    i686)
      source_url="https://github.com/chainreactors/gogo/releases/download/v$pkgver/gogo_linux_386"
      ;;
    mips)
      source_url="https://github.com/chainreactors/gogo/releases/download/v$pkgver/gogo_linux_mips"
      ;;
    *)
      echo "Unknown architecture: $arch_type"
      exit 1
      ;;
  esac

  source=($source_url)
  
  curl -sfL "https://github.com/chainreactors/gogo/releases/download/v$pkgver/gogo_checksums.txt" -o "$srcdir/gogo_checksums.txt"
  curl -sfL "$source_url" -o "$srcdir/$(basename $source_url)"

  checksum=$(grep "$(basename $source_url)" "$srcdir/gogo_checksums.txt" | awk '{print $1}')
  
  echo "$checksum  $(basename $source_url)" | sha256sum -c
}

package() {
  arch_type=$(uname -m)

  case $arch_type in
    x86_64)
      install -Dm755 "$srcdir/gogo_linux_amd64" "$pkgdir/usr/bin/gogo"
      ;;
    armv7l|aarch64)
      install -Dm755 "$srcdir/gogo_linux_arm64" "$pkgdir/usr/bin/gogo"
      ;;
    i686)
      install -Dm755 "$srcdir/gogo_linux_386" "$pkgdir/usr/bin/gogo"
      ;;
    mips)
      install -Dm755 "$srcdir/gogo_linux_mips" "$pkgdir/usr/bin/gogo"
      ;;
    *)
      echo "Unknown architecture: $arch_type"
      exit 1
      ;;
  esac
}
