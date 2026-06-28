# Maintainer: PublishPort <karentia@maoertech.cn>
#
# PublishPort 是闭源产品，安装包不放在 GitHub Releases，而是由发版 CI 构建后
# 上传到自有 storage（storage2.maoertech.cn），下载 URL 由版本号确定性推导。
# 因此本包是「重打包预编译产物」的 -bin 包：下载官方 .deb，解出文件装进系统。
# 版本号与 sha256sums 由发版工作流（.github/workflows/release-desktop.yml 的
# publish-aur 任务）在每次 desktop-v* tag 发布时自动改写并推送到 AUR。
pkgname=publishport-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="把本地开源 CLI 的内容发布能力，经 GUI 客户端 + 云端中转开放给线上 AI"
arch=('x86_64')
url="https://publishport.app"
license=('LicenseRef-proprietary')
# webkit2gtk-4.1 已带来 gtk3 / libsoup3；二进制直接链接 gtk3，故显式列出。
# libayatana-appindicator 供托盘图标在运行时按需加载（不被 webkit 带入）。
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
provides=('publishport')
conflicts=('publishport')
# 预编译二进制，禁止 strip / 重新打包，避免破坏官方产物。
options=('!strip')
install="${pkgname}.install"
source=("publishport-${pkgver}-amd64.deb::https://storage2.maoertech.cn/desktop/publishport-${pkgver}-amd64.deb")
noextract=("publishport-${pkgver}-amd64.deb")
sha256sums=('e03904d73623d37f0bc08b75d97532055a30ca1549f437cd011b7a2cede2d585')

package() {
  cd "$srcdir"
  # .deb 是 ar 归档，libarchive(bsdtar) 能直接拆；再解内层 data.tar.*。
  bsdtar -xf "publishport-${pkgver}-amd64.deb"
  bsdtar -xf data.tar.*

  # 二进制与 resources/ 同目录安装到 /usr/lib/publishport：Tauri 在非 /usr/bin
  # 场景下按「可执行文件同级目录」解析 resources（agent.js），这样无需依赖
  # productName 启发式即可稳定找到捆绑的 agent。/usr/bin 放符号链接做命令入口。
  install -Dm755 "usr/bin/desktop" "$pkgdir/usr/lib/publishport/publishport"
  install -Dm644 "usr/lib/PublishPort/resources/agent.js" \
    "$pkgdir/usr/lib/publishport/resources/agent.js"
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/lib/publishport/publishport" "$pkgdir/usr/bin/publishport"

  # 桌面入口：上游 .deb 用通用名 desktop，这里改用 publishport，避免命名污染。
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/publishport.desktop" <<'EOF'
[Desktop Entry]
Name=PublishPort
Comment=让线上 AI 经你本机的真实环境发布内容
Exec=publishport
Icon=publishport
StartupWMClass=publishport
Terminal=false
Type=Application
Categories=Network;Utility;
EOF

  for size in 32x32 128x128 256x256@2; do
    install -Dm644 "usr/share/icons/hicolor/${size}/apps/desktop.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}/apps/publishport.png"
  done
}
