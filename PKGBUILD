# Maintainer: Become-ILLUSORY <becomeillusory@gmail.com>
#
# ── 上游源码仓库 / upstream source ────────────────────────────────────────────
#   https://github.com/123llyrr/clarion   (clarion-shell/ 子目录)
#
# 本包是 Clarion 桌面 Shell 的预编译二进制（Flutter + GTK3）。
# 注意：这不是 x86-64-v3 构建 —— 只有约 3.4k 行 GTK runner 在本地编译，
# 39k 行 Dart 由工具链做 AOT 快照，引擎 libflutter_linux_gtk.so 是预编译下载，
# 因此按基线 x86-64 发布，任何 x86-64 机器都能运行。
#
# 构建流水线 / build pipeline:
#   https://github.com/Become-ILLUSORY/clarion/blob/feat/arch-v3-build/.github/workflows/build-shell.yml
# ─────────────────────────────────────────────────────────────────────────────

pkgname=clarion-shell-bin
pkgver=0.1.0.r6.g99fcd8f
pkgrel=1
pkgdesc='Flutter desktop shell for the Clarion Wayland compositor (top bar, dock, launcher, control center)'
arch=('x86_64')
url='https://github.com/123llyrr/clarion'
license=('GPL-3.0-or-later')

_repo='Become-ILLUSORY/clarion'

# Shell 是合成器的 layer-shell 客户端，并通过 Clarion IPC 通信，因此硬依赖
# 合成器。反过来 clarion 不依赖本包 —— 它也能配 waybar / Noctalia /
# DankMaterialShell，或者完全不要面板。
depends=(
  'clarion'
  'gcc-libs'
  'glib2'
  'glibc'
  'gtk3'
  'gtk-layer-shell'
  'harfbuzz'
  'pango'
  'wayland'
)
optdepends=(
  'xdg-desktop-portal-gtk: fallback portal implementation'
)
provides=('clarion-shell')
conflicts=('clarion-shell' 'clarion-shell-git')

_archive="clarion-shell-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst"

# 下载的就是完整 Arch 包，禁止 makepkg 自动解压。
noextract=("${_archive}")

source=("${_archive}::https://github.com/${_repo}/releases/download/v${pkgver}/${_archive}")
sha256sums=('d4269c5b752b510dcc0a6489b4e7ca0fac48ea424c82f799cc542cb7e8e44f3c')

package() {
  bsdtar -xf "${srcdir}/${_archive}" -C "${pkgdir}" \
    --exclude .PKGINFO --exclude .MTREE --exclude .BUILDINFO
}
