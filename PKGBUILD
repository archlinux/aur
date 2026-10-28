# Maintainer: Twilight0 <twilight0@vivaldi.net>
pkgname=gemini-api-cli-bin
pkgver=0.4.4
pkgrel=1
pkgdesc="Official command-line interface for the Google Gemini API (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/google-gemini/gemini-api-cli"
license=('Apache-2.0')
provides=('gemini-api-cli=${pkgver}' 'gemini-api=${pkgver}')
conflicts=('gemini-api-cli' 'gemini-api')
options=('!strip')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/google-gemini/gemini-api-cli/releases/download/v${pkgver}/gemini-api_Linux_x86_64.tar.gz")
sha256sums_x86_64=('976c0c7241c0d577f535249cf670c8e43503d34fbacd04fd0b008d98c34b6078')

source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/google-gemini/gemini-api-cli/releases/download/v${pkgver}/gemini-api_Linux_arm64.tar.gz")
sha256sums_aarch64=('53edd2cda106f06db4e8edf466269fce7448a5deff98d5fd158639ded6412f64')

package() {
    cd "${srcdir}"

    # Install main binary and convenience symlink
    install -Dm755 gemini-api "${pkgdir}/usr/bin/gemini-api"
    ln -s gemini-api "${pkgdir}/usr/bin/gemini-api-cli"

    # Install documentation and license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    # Generate and install shell completions if running on native architecture
    if [[ "$CARCH" == "x86_64" && "$(uname -m)" == "x86_64" ]] || [[ "$CARCH" == "aarch64" && "$(uname -m)" =~ (aarch64|arm64) ]]; then
        "${srcdir}/gemini-api" completion bash > "${srcdir}/completion.bash"
        "${srcdir}/gemini-api" completion zsh > "${srcdir}/completion.zsh"
        "${srcdir}/gemini-api" completion fish > "${srcdir}/completion.fish"

        install -Dm644 "${srcdir}/completion.bash" "${pkgdir}/usr/share/bash-completion/completions/gemini-api"
        ln -s gemini-api "${pkgdir}/usr/share/bash-completion/completions/gemini-api-cli"

        install -Dm644 "${srcdir}/completion.zsh" "${pkgdir}/usr/share/zsh/site-functions/_gemini-api"
        ln -s _gemini-api "${pkgdir}/usr/share/zsh/site-functions/_gemini-api-cli"

        install -Dm644 "${srcdir}/completion.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/gemini-api.fish"
        ln -s gemini-api.fish "${pkgdir}/usr/share/fish/vendor_completions.d/gemini-api-cli.fish"
    fi
}
