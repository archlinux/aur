# Maintainer: Takahashi Rinta <mc1586182829@outlook.com>
#
# 双架构说明：makepkg 会读取宿主的 $CARCH（x86_64 / aarch64），只下载并校验
# 对应的 source_$CARCH 数组，因此一份 PKGBUILD 同时服务两个架构。
#
# 维护流程（新版本发布时）：
#   1. 改下面的 pkgver（如需要重打同版本则递增 pkgrel）
#   2. cd aur && updpkgsums                     # 自动更新 sha256sums_*
#   3. makepkg --printsrcinfo > .SRCINFO
#   4. makepkg -si                              # 本地验证一次
#   5. 把 PKGBUILD 和 .SRCINFO 复制到 AUR git clone 目录，commit + push

pkgname=pezmax-one-bin
_pkgname=pezmax-one
pkgver=1.0.0
pkgrel=1
pkgdesc="高性能试卷资源管理桌面客户端 (egui + Metro Design)"
arch=('x86_64' 'aarch64')
url="https://github.com/PezMax/PezMax-One"
license=('MIT')
depends=('wayland' 'dbus' 'libxkbcommon' 'gcc-libs' 'glibc')
# 以下 X11 / GL 库为 winit 运行时可选（Wayland 用户不需要，X11 用户需要）
optdepends=(
  'plasma-workspace: KDE Plasma 全局菜单集成'
  'libx11: X11 会话支持'
  'libxi: X11 会话支持'
  'libxcursor: X11 光标'
  'libxrender: X11 渲染'
  'libxkbcommon-x11: X11 键盘布局'
  'libglvnd: OpenGL / EGL 支持'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')

_relurl="${url}/releases/download/v${pkgver}"
source_x86_64=("${_pkgname}-${pkgver}-x86_64.pkg.tar.zst::${_relurl}/${_pkgname}-${pkgver}-linux-x86_64.pkg.tar.zst")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.pkg.tar.zst::${_relurl}/${_pkgname}-${pkgver}-linux-aarch64.pkg.tar.zst")

# updpkgsums / `makepkg -g` 生成
sha256sums_x86_64=('ea1d37b603ef8db2c97690a4087e35d94e5d88dbacb26aada62615dfc69a2611')
sha256sums_aarch64=('fccc24beee4af3314707457184d093d75ed48125025c3a198cfe4390ff294fbd')

package() {
  # 上游 tarball 本身就是标准 Arch 包，直接把 usr/ 解到 $pkgdir
  # 元数据文件（.PKGINFO/.MTREE/.BUILDINFO/.INSTALL）由 makepkg 重新生成，需排除
  bsdtar -xf "${srcdir}/${_pkgname}-${pkgver}-${CARCH}.pkg.tar.zst" -C "${pkgdir}" \
    --exclude .PKGINFO --exclude .MTREE --exclude .BUILDINFO --exclude .INSTALL
}
