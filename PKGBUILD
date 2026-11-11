# Maintainer: Become-ILLUSORY <becomeillusory@gmail.com>

# 跟随上游 GitHub release 的 latest 二进制包（官方用 package-arch.sh 打的 .pkg.tar.zst，
# 词库已内置）。

pkgname=wowtype-core
pkgver=0.3.10
pkgrel=1
pkgdesc='WeChat-style pinyin input method for fcitx5, with bundled dictionaries and language model'
arch=('x86_64')
url='https://github.com/Gloridust/WowType'
license=('MIT' 'Apache-2.0' 'GPL-3.0-only' 'CC-BY-SA-4.0' 'Unicode-3.0')
depends=('fcitx5' 'alsa-lib' 'gcc-libs' 'glibc' 'python')
optdepends=('python-gobject: settings app' 'gtk4: settings app' 'libadwaita: settings app'
            'noto-fonts-emoji: color emoji in candidates' 'curl: translate mode')
conflicts=('wowtype')
provides=('wowtype')
install="$pkgname.install"

# gh-proxy.com 前缀用于国内加速；换镜像只需 export GH_MIRROR=https://另一镜像/
_gh_mirror="${GH_MIRROR:-https://gh-proxy.com/}"
_pkgfile="wowtype-$pkgver-1-x86_64.pkg.tar.zst"
source=(
  "$_pkgfile::${_gh_mirror}https://github.com/Gloridust/WowType/releases/download/v$pkgver/$_pkgfile"
)
# 版本连日变，校验和对不固定版本无意义；上游二进制包自带 .MTREE/.BUILDINFO，
# pacman 安装时会校验包内元数据。
sha256sums=('SKIP')

# 动态跟随 releases/latest：paru/yay 等 helper 会在检查更新时执行本函数，
# 发现新 tag 即提示升级并更新 pkgver 后重新构建。
pkgver() {
  curl -fsSL https://api.github.com/repos/Gloridust/WowType/releases/latest \
    | sed -n 's/.*"tag_name"[[:space:]]*:[[:space:]]*"v\([^"]*\)".*/\1/p' \
    | head -n1
}

package() {
  # 官方 .pkg.tar.zst 已被 makepkg 自动解压到 srcdir，只把 usr/ 树收进 pkgdir
  cp -a "$srcdir"/usr "$pkgdir"/
}