# Maintainer: cublueer <starriver_alvin@163.com>
#
# octa-term：终端无感数学计算（系统 GNU Octave）
# 从 v${pkgver} 标签源码构建。标签不存在时 `makepkg` 拉取会失败，
# 请在仓库打上对应 tag（git tag v${pkgver} && git push origin v${pkgver}）。
#
# 用法（在干净目录中）：
#   PACKAGER='cublueer <cublueer@users.noreply.github.com>' makepkg -Cf

pkgname=octa-term
pkgver=0.1.0
pkgrel=1
pkgdesc='终端无感数学计算：把 shell 输入行变成 Octave 计算器（fish/bash/zsh 集成）'
arch=('x86_64' 'aarch64')
url='https://github.com/cublueer/octa-term'
license=('MIT')
options=('!lto' '!debug')
export LC_ALL=C.UTF-8
depends=('octave' 'libgcc' 'glibc')
makedepends=('cargo' 'git')
optdepends=(
  'fish: fish shell integration (Enter 劫持、多行矩阵、自动续行)'
  'bash: bash shell integration (单行兜底)'
  'zsh: zsh shell integration (单行兜底)'
)
source=(
  "octa-term::git+${url}.git#tag=v${pkgver}"
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd octa-term
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd octa-term
  cargo build --release --locked
}

package() {
  cd octa-term
  install -Dm755 "target/release/octa-term" "${pkgdir}/usr/bin/octa-term"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
