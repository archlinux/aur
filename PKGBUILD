# Maintainer: 0chroma <me at chroma dot sh>
# Upstream installer: https://go.minimal.dev/install.sh
# Source: https://github.com/gominimal/minimal

pkgname=minimal-bin
pkgver=e6cf884b
pkgrel=2
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
               "gvproxy-min::${_bucket}/versions/${pkgver}/gvproxy-linux-amd64")
source_aarch64=("min::${_bucket}/versions/${pkgver}/minimal-linux-arm64"
                "minimald::${_bucket}/versions/${pkgver}/minimald-linux-arm64"
                "mip::${_bucket}/versions/${pkgver}/mip-linux-arm64"
                "gvproxy-min::${_bucket}/versions/${pkgver}/gvproxy-linux-arm64")
sha256sums=('e73b436bfca1c4ac4f0759ac0a503c89d648cccd2686ba20256b0808a62e6065'
            '45bb9bd07d107772ece127f809a129f2e5d083354edb21cc8ee9942328001640'
            'fd0af7dcf941eba2b2c3ccbc559b36996789bd27c6d0c4e76b7a55be42a3c045')
sha256sums_x86_64=('487bcfcbf03ae74c1fc721acec5835089c6f5a5e18feefa1395575a006d83a4c'
                   'e79f152eccbd0af56613315a30653a5b8880e82112b9f277cc73aca275a58114'
                   '4608c229bda7a65a8b104c8b36641d90fb8922690759c075b21211f8da673903'
                   '3011c5629c9138d2050fb23c510e09ae53e30ec52e6a9ab85632bc1550e8ef63')
sha256sums_aarch64=('6c2cff093be6c77f1a2c2962dfb6de9ae376f1ce274d6346f5c64b443f380abf'
                    '958488a03ab32453760d03258096ae400e24dd6c098846eb6a85580d201c2975'
                    '24f1c31d632a6900cde73f4c3ac59b3642739252a668463183be9db51e429fcb'
                    '6ecca02839254c9a0cc184bba7aac63755a22d7ed10d455b852528a99d7f7d4b')

pkgver() {
    curl -sL "${_bucket}/stable"
}

package() {
    # CLI, daemon, and helper binaries
    install -Dm755 "${srcdir}/min" "${pkgdir}/usr/bin/min"
    install -Dm755 "${srcdir}/minimald" "${pkgdir}/usr/bin/minimald"
    install -Dm755 "${srcdir}/mip" "${pkgdir}/usr/bin/mip"
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
