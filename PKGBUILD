# Maintainer: Emil <emil@esnx.xyz>

pkgname=codex-locality-bin
pkgver=0.r1.g7c6eb0eef1
pkgrel=1
pkgdesc="OpenAI Codex CLI with Syncthing-safe workspace-local sessions"
arch=('x86_64')
url="https://github.com/sssemil/codex-locality-bin"
license=('Apache-2.0')
depends=('glibc' 'ncurses')
provides=('openai-codex')
conflicts=('openai-codex' 'openai-codex-bin' 'codex-bin')
optdepends=('git: repository-aware Codex workflows')
options=('!debug' '!lto' '!strip')

source_x86_64=("codex-locality-runtime-0.r1.g7c6eb0eef1-x86_64-unknown-linux-musl.tar.zst::https://github.com/sssemil/codex-locality-bin/releases/download/0.r1.g7c6eb0eef1-1/codex-locality-runtime-0.r1.g7c6eb0eef1-x86_64-unknown-linux-musl.tar.zst")
sha256sums_x86_64=('9b7176ea38fcf86d1dfdc59c37c1120fd11e2d9f3bd6532202b8fd5a47362e34')

package() {
    local runtime_root="${srcdir}/codex-locality-runtime"
    local install_root="${pkgdir}/usr/lib/codex-locality"

    install -d -m755 "${install_root}"
    cp -a "${runtime_root}/." "${install_root}/"

    install -d -m755 "${pkgdir}/usr/bin"
    ln -s /usr/lib/codex-locality/bin/codex "${pkgdir}/usr/bin/codex"

    install -d -m755 \
        "${pkgdir}/usr/share/bash-completion/completions" \
        "${pkgdir}/usr/share/fish/vendor_completions.d" \
        "${pkgdir}/usr/share/zsh/site-functions"
    "${runtime_root}/bin/codex" completion bash \
        >"${pkgdir}/usr/share/bash-completion/completions/codex"
    "${runtime_root}/bin/codex" completion fish \
        >"${pkgdir}/usr/share/fish/vendor_completions.d/codex.fish"
    "${runtime_root}/bin/codex" completion zsh \
        >"${pkgdir}/usr/share/zsh/site-functions/_codex"

    install -Dm644 "${runtime_root}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${runtime_root}/NOTICE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}
