# Maintainer: Tsaitang <tsaitang404 at gmail dot com>
pkgname=univpn
pkgver=10781.18.1.0512
pkgrel=5
pkgdesc="企业级VPN客户端"
arch=('x86_64')
url="https://www.univpn.com/"
license=('unknown')
depends=()
makedepends=('unzip' 'polkit')
source=("https://download.leagsoft.com/download/UniVPN/linux/univpn-linux-64-${pkgver}.zip")
noextract=("univpn-linux-64-${pkgver}.zip")
sha256sums=('854708ffe5761af08d52f98e03996e47bacb4106dc2b6b041ef03b487626ce5e')

prepare() {
  cd "$srcdir" || return
  unzip -qo "univpn-linux-64-${pkgver}.zip"
  
  # 修补脚本中的 arch 命令，在 Arch Linux 中不存在，需要替换为 uname -m
  sed -i 's/ARCH="`arch`"/ARCH="`uname -m`"/g' "univpn-linux-64-${pkgver}.run"
  
  # 创建临时安装目录并运行安装脚本来提取文件
  mkdir -p extract_temp
  cd extract_temp || return
  
  # 使用安装脚本的逻辑提取tar.gz文件
  tail -n +258 "../univpn-linux-64-${pkgver}.run" > UniVPN.tar.gz
  
  # 尝试解压
  if ! tar -zxf UniVPN.tar.gz 2>/dev/null; then
    # 如果是损坏的gzip，尝试直接作为tar文件
    if ! tar -xf UniVPN.tar.gz 2>/dev/null; then
      echo "Error: Cannot extract UniVPN archive"
      return 1
    fi
  fi
  
  # 回到源码目录
  cd "$srcdir" || return
}

package() {
  cd "$srcdir" || return
  
  # 安装提取出的程序文件
  if [ -d "extract_temp" ]; then
    # 安装主程序目录到 /usr/local/UniVPN
    install -dm755 "$pkgdir/usr/local/UniVPN"
    cp -r extract_temp/* "$pkgdir/usr/local/UniVPN/"
    
    # 确保主程序可执行
    chmod 755 "$pkgdir/usr/local/UniVPN/UniVPN"
    
    # 创建启动脚本到 /usr/bin，设置正确的库路径
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/univpn" << 'EOF'
#!/bin/bash
# 使用绝对路径执行程序，避免工作目录问题
cd /usr/local/UniVPN
exec pkexec bash -c "export DISPLAY='$DISPLAY'; export XAUTHORITY='$XAUTHORITY'; export LD_LIBRARY_PATH='/usr/local/UniVPN/lib:$LD_LIBRARY_PATH'; /usr/local/UniVPN/UniVPN \"\$@\"" _ "$@"

EOF
    chmod 755 "$pkgdir/usr/bin/univpn"
  else
    # 备用方案：执行安装脚本进行安装
    echo "Warning: extract_temp not found, running installation script as fallback"
    
    # 创建临时安装目录
    mkdir -p "$pkgdir/usr/local"
    
    # 执行安装脚本（以静默模式）
    DESTDIR="$pkgdir/usr/local/UniVPN"
    mkdir -p "$DESTDIR"
    
    # 手动提取和安装，模拟安装脚本的行为
    tail -n +258 "univpn-linux-64-${pkgver}.run" > UniVPN.tar.gz
    tar -zxf UniVPN.tar.gz -C "$DESTDIR"
    rm UniVPN.tar.gz
    
    # 创建启动脚本
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/univpn" << 'EOF'
#!/bin/bash
# 使用绝对路径执行程序，避免工作目录问题
cd /usr/local/UniVPN
exec pkexec bash -c "export DISPLAY='$DISPLAY'; export XAUTHORITY='$XAUTHORITY'; export LD_LIBRARY_PATH='/usr/local/UniVPN/lib:$LD_LIBRARY_PATH'; /usr/local/UniVPN/UniVPN \"\$@\"" _ "$@"

EOF
    chmod 755 "$pkgdir/usr/bin/univpn"
  fi
  
  # 创建桌面文件
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/univpn.desktop" << EOF
[Desktop Entry]
Name=UniVPN
Comment=UniVPN 客户端
Exec=univpn
Icon=network-vpn
Type=Application
Categories=Network;
EOF
}
