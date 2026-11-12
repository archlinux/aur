# Maintainer: agony <27015 at riseup dot net>

pkgname=zero-bin
pkgver=0.13.0
pkgrel=1
pkgdesc='Fast, multi-provider terminal coding agent (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/Twigpine/zero'
license=('MIT')
optdepends=('agent-browser: browser control'
            'bubblewrap: sandbox for shell commands'
            'git: repository info, plugin and skill installs'
            'poppler: PDF text and rendering of image-only PDFs'
            'tuistory: terminal control')
provides=("zero=${pkgver}")
conflicts=('zero')
_release="${url}/releases/download/v${pkgver}"
source=("zero-${pkgver}-LICENSE::https://raw.githubusercontent.com/Twigpine/zero/v${pkgver}/LICENSE")
source_x86_64=("${_release}/zero-v${pkgver}-linux-x64.tar.gz")
source_aarch64=("${_release}/zero-v${pkgver}-linux-arm64.tar.gz")
sha256sums=('67b7a613596a56e90712dd5a8450a4507ec3cb5a6db09425cf7a72a4b0ec89b7')
sha256sums_x86_64=('763f7ae3c5874a8e8df2335cecd99c9724ea5719f2dac7e48b4d438bbabfa2d0')
sha256sums_aarch64=('e2d5f48ad219b1ec08e0f8f05f77393f5d3d3fdb2d61eb82585c3fcc31cbb1c5')

_home_env() {
  export HOME="${srcdir}/home"
  export XDG_CONFIG_HOME="${HOME}/.config"
  export XDG_DATA_HOME="${HOME}/.local/share"
  export XDG_CACHE_HOME="${HOME}/.cache"
}

build() {
  _home_env
  for shell in bash fish zsh; do
    ./zero completions "${shell}" > "completion.${shell}"
  done
}

package() {
  install -Dm755 zero zero-linux-sandbox -t "${pkgdir}/usr/bin"
  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/zero"
  install -Dm644 completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/zero.fish"
  install -Dm644 completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_zero"
  install -Dm644 "zero-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
