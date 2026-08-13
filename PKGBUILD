# Maintainer: yookibooki <rendogust@gmail.com>
# https://github.com/yookibooki/aur-packages/issues
# Telegram: @javohir81

pkgname=omp-release-bin
_realver=17.2.12
pkgver=17.2.12
pkgrel=1
pkgdesc="oh-my-pi (omp): AI coding agent for the terminal -- hash-anchored edits, optimized tool harness, LSP, Python, browser, subagents, and more (release binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/can1357/oh-my-pi"
license=('MIT')
depends=('glibc')
optdepends=('bash-completion: bash tab-completion for omp'
            'chromium: browser tool (headless web automation)'
            'python: persistent Python eval cells')
provides=('oh-my-pi')
conflicts=('oh-my-pi' 'oh-my-pi-bin' 'omp' 'omp-bin')
options=('!strip' '!debug')

source=("LICENSE-${_realver}::https://raw.githubusercontent.com/can1357/oh-my-pi/v${_realver}/LICENSE")
source_x86_64=("omp-${_realver}-linux-x64::https://github.com/can1357/oh-my-pi/releases/download/v${_realver}/omp-linux-x64")
source_aarch64=("omp-${_realver}-linux-arm64::https://github.com/can1357/oh-my-pi/releases/download/v${_realver}/omp-linux-arm64")

sha256sums=('545636e19386d3d4e0ae6d77354527499999c3ebfbca61b9fa5aa4ead7c0b308')
sha256sums_x86_64=('6c75331bf09d5a9e9433bd592b3ee993d751a15d5b7450c1a334cc0684996f30')
sha256sums_aarch64=('f176edf8174db252abe1aa6e84df284e1b83b8dd7ef34ac7faf7884a5e172a4c')

package() {
  local _src
  case "${CARCH}" in
    x86_64)  _src="linux-x64"  ;;
    aarch64) _src="linux-arm64" ;;
  esac

  install -Dm755 "${srcdir}/omp-${_realver}-${_src}" "${pkgdir}/usr/bin/omp"
  install -Dm644 "${srcdir}/LICENSE-${_realver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Generate shell completions from the live CLI metadata.
  local _omp="${pkgdir}/usr/bin/omp"
  export HOME="${srcdir}/.omp-home"
  install -dm755 "${HOME}"

  install -dm755 "${pkgdir}/usr/share/bash-completion/completions"
  "${_omp}" completions bash > "${pkgdir}/usr/share/bash-completion/completions/omp" 2>/dev/null \
    || rm -f "${pkgdir}/usr/share/bash-completion/completions/omp"

  install -dm755 "${pkgdir}/usr/share/zsh/site-functions"
  "${_omp}" completions zsh > "${pkgdir}/usr/share/zsh/site-functions/_omp" 2>/dev/null \
    || rm -f "${pkgdir}/usr/share/zsh/site-functions/_omp"

  install -dm755 "${pkgdir}/usr/share/fish/vendor_completions.d"
  "${_omp}" completions fish > "${pkgdir}/usr/share/fish/vendor_completions.d/omp.fish" 2>/dev/null \
    || rm -f "${pkgdir}/usr/share/fish/vendor_completions.d/omp.fish"
}
