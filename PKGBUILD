# Maintainer: Bin Jin <bjin@protonmail.com>

pkgname=oh-my-pi-bin
pkgver=17.3.0
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
sha256sums_x86_64=('287f07366f29896ef1e345423dab79b82a8dc0c1593383e20dfdd62a9dd2e799')
sha256sums_aarch64=('8ffd6d4d0b8003b4228abcdace8ed3882da981e96d9ae6c19255cc44b67f8f37')

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
