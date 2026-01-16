# Maintainer: Wimpy <vvinn.py[AT]email.com>

pkgname=codes-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="A powerful CLI tool for managing multiple Claude Code configurations with ease. Switch between different Claude API endpoints, manage authentication tokens, and streamline your AI-powered development workflow."
arch=('x86_64' 'aarch64')
url="https://github.com/ourines/codes"
license=('MIT')
depends=()
provides=('codes-bin')
conflicts=('codes-bin')
source_x86_64=("codes-linux-amd64::https://github.com/ourines/codes/releases/download/v${pkgver}/codes-linux-amd64")
source_aarch64=("codes-linux-arm64::https://github.com/ourines/codes/releases/download/v${pkgver}/codes-linux-arm64")
source+=("${pkgname}-${pkgver}.tar.gz::https://github.com/ourines/codes/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')
sha256sums=('SKIP')

prepare() {
  # 为二进制文件添加可执行权限
  chmod +x codes-linux-amd64 2>/dev/null || true
  chmod +x codes-linux-arm64 2>/dev/null || true
  
  # 提取资源文件
  bsdtar -xf "${pkgname}-${pkgver}.tar.gz" || true
}

package() {
  # 根据架构选择正确的二进制文件
  case "$CARCH" in
    x86_64)
      _binary="codes-linux-amd64"
      ;;
    aarch64)
      _binary="codes-linux-arm64"
      ;;
    *)
      echo "Unsupported architecture: $CARCH"
      return 1
      ;;
  esac
  
  # 安装二进制文件
  install -Dm755 "$_binary" "${pkgdir}/usr/bin/codes"
  
  # 从源码包中提取并安装资源文件
  if [[ -d "${pkgname}-${pkgver}" ]]; then
    cd "${pkgname}-${pkgver}"
    
    # 安装许可证文件
    if [[ -f "LICENSE" ]]; then
      install -Dm644 "LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    elif [[ -f "resources/LICENSE" ]]; then
      install -Dm644 "resources/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
    
    # 安装文档
    if [[ -f "README.md" ]]; then
      install -Dm644 "README.md" \
        "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    fi

  fi
}
