# Maintainer: 0chroma <me at chroma dot sh>
# Upstream installer: https://go.minimal.dev/install.sh
# Source: https://github.com/gominimal/minimal

pkgname=minimal-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Isolated, reproducible development environments and a secure package manager that give your whole team identical environments, while keeping AI agents off the laptop"
arch=(x86_64 aarch64)
url="https://minimal.dev"
license=("Apache-2.0")
depends=(git)
makedepends=(curl)
optdepends=(
    "bash: shell integration and completions"
    "zsh: shell integration and completions"
    "fish: shell integration and completions"
)
_bucket="https://storage.googleapis.com/minimal-one"
source=("${_bucket}/versions/${pkgver}/minimald.apparmor"
        "${_bucket}/versions/${pkgver}/minimald.apparmor-tunable"
        "${_bucket}/versions/${pkgver}/install-apparmor-profile.sh")
source_x86_64=("min::${_bucket}/versions/${pkgver}/minimal-linux-amd64"
               "minimald::${_bucket}/versions/${pkgver}/minimald-linux-amd64"
               "mip::${_bucket}/versions/${pkgver}/mip-linux-amd64"
               "gvproxy-min::${_bucket}/versions/${pkgver}/gvproxy-linux-amd64"
               "minvmd::${_bucket}/versions/${pkgver}/minvmd-linux-amd64")
source_aarch64=("min::${_bucket}/versions/${pkgver}/minimal-linux-arm64"
                "minimald::${_bucket}/versions/${pkgver}/minimald-linux-arm64"
                "mip::${_bucket}/versions/${pkgver}/mip-linux-arm64"
                "gvproxy-min::${_bucket}/versions/${pkgver}/gvproxy-linux-arm64"
                "minvmd::${_bucket}/versions/${pkgver}/minvmd-linux-arm64")
sha256sums=('e73b436bfca1c4ac4f0759ac0a503c89d648cccd2686ba20256b0808a62e6065'
            '45bb9bd07d107772ece127f809a129f2e5d083354edb21cc8ee9942328001640'
            'fd0af7dcf941eba2b2c3ccbc559b36996789bd27c6d0c4e76b7a55be42a3c045')
sha256sums_x86_64=('e9a65658a687baa11fec063dee595a7d850a9828892759f1265bf2100ba5fb6b'
                   'f8438e044ddce665467db638292d4350ef28547db60641da43bf43c7cff3ae3e'
                   'f6cdc95b443c34a3499742d31bad50c6fadc1b1dabf3f50771cab5ccbf40a014'
                   '3011c5629c9138d2050fb23c510e09ae53e30ec52e6a9ab85632bc1550e8ef63'
                   '12e32ef91c8f5ea6c512766c3b0cd9b42a2f6b92b31dffbb55f8e3a726cae995')
sha256sums_aarch64=('4f819de7455282bb61f922fa0114d34437a6b39989ce99c70af3d5a8f3b9b140'
                    '6bf3d4ef4b03d02bf24cd18a98d4f8dc3304b1d1ea358e071218ed652d5ba4e3'
                    'd18d9e0937f94c9db2bbe2a3fb2e24603a661a98dc90d117c4b6fda6b187282a'
                    '6ecca02839254c9a0cc184bba7aac63755a22d7ed10d455b852528a99d7f7d4b'
                    '0495fa12e1633b727290ba424de9cfdb71f05ec1adbb84ff099143d342d7159e')

pkgver() {
    curl -sL "${_bucket}/stable"
}

package() {
    # CLI, daemon, helper, and VM-host binaries. minvmd is self-contained: the
    # shipped static-musl build links libkrun statically (no lib/ sibling, no
    # dlopen), so the package needs no extra library, unlike macOS.
    install -Dm755 "${srcdir}/min" "${pkgdir}/usr/bin/min"
    install -Dm755 "${srcdir}/minimald" "${pkgdir}/usr/bin/minimald"
    install -Dm755 "${srcdir}/mip" "${pkgdir}/usr/bin/mip"
    install -Dm755 "${srcdir}/minvmd" "${pkgdir}/usr/bin/minvmd"
    install -Dm755 "${srcdir}/gvproxy-min" "${pkgdir}/usr/bin/gvproxy-min"

    # git-remote-min is a symlink to min upstream
    ln -s min "${pkgdir}/usr/bin/git-remote-min"

    # AppArmor profile, tunable, and loader script
    install -Dm644 "${srcdir}/minimald.apparmor" \
        "${pkgdir}/usr/share/minimal/apparmor/minimald"
    install -Dm644 "${srcdir}/minimald.apparmor-tunable" \
        "${pkgdir}/usr/share/minimal/apparmor/tunables/minimald"
    install -Dm755 "${srcdir}/install-apparmor-profile.sh" \
        "${pkgdir}/usr/share/minimal/apparmor/install-apparmor-profile.sh"

    # Upstream ships no pre-packaged completions; the binary generates them.
    # XDG overrides redirect its user-level target dirs into srcdir, and
    # ZDOTDIR keeps its compinit-dump cleanup off the build host's ~.
    chmod +x "${srcdir}/min"
    XDG_DATA_HOME="${srcdir}/completions" \
    XDG_CONFIG_HOME="${srcdir}/completions" \
    ZDOTDIR="${srcdir}/zdotdir" \
        "${srcdir}/min" completions install --no-input \
            --minimal-dir "${srcdir}/minimal-cache" bash zsh fish

    install -Dm644 "${srcdir}/completions/bash-completion/completions/min" \
        "${pkgdir}/usr/share/bash-completion/completions/min"
    install -Dm644 "${srcdir}/completions/zsh/completions/_min" \
        "${pkgdir}/usr/share/zsh/site-functions/_min"
    install -Dm644 "${srcdir}/completions/fish/completions/min.fish" \
        "${pkgdir}/usr/share/fish/vendor_completions.d/min.fish"
}
