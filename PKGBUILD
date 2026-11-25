# Maintainer: SHORiN <shorin@users.noreply.github.com>
#
# LiteMiyu：装 GitHub Release 上的 litemiyu-<版本>-linux-<架构>.tar.gz 里的那一个程序，照 Miyu 的 miyu-core
# （Miyu 仓库 packaging/aur/miyu-core/PKGBUILD.in）。这个文件是模板，由 `cargo xtask packaging <标签> --sums <SHA256SUMS>`
# 填好版本、哈希再发；别手改填出来的那份。
#
# 程序是发版时排过函数、去了符号的那一份（`cargo xtask dist`）：不让 makepkg 再去符号、不出调试包，装上的和发行包里的一字不差。
# 只有一个程序、不带资源，直接放 /usr/bin/litemiyu（miyu-core 有资源目录，才整层放 /usr/lib/miyu/ 再链过来）。
# 两个架构（LM-7）：x86_64 和 aarch64（Arch Linux ARM）各装各的发行包。程序是 musl 全静态的单文件（静态 PIE），不要任何共享库，
# 也就没有运行时依赖（`cargo xtask dist-check` 查着：没有 NEEDED、没有 INTERP）。

# 包名带 -bin：AUR 的规矩，有源码而装的是编好的程序的包要这么叫。它提供 litemiyu，和 Release 上那个 Arch 的包
# （litemiyu-<版本>-<架构>.pkg.tar.zst，包名 litemiyu）装的是同一个文件，两个不能同时装。
pkgname=litemiyu-bin
_version=2026.11.3
pkgver=2026.11.3
pkgrel=1
# namcap 不许说明里带包名（照子串比）：这里不写 litemiyu。
pkgdesc='Distilled Miyu: under 5 MB of RAM, yet capable enough for everyday work and for rescue'
arch=('x86_64' 'aarch64')
url='https://github.com/miyu-agent/litemiyu'
license=('AGPL-3.0-or-later')
depends=()
provides=("litemiyu=${pkgver}")
conflicts=('litemiyu')
options=('!strip' '!debug')
source_x86_64=("litemiyu-${_version}-linux-x86_64.tar.gz::${url}/releases/download/v${_version}/litemiyu-${_version}-linux-x86_64.tar.gz")
source_aarch64=("litemiyu-${_version}-linux-aarch64.tar.gz::${url}/releases/download/v${_version}/litemiyu-${_version}-linux-aarch64.tar.gz")
sha256sums_x86_64=('203b597b0452c60355c4546473a265b7470d5dc5658d18402c6b5912bba48c17')
sha256sums_aarch64=('011f9b1f7d74dad570507dfb06999a27651ed00f738bedcc2e9ae4d88747ddb8')

package() {
  local dir="litemiyu-${_version}-linux-${CARCH}"
  install -Dm755 "${dir}/litemiyu" "${pkgdir}/usr/bin/litemiyu"
  install -Dm644 "${dir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${dir}/THIRD-PARTY-LICENSES.txt" "${pkgdir}/usr/share/licenses/${pkgname}/THIRD-PARTY-LICENSES.txt"
  # 没有 shell 补全：LM-3 删了 `completions` 子命令（命令行只剩全屏、ask、config、help，项目主人拍板）。
}
