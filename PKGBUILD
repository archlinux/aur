# Maintainer: Tsaitang <tsaitang404 at gmail dot com>
pkgname=univpn
pkgver=10781.18.1.0512
pkgrel=9
pkgdesc="企业级VPN客户端"
arch=('x86_64')
url="https://www.univpn.com/"
license=('custom')
depends=('polkit' 'qt5-base')
makedepends=('unzip')
source=("https://download.leagsoft.com/download/UniVPN/linux/univpn-linux-64-${pkgver}.zip")
noextract=("univpn-linux-64-${pkgver}.zip")
sha256sums=('854708ffe5761af08d52f98e03996e47bacb4106dc2b6b041ef03b487626ce5e')

prepare() {
  cd "$srcdir" || return
  unzip -qo "univpn-linux-64-${pkgver}.zip"
  
  # 创建临时目录并提取文件
  mkdir -p extract_temp
  cd extract_temp || return
  
  # 动态查找压缩数据的起始行号（在最后一个 exit 命令之后）
  local archive_line=$(($(grep -na "^exit$" "../univpn-linux-64-${pkgver}.run" | tail -1 | cut -d: -f1) + 1))
  
  # 提取tar.gz文件
  tail -n +"$archive_line" "../univpn-linux-64-${pkgver}.run" > UniVPN.tar.gz
  
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
  
  # 安装主程序目录到 /opt/UniVPN（符合 Arch 打包规范）
  install -dm755 "$pkgdir/opt/UniVPN"
  cp -r extract_temp/* "$pkgdir/opt/UniVPN/" || return 1
  
  # 确保主程序可执行
  chmod 755 "$pkgdir/opt/UniVPN/UniVPN"
  
  # 创建启动脚本到 /usr/bin
  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/univpn" << 'EOF'
#!/bin/bash
# 使用绝对路径执行程序，避免工作目录问题
cd /opt/UniVPN
exec pkexec bash -c "export DISPLAY='$DISPLAY'; export XAUTHORITY='$XAUTHORITY'; export LD_LIBRARY_PATH='/opt/UniVPN/lib:$LD_LIBRARY_PATH'; /opt/UniVPN/UniVPN \"\$@\"" _ "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/univpn"
  
  # 创建桌面文件
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/univpn.desktop" << EOF
[Desktop Entry]
Name=UniVPN
Comment=企业级VPN客户端
Exec=univpn
Icon=network-vpn
Type=Application
Terminal=false
Categories=Network;RemoteAccess;
StartupWMClass=UniVPN
EOF
}
