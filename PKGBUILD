# Maintainer: Bin Jin <bjin@protonmail.com>

pkgname=oh-my-pi-bin
pkgver=18.1.0
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
sha256sums=('16c45f9d667442781f03fa198914cc39abcaa48ec5ed8f644643e554ca2fbf63')
sha256sums_x86_64=('9f78f04c2e12ce94db4b8b743685c89e65e6b8f829c790b4876057dd257e6379')
sha256sums_aarch64=('8e8c8a6846c1be48081cb2c927e3766f9b3d7108bff8cd3b5b51a7ee0a6526fb')

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
