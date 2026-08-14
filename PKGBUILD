# Maintainer: Bin Jin <bjin@protonmail.com>

pkgname=oh-my-pi-bin
pkgver=17.3.3
pkgrel=1
pkgdesc="A coding agent with the IDE wired in (release binary)"
arch=('x86_64' 'aarch64')
url="https://omp.sh/"
license=('MIT')
depends=('glibc')
optdepends=(
    'alsa-lib: ALSA fallback for live voice, STT, and TTS'
    'at-spi2-core: Linux accessibility backend for the computer tool'
    'chromium: system browser for the browser tool'
    'git: repository integration and isolated task worktrees'
    'julia: Julia eval backend'
    'libpulse: PulseAudio/PipeWire-Pulse client backend for live voice, STT, and TTS'
    'python: Python 3.10+ eval backend'
    'sshfs: mount SSH remote workspaces'
    'xdg-desktop-portal: Wayland RemoteDesktop portal fallback for computer tool input'
    'xdg-desktop-portal-impl: compositor-specific backend for Wayland computer tool input'
)
provides=("oh-my-pi")
conflicts=("oh-my-pi")
options=('!strip')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/can1357/oh-my-pi/v${pkgver}/LICENSE")
source_x86_64=("omp-${pkgver}::https://github.com/can1357/oh-my-pi/releases/download/v${pkgver}/omp-linux-x64")
source_aarch64=("omp-${pkgver}::https://github.com/can1357/oh-my-pi/releases/download/v${pkgver}/omp-linux-arm64")
sha256sums=('545636e19386d3d4e0ae6d77354527499999c3ebfbca61b9fa5aa4ead7c0b308')
sha256sums_x86_64=('25d642d35cf07a6b94336da94fa6d69b7a0a8b2f1b865ccf92e770ba37aaa606')
sha256sums_aarch64=('b2e8ae942cbd8aee2cabea62c96166753ca9b258c1314897ab81ef8f18fd090e')

_install_completions() {
    local _omp_bin="$1"
    local _completion_dir="${srcdir}/completions"
    local _runtime_dir="${srcdir}/completion-runtime"

    rm -rf "${_completion_dir}" "${_runtime_dir}"
    mkdir -p "${_completion_dir}" "${_runtime_dir}/home" "${_runtime_dir}/xdg"

    env HOME="${_runtime_dir}/home" XDG_DATA_HOME="${_runtime_dir}/xdg" \
        "${_omp_bin}" completions bash > "${_completion_dir}/omp.bash"
    env HOME="${_runtime_dir}/home" XDG_DATA_HOME="${_runtime_dir}/xdg" \
        "${_omp_bin}" completions zsh > "${_completion_dir}/_omp"
    env HOME="${_runtime_dir}/home" XDG_DATA_HOME="${_runtime_dir}/xdg" \
        "${_omp_bin}" completions fish > "${_completion_dir}/omp.fish"

    install -Dm644 "${_completion_dir}/omp.bash" "${pkgdir}/usr/share/bash-completion/completions/omp"
    install -Dm644 "${_completion_dir}/_omp" "${pkgdir}/usr/share/zsh/site-functions/_omp"
    install -Dm644 "${_completion_dir}/omp.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/omp.fish"
}

package() {
    install -Dm755 "${srcdir}/omp-${pkgver}" "${pkgdir}/usr/bin/omp"
    _install_completions "${pkgdir}/usr/bin/omp"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
