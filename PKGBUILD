# Maintainer: Nguyen Ky <nhktmdzhg at google mail>
# Contributor: Bin Jin <bjin@protonmail.com>
pkgname=omp-bun
pkgver=18.2.10
pkgrel=1
pkgdesc="oh-my-pi (omp): AI Coding agent for the terminal (built with system bun)"
arch=('x86_64')
url="https://omp.sh/"
license=('MIT')
provides=('omp' 'oh-my-pi' 'oh-my-pi-git')
conflicts=('omp' 'oh-my-pi' 'oh-my-pi-git')
depends=('bun' 'gcc-libs' 'glibc')
makedepends=('rustup' 'cmake' 'make' 'ninja')
optdepends=(
    'alsa-lib: ALSA fallback for live voice, STT, and TTS'
    'at-spi2-core: Linux accessibility backend for the computer tool'
    'chromium: system browser for the browser tool'
    'git: repository integration and isolated task worktrees'
    'julia: Julia eval backend'
    'libpulse: PulseAudio/PipeWire-Pulse client backend for live voice, STT, and TTS'
    'python: Python 3.10+ eval backend'
    'xdg-desktop-portal: Wayland ScreenCast and RemoteDesktop portals for the computer tool'
    'xdg-desktop-portal-impl: compositor-specific backend for Wayland computer tool portals'
)
options=('!lto' '!strip')
source=("${pkgname}::git+https://github.com/can1357/oh-my-pi.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}/${pkgname}"
    git submodule update --init --recursive
}

build() {
    cd "${srcdir}/${pkgname}"
    
    rustup install nightly
    rustup default nightly
    
    bun install --frozen-lockfile
    bun run build:native
    
    cd packages/coding-agent
    bun run build
}

package() {
    cd "${srcdir}/${pkgname}"
    
    install -Dm755 packages/coding-agent/dist/omp "${pkgdir}/usr/bin/omp"
    
    local _completion_dir="${srcdir}/completions"
    local _runtime_dir="${srcdir}/completion-runtime"
    mkdir -p "${_completion_dir}" "${_runtime_dir}/home" "${_runtime_dir}/xdg"
    
    env HOME="${_runtime_dir}/home" XDG_DATA_HOME="${_runtime_dir}/xdg" \
    "${pkgdir}/usr/bin/omp" completions bash >"${_completion_dir}/omp.bash" 2>/dev/null || true
    env HOME="${_runtime_dir}/home" XDG_DATA_HOME="${_runtime_dir}/xdg" \
    "${pkgdir}/usr/bin/omp" completions zsh >"${_completion_dir}/_omp" 2>/dev/null || true
    env HOME="${_runtime_dir}/home" XDG_DATA_HOME="${_runtime_dir}/xdg" \
    "${pkgdir}/usr/bin/omp" completions fish >"${_completion_dir}/omp.fish" 2>/dev/null || true
    
    if [[ -s "${_completion_dir}/omp.bash" ]]; then
        install -Dm644 "${_completion_dir}/omp.bash" "${pkgdir}/usr/share/bash-completion/completions/omp"
    fi
    if [[ -s "${_completion_dir}/_omp" ]]; then
        install -Dm644 "${_completion_dir}/_omp" "${pkgdir}/usr/share/zsh/site-functions/_omp"
    fi
    if [[ -s "${_completion_dir}/omp.fish" ]]; then
        install -Dm644 "${_completion_dir}/omp.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/omp.fish"
    fi
    
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
