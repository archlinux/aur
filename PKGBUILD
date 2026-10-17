# Maintainer: Become-ILLUSORY <becomeillusory@gmail.com>
#
# ── 上游源码仓库 / upstream source ────────────────────────────────────────────
#   https://github.com/123llyrr/clarion
#
# 本包提供 CachyOS x86-64-v3 工具链预编译的二进制（原生 AVX2/FMA/BMI2）。
# 构建流水线 / build pipeline:
#   https://github.com/Become-ILLUSORY/clarion/blob/feat/arch-v3-build/.github/workflows/build-v3.yml
# 打包脚本 / packaging scripts:
#   https://github.com/Become-ILLUSORY/clarion/tree/feat/arch-v3-build/packaging/arch
# ─────────────────────────────────────────────────────────────────────────────

pkgname=clarion-bin
pkgver=0.1.0.r6.g99fcd8f
pkgrel=1
pkgdesc='Modern Wayland compositor with a native Vulkan backend and an independent desktop core (x86-64-v3 build)'
arch=('x86_64' 'x86_64_v3')
url='https://github.com/123llyrr/clarion'
license=('GPL-3.0-or-later')

# 二进制产物来自本 fork 的 Actions（上游仓库未发布预编译包）。
_repo='Become-ILLUSORY/clarion'

depends=(
  'cairo'
  'gcc-libs'
  'glib2'
  'glibc'
  'libdisplay-info'
  'libglvnd'
  'libinput'
  'libpipewire'
  'libxkbcommon'
  'mesa'
  'pango'
  'pixman'
  'seatd'
  'systemd-libs'
  'vulkan-icd-loader'
  'wayland'
)
optdepends=(
  'xwayland-satellite: run X11 applications'
  'xdg-desktop-portal-gtk: fallback portal implementation'
  'xdg-desktop-portal-gnome: screencasting support'
  'gnome-keyring: Secret portal provider'
  'mako: notification daemon'
  'alacritty: terminal bound in the default configuration'
  'fuzzel: launcher bound in the default configuration'
)
provides=('clarion')
conflicts=('clarion' 'clarion-git')
replaces=('clarion')

# 上游要求在用户未安装 debuginfo 时也能给出可读的 panic 回溯，故不 strip。
options=('!strip' '!debug')

_archive="clarion-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst"

# 下载的本身就是完整的 Arch 软件包；makepkg 会把它自动解压到 $srcdir，
# 这里必须显式禁止。
noextract=("${_archive}")

source=("${_archive}::https://github.com/${_repo}/releases/download/v${pkgver}/${_archive}")
sha256sums=('4dc42bfafd706176e5b43ad8e0c23470ae8beb432b387177a506ab2f6cd946e4')

prepare() {
  # 二进制按 x86-64-v3 编译（AVX2/FMA/BMI2）。在这里明确报错，
  # 好过运行到第一帧时收到 SIGILL。
  local flags feature
  flags=$(grep -m1 '^flags' /proc/cpuinfo)
  for feature in avx2 fma bmi1 bmi2 movbe; do
    if [[ $flags != *" $feature "* ]]; then
      error "clarion-bin 需要支持 x86-64-v3 的 CPU（缺少: ${feature}）。"
      error '请改用源码构建，或在支持 AVX2 的机器上重新打包。'
      return 1
    fi
  done
}

package() {
  # 归档即成品包，跳过它自带的元数据，只取文件树。
  bsdtar -xf "${srcdir}/${_archive}" -C "${pkgdir}" \
    --exclude .PKGINFO --exclude .MTREE --exclude .BUILDINFO
}
