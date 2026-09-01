# Maintainer: Mianling AI <karentia@maoertech.cn>
#
# 面灵网申助手是闭源产品，安装包不放 GitHub Releases，而是由发版 CI 构建后上传到自有
# storage（storage2.maoertech.cn），下载 URL 由版本号确定性推导。所以本包是
# 「重打包预编译产物」的 -bin 包：下载官方 .deb，把里面的文件装进系统。
#
# pkgver 与 sha256sums 由发版工作流（.github/workflows/apply-release.yml 的
# publish-aur 任务）在每次 apply-v* tag 发布时自动改写并推送到 AUR，不要手改。
pkgname=mianling-apply-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="面灵网申助手 — 校招网申自动填表：一处填好档案，打开投递页自动填好重复字段，最后一步由你点"
arch=('x86_64')
url="https://www.mianlingai.com/job-apply"
license=('LicenseRef-proprietary')
# webkit2gtk-4.1 会带来 gtk3 / libsoup3，但二进制直接链接 gtk3，所以显式列出。
# 没有托盘图标，因此不需要 libayatana-appindicator。
depends=('webkit2gtk-4.1' 'gtk3')
provides=('mianling-apply')
conflicts=('mianling-apply')
# 预编译二进制，禁止 strip / 重新打包，避免破坏官方产物。
# `!debug` 是必须的：makepkg 默认开 debug，会在包里留一个空的
# /usr/src/debug/mianling-apply-bin/ —— 对一个不带调试符号的 -bin 包毫无意义，
# 只是往用户系统里塞一个由本包拥有的空目录（0.1.1 装出来实测有）。
options=('!strip' '!debug')
install="${pkgname}.install"
source=("mianling-apply-${pkgver}-amd64.deb::https://storage2.maoertech.cn/job-apply/mianling-apply-${pkgver}-amd64.deb")
noextract=("mianling-apply-${pkgver}-amd64.deb")
sha256sums=('d23d58aaaf20b21bb542e7ad4c5ff92c9b8a3ad3afc20feae885286e24c0fb3f')

package() {
  cd "$srcdir"
  # .deb 是 ar 归档，libarchive(bsdtar) 能直接拆；再解内层 data.tar.*。
  bsdtar -xf "mianling-apply-${pkgver}-amd64.deb"
  bsdtar -xf data.tar.*

  # 官方 .deb 里所有文件名已经是 mianling-apply（Tauri 的 productName 在
  # src-tauri/tauri.linux.conf.json 里就是这个），不需要改名，原样搬过来即可。
  install -Dm755 "usr/bin/mianling-apply" "$pkgdir/usr/bin/mianling-apply"
  install -Dm644 "usr/share/applications/mianling-apply.desktop" \
    "$pkgdir/usr/share/applications/mianling-apply.desktop"

  # 图标尺寸以 .deb 里实际有的为准，别写死一份清单——Tauri 换了图标配置就会对不上。
  for icon in usr/share/icons/hicolor/*/apps/mianling-apply.png; do
    [[ -e "$icon" ]] || continue
    install -Dm644 "$icon" "$pkgdir/$icon"
  done
}
