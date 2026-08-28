# Maintainer: 面灵Boss助手 <karentia@maoertech.cn>
#
# 客户端闭源，安装包不进 GitHub Releases，而是发版 CI 构建后传到自有 storage
# （storage2.maoertech.cn，下载 URL 由版本号确定性推导）。所以这是「重打包官方
# 预编译 .deb」的 -bin 包 —— AUR `-bin` 后缀的标准含义。
#
# pkgver 与 sha256sums 由 .github/workflows/release.yml 的 publish-aur 任务在每次
# v* tag 发版时自动改写并推到 AUR，别手动 bump。
pkgname=boss-job-agent-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="AI 自动刷 Boss 直聘：自动筛岗位、写定制打招呼、和 HR 聊天约面"
arch=('x86_64')
url="https://boss.mianlingai.com"
license=('LicenseRef-proprietary')
# 对应上游 .deb 的 Depends: libwebkit2gtk-4.1-0, libgtk-3-0。
# webkit2gtk-4.1 会带来 gtk3 / libsoup3，但二进制直接链接 gtk3，显式列出。
# libayatana-appindicator 供托盘图标运行时按需加载（不被 webkit 带入）。
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
provides=('boss-job-agent')
conflicts=('boss-job-agent')
# 预编译二进制，禁止 strip / 重新打包，避免破坏官方产物。
options=('!strip')
install="${pkgname}.install"
source=("boss-job-agent-${pkgver}-amd64.deb::https://storage2.maoertech.cn/releases/boss-job-agent/v${pkgver}/_Boss_${pkgver}_amd64.deb")
noextract=("boss-job-agent-${pkgver}-amd64.deb")
sha256sums=('6322de569e0b87cdf19e10083b4fd42a91697bb68af4b48ed3a455749bc2c5e0')

package() {
  cd "$srcdir"
  # .deb 是 ar 归档，libarchive(bsdtar) 能直接拆；再解内层 data.tar.*。
  bsdtar -xf "boss-job-agent-${pkgver}-amd64.deb"
  bsdtar -xf data.tar.*

  # 上游 .deb 的布局已经是规范 FHS，整份搬进 $pkgdir 即可：
  #   /usr/bin/boss-job-agent          主程序
  #   /usr/bin/job-agent-sidecar       agent 子进程
  #   /usr/lib/<productName>/          Tauri 资源目录
  #   /usr/share/icons/hicolor/*/apps/boss-job-agent.png
  #
  # ⚠️ 资源目录名是中文（Tauri 在 Linux 下按 **productName** 定位资源目录到
  # /usr/lib/<productName>，与可执行文件实际所在目录无关）。**不要**为了好看
  # 把它改成 ASCII —— 改了 Tauri 就找不到资源。
  cp -a usr "$pkgdir/usr"

  # Tauri 按中文 productName 生成 .desktop，文件名也就成了中文。
  # 装进系统时换成 ASCII 名，Name= 字段保持中文不变。
  local desktop_dir="$pkgdir/usr/share/applications"
  local f
  for f in "$desktop_dir"/*.desktop; do
    [ -e "$f" ] || continue
    [ "${f##*/}" = "${pkgname%-bin}.desktop" ] && continue
    mv -- "$f" "$desktop_dir/${pkgname%-bin}.desktop"
    break
  done
}
