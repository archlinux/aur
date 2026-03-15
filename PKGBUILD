# Maintainer: Burgess Leo <liuxiaopeng731@gmail.com>
pkgname=leolock
pkgver=1.0.3
pkgrel=2
pkgdesc="LeoLock - 安全的文件加密解密工具"
arch=('x86_64')
url="https://github.com/lxp731/leolock"
license=('MIT')
depends=('glibc')
makedepends=('binutils' 'tar' 'zstd')
source=(leolock_${pkgver}_amd64.deb::https://github.com/lxp731/leolock/releases/download/v${pkgver}/leolock_${pkgver}_amd64.deb)
sha256sums=('86e2a469fdc293e85e87b949a1198428681cff4260794b5a83b1b6dedc62ad3b')
# https://github.com/lxp731/leolock/releases/download/v1.0.3/leolock_1.0.3_amd64.deb
prepare() {
  cd "$srcdir"
  # 解压 deb 包
  ar x leolock_${pkgver}_amd64.deb
  
  # 查看 deb 包中包含哪些文件
  # 通常 deb 包包含 control.tar.* 和 data.tar.*
  local data_tar=$(ls data.tar.* | head -n1)
  tar -xf $data_tar
}

build() {
  true
}

check() {
  true
}

package() {
  cd "$srcdir"

  # 复制二进制文件到目标目录
  install -Dm755 usr/bin/leolock "$pkgdir/usr/bin/leolock"

  # 尝试复制可能存在的补全文件
  if [[ -d usr/share/bash-completion ]]; then
    mkdir -p "$pkgdir/usr/share/bash-completion/completions/"
    cp -r usr/share/bash-completion/completions/* "$pkgdir/usr/share/bash-completion/completions/" 2>/dev/null || true
  fi

  if [[ -d usr/share/zsh ]]; then
    mkdir -p "$pkgdir/usr/share/zsh/site-functions/"
    cp -r usr/share/zsh/site-functions/* "$pkgdir/usr/share/zsh/site-functions/" 2>/dev/null || true
  fi

  # 复制许可证文件
  if [[ -f usr/share/licenses/$pkgname/LICENSE ]]; then
    install -Dm644 usr/share/licenses/$pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  elif [[ -f usr/share/doc/$pkgname/copyright ]]; then
    install -Dm644 usr/share/doc/$pkgname/copyright "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi

  # 复制文档
  if [[ -d usr/share/doc/$pkgname ]]; then
    mkdir -p "$pkgdir/usr/share/doc/$pkgname"
    cp -r usr/share/doc/$pkgname/* "$pkgdir/usr/share/doc/$pkgname/" 2>/dev/null || true
  fi
}