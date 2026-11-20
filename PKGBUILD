# Maintainer: tsaitang <tsaitang404 at gmail dot com>
# Contributor: tsaitang
pkgname=univpn
pkgver=10781.21.0.0831
pkgrel=4
pkgdesc="企业级VPN客户端"
arch=('x86_64')
url="https://www.leagsoft.com/doc/article/103197.html"
license=('custom')
depends=('bash' 'qt5-base')
makedepends=('unzip' 'python')
options=('!strip' '!debug')
source=("https://download.leagsoft.com/download/UniVPN/linux/univpn-linux-64-${pkgver}.zip"
        "LICENSE"
        "relocate.py" "univpn.install")
noextract=("univpn-linux-64-${pkgver}.zip")
sha256sums=('2315e88eb3259f78215e77a41768048d10f6c5540970b042ba76a1f12107cd9f'
            '2b76d623c6149eeca0479dc05a6702c870598ba59c4f925179206f000c4f0d07'
            '8704def6035aca8ad807e9348ddf3234bfdc912fbec76ca762be0b76f05c318d'
            'c73a6db88b6631dc54623d41bd2ee90557e1af568fb4356e46b99eb51bbe3533')
install=univpn.install

prepare() {
  cd "$srcdir" || return
  unzip -qo "univpn-linux-64-${pkgver}.zip"


  # 创建临时安装目录并运行安装脚本来提取文件
  mkdir -p extract_temp
  cd extract_temp || return

  # 使用安装脚本的逻辑提取tar.gz文件
  tail -n +258 "../univpn-linux-amd64-${pkgver}.run" > UniVPN.tar.gz

  # 尝试解压
  if ! tar -zxf UniVPN.tar.gz 2>/dev/null; then
    # 如果是损坏的gzip，尝试直接作为tar文件
    if ! tar -xf UniVPN.tar.gz 2>/dev/null; then
      echo "Error: Cannot extract UniVPN archive"
      return 1
    fi
  fi

  python "$srcdir/relocate.py" . || return
  sed -i 's|/usr/local/UniVPN/certificate|/opt/UniVPN/certificate|g' language/{1033,2052}/l_UILabel.ini
}

package() {
  cd "$srcdir" || return

  # 安装主程序目录到 /opt/UniVPN（符合 FHS）
  install -dm755 "$pkgdir/opt/UniVPN"

  # 有选择复制，排除中间产物与安装脚本
  cp -a extract_temp/. "$pkgdir/opt/UniVPN/"
  rm -f "$pkgdir/opt/UniVPN/UniVPN.tar.gz"
  rm -f "$pkgdir/opt/UniVPN/install_x64.sh"
  rm -f "$pkgdir/opt/UniVPN/uninstall.sh"
  rm -f "$pkgdir/opt/UniVPN/UniVPNA.sh"
  rm -f "$pkgdir/opt/UniVPN/image/UniVPNA.desktop"

  # 确保主程序可执行
  chmod 755 "$pkgdir/opt/UniVPN/UniVPN"

  # setuid 提权子进程（复刻官方安装脚本 install_x64.sh 的 chmod u+s 设计）
  # 仅连接所需的两个辅助进程保留 setuid；更新由 pacman 管理
  chmod u+s "$pkgdir/opt/UniVPN/serviceclient/UniVPNCS"
  chmod u+s "$pkgdir/opt/UniVPN/promote/UniVPNPromoteService"
  chmod 755 "$pkgdir/opt/UniVPN/UniVPNUpdate"

  # 创建启动脚本到 /usr/bin，设置正确的库路径
  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/univpn" << 'EOF'
#!/bin/bash
# 使用绝对路径执行程序，避免工作目录问题
cd /opt/UniVPN
export LD_LIBRARY_PATH="/opt/UniVPN/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
exec /opt/UniVPN/UniVPN "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/univpn"

  # 图标
  install -Dm644 "$pkgdir/opt/UniVPN/image/logo.png" "$pkgdir/usr/share/pixmaps/univpn.png"

  # 桌面文件
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/univpn.desktop" << EOF
[Desktop Entry]
Name=UniVPN
Name[zh_CN]=UniVPN
Comment=企业级VPN客户端
Comment[zh_CN]=企业级VPN客户端
Exec=/usr/bin/univpn
Icon=univpn
Type=Application
Terminal=false
Categories=Network;RemoteAccess;
StartupWMClass=UniVPN
EOF

  # 许可证
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
