# Maintainer: cublueer <starriver_alvin@163.com>
#
# octa-term-bin：下载 GitHub Release 上预编译的 pkg.tar.zst 并安装，
# 无需本机编译。资产由 packaging/arch/octa-term（源码包）构建后上传：
#   PACKAGER='cublueer <cublueer@users.noreply.github.com>' makepkg -Cf
#   gh release create v${pkgver} octa-term-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst

pkgname=octa-term-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='终端无感数学计算：把 shell 输入行变成 Octave 计算器（预编译包）'
arch=('x86_64')
url='https://github.com/cublueer/octa-term'
license=('MIT')
options=('!strip' '!debug')
export LC_ALL=C.UTF-8
depends=('octave' 'libgcc' 'glibc')
optdepends=(
  'fish: fish shell integration (Enter 劫持、多行矩阵、自动续行)'
  'bash: bash shell integration (单行兜底)'
  'zsh: zsh shell integration (单行兜底)'
)
provides=('octa-term')
conflicts=('octa-term')
source=(
  "octa-term-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst::https://github.com/cublueer/octa-term/releases/download/v${pkgver}/octa-term-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst"
)
sha256sums=(
  'e7b27a757107137c0520d4bc55cb0198dff82a2745cfc71c3745b4bfbefe4655'
)

package() {
  # 资产是完整包布局，但内部 pkgname 是 octa-term：
  # 解到临时目录后按本包名重新安装，LICENSE 必须落在
  # /usr/share/licenses/octa-term-bin/（namcap E 级要求）
  local extracted="${srcdir}/extracted"
  mkdir -p "${extracted}"
  bsdtar -xf "${srcdir}/octa-term-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" \
    -C "${extracted}" \
    --exclude '.BUILDINFO' --exclude '.MTREE' --exclude '.PKGINFO'
  install -Dm755 "${extracted}/usr/bin/octa-term" "${pkgdir}/usr/bin/octa-term"
  install -Dm644 "${extracted}/usr/share/licenses/octa-term/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
