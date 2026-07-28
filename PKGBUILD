# Maintainer: Zadkiel AHARONIAN <hello@zadkiel.fr>
# Repository: https://github.com/aslafy-z/aur-packages

pkgname=kprompt-bin
pkgver=0.6.0 # renovate: datasource=github-releases depName=kprompt packageName=kprompt/kprompt
pkgrel=1
pkgdesc='AI Kubernetes CLI: natural language to a reviewable plan, applied after approval'
arch=('x86_64' 'aarch64')
url='https://kprompt.ai'
license=('Apache-2.0')
provides=("kprompt=${pkgver}")
conflicts=('kprompt')
optdepends=('helm: plan Helm chart installs and upgrades')
options=('!strip' '!debug')
# The release archives omit the NOTICE file, which Apache-2.0 section 4(d)
# requires redistributions to carry, so it is fetched from the tag directly.
source=("kprompt-${pkgver}-NOTICE::https://raw.githubusercontent.com/kprompt/kprompt/v${pkgver}/NOTICE")
source_x86_64=("https://github.com/kprompt/kprompt/releases/download/v${pkgver}/kprompt_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/kprompt/kprompt/releases/download/v${pkgver}/kprompt_${pkgver}_linux_arm64.tar.gz")
sha256sums=('3513bb19225b1e4d2f6ee1f8e5247b62063cefc71bd513beef65afc1e0f39150')
sha256sums_x86_64=('baadb3b46a2e03e0b85fd8cb6d92947a149b83c63bd094216be66ee42cb57069')
sha256sums_aarch64=('37eb519c1e10e746bf4585acc5fe501e61491b74505f93e02f378549def25c0e')

package() {
    install -D -m755 "${srcdir}/kprompt" "${pkgdir}/usr/bin/kprompt"

    install -D -m644 "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 "${srcdir}/kprompt-${pkgver}-NOTICE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
    install -D -m644 "${srcdir}/README.md" \
        "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    local _shell
    for _shell in bash zsh fish; do
        "${srcdir}/kprompt" completion "${_shell}" > "${srcdir}/completion.${_shell}"
    done

    install -D -m644 "${srcdir}/completion.bash" \
        "${pkgdir}/usr/share/bash-completion/completions/kprompt"
    install -D -m644 "${srcdir}/completion.zsh" \
        "${pkgdir}/usr/share/zsh/site-functions/_kprompt"
    install -D -m644 "${srcdir}/completion.fish" \
        "${pkgdir}/usr/share/fish/vendor_completions.d/kprompt.fish"
}
