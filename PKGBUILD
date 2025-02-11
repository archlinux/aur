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
      echo -e "\e[1;31m错误：未知架构: $arch_type\e[0m"
      exit 1
      ;;
  esac

  source=($source_url)

  echo -e "\e[1;34m正在下载校验文件...\e[0m"
  if curl -sfL "https://github.com/chainreactors/gogo/releases/download/v$pkgver/gogo_checksums.txt" -o "$srcdir/gogo_checksums.txt"; then
    echo -e "\e[1;32m校验文件下载成功！\e[0m"
  else
    echo -e "\e[1;31m校验文件下载失败！\e[0m"
    exit 1
  fi

  echo -e "\e[1;34m正在下载 gogo 二进制文件...\e[0m"
  if curl -sfL "$source_url" -o "$srcdir/$(basename $source_url)"; then
    echo -e "\e[1;32m二进制文件下载成功！\e[0m"
  else
    echo -e "\e[1;31m二进制文件下载失败！\e[0m"
    exit 1
  fi

  echo -e "\e[1;34m正在验证文件完整性...\e[0m"
  checksum=$(grep "$(basename $source_url)" "$srcdir/gogo_checksums.txt" | awk '{print $1}')
  
  if echo "$checksum  $(basename $source_url)" | sha256sum -c; then
    echo -e "\e[1;32m文件校验通过！\e[0m"
  else
    echo -e "\e[1;31m文件校验失败！\e[0m"
    exit 1
  fi
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
