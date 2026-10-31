# Maintainer: duanluan <duanluan@outlook.com>
#
# Prebuilt Strata Terminal (the `strata` CLI). The terminal distribution is
# self-contained: it bundles its own Python 3.12 runtime, vocab data and
# tooling. The GPU-specific inference engine and the model weights are NOT
# bundled and are fetched by `strata launch` on first use, exactly like the
# official one-line installer does — see the README before packaging
# changes. Upstream publishes no ARM Linux builds.
#
# /usr/bin/strata is also owned by unrelated packages (the strata-bin file
# manager) and by same-project source builds (strata-engine-git, strata-rocm),
# hence the conflicts list.

pkgname=strata-terminal-bin
_relver=0.2.8
pkgver=0.1.54
pkgrel=2
pkgdesc='Strata Terminal: run Qwen3.8-Flash-Next and DeepSeek V4.1-Flash locally with an OpenAI/Anthropic-compatible API (prebuilt)'
arch=('x86_64')
url='https://github.com/Niko1221/Strata'
license=('MIT')
depends=('glibc')
provides=('strata' 'strata-terminal')
conflicts=('strata' 'strata-terminal' 'strata-engine' 'strata-bin' 'strata-rocm')
options=('!strip' '!debug')
source=(
  'LICENSE'
  "strata-terminal-${pkgver}-linux-x86_64.tar.gz::https://github.com/Niko1221/Strata/releases/download/v${_relver}/strata-control-${pkgver}-linux-x86_64.tar.gz"
)
noextract=("strata-terminal-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('949b9b0aada7476006469e58ee4ffb0e0f68c2d9137e90a356757b61a09d37f0'
            '572520fbb0df30cc164fc7ce195c84908b02aaa67b569d7b1982d94cd18a364b')

package() {
  install -dm755 "${pkgdir}/opt/strata-terminal"
  bsdtar -C "${pkgdir}/opt/strata-terminal" \
    -xf "${srcdir}/strata-terminal-${pkgver}-linux-x86_64.tar.gz"

  # 启动脚本会解析符号链接定位自身目录，/usr/bin 下放绝对软链即可
  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/strata-terminal/bin/strata "${pkgdir}/usr/bin/strata"

  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
