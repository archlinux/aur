# Maintainer: PublishPort <karentia@maoertech.cn>
#
# PublishPort 是闭源产品，安装包不放在 GitHub Releases，而是由发版 CI 构建后
# 上传到自有 storage（storage2.maoertech.cn），下载 URL 由版本号确定性推导。
# 因此本包是「重打包预编译产物」的 -bin 包：下载官方 .deb，解出文件装进系统。
# 版本号与 sha256sums 由发版工作流（.github/workflows/release-desktop.yml 的
# publish-aur 任务）在每次 desktop-v* tag 发布时自动改写并推送到 AUR。
pkgname=publishport-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="让线上 AI 用你本机真实登录环境，一键发布内容到小红书/知乎/微博/B站/Twitter 等平台（GUI 客户端）"
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
sha256sums=('6ed1fdd2f5d219a64a70b68476d7c077f263f5ef8b27cd7837a7711dfa66fe4e')

package() {
  cd "$srcdir"
  # .deb 是 ar 归档，libarchive(bsdtar) 能直接拆；再解内层 data.tar.*。
  bsdtar -xf "publishport-${pkgver}-amd64.deb"
  bsdtar -xf data.tar.*

  # 二进制装到 /usr/lib/publishport，/usr/bin 放符号链接做命令入口。
  install -Dm755 "usr/bin/desktop" "$pkgdir/usr/lib/publishport/publishport"
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/lib/publishport/publishport" "$pkgdir/usr/bin/publishport"

  # agent.js 必须放在 Tauri 实际解析的资源目录。Tauri 在 Linux 下按 productName
  # 把资源目录定位到 /usr/lib/PublishPort（大写），与可执行文件实际所在目录无关
  # （即使经 /usr/bin 符号链接启动也一样）——官方 .deb 正是放在这里。早先误以为
  # 它按「可执行文件同级目录」解析、装进了 /usr/lib/publishport/resources（小写），
  # 结果 Tauri 找不到 agent 入口、回退到构建机源码路径（/home/runner/...），
  # bun 启动即失败，GUI 永远卡在「本地执行器连接中…」。保持与官方 .deb 一致。
  install -Dm644 "usr/lib/PublishPort/resources/agent.js" \
    "$pkgdir/usr/lib/PublishPort/resources/agent.js"

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
