# Maintainer: Ken Tobias <https://github.com/l1a>
#
# This file is generated from packaging/aur/PKGBUILD.in in the etr repository
# by `just publish-aur` — do not edit it in the AUR repo directly.
#
# Note: the AUR packages `etr` and `etr-bin` are an unrelated tool (an ECMP
# traceroute) that also installs /usr/bin/etr, hence the name and conflicts.

pkgname=etr-terminal-bin
pkgver=0.10.24
pkgrel=1
pkgdesc="Reconnecting remote shell over QUIC — a Rust implementation of Eternal Terminal (et)"
arch=('x86_64' 'aarch64')
url="https://github.com/l1a/etr"
license=('GPL-3.0-only')
depends=('glibc' 'libutempter' 'openssh')
conflicts=('etr' 'etr-bin')
source_x86_64=("etr-${pkgver}-linux-x86_64::${url}/releases/download/v${pkgver}/etr-linux-x86_64"
               "etrs-${pkgver}-linux-x86_64::${url}/releases/download/v${pkgver}/etrs-linux-x86_64")
source_aarch64=("etr-${pkgver}-linux-aarch64::${url}/releases/download/v${pkgver}/etr-linux-aarch64"
                "etrs-${pkgver}-linux-aarch64::${url}/releases/download/v${pkgver}/etrs-linux-aarch64")
sha256sums_x86_64=('f3d984e97d1f7a70f1bc6882ee0d00ab81ead0462e2d2ddc330cbc6c4cc9ff56'
                   '0b45b778bf5c5c9ddad9815abf2045f8b44ae8ff72318ad5ffb85c6eb9f57d29')
sha256sums_aarch64=('1fcf2e39eef240cbd5633d48e8d7f0579e1ebdc580dff3c1e3f343bb74533964'
                    '64ff4ec876c9c596739f24b3fdf11ccff9a6a73a4d4accd7fa2c32010014c829')

# Arch-INDEPENDENT source, alongside the per-arch binaries above: one tarball carrying both
# man pages and bash/zsh/fish completions for both binaries, built by the `extras` job in
# .github/workflows/release.yml.
#
# Why an asset rather than generating them here: this is a `-bin` package, so there is no
# source tree to take man pages from, and generating completions by running the downloaded
# binary breaks the moment the build host's architecture differs from the target's -- exactly
# the aarch64 case. Everything below is a plain copy; package() executes NOTHING it downloaded,
# which is what makes it correct under `makepkg -A` and in a foreign-arch chroot.
#
# Completions are architecture-independent (clap derives them from the CLI definition), and the
# release workflow proves it rather than asserting it: both Linux runners generate a set
# natively and the job hard-fails if they differ by a byte.
source=("etr-extras-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/etr-extras.tar.gz")
sha256sums=('48025b52982898c6c7830c98b9d1a371441154f7b7b5337202918ce667de81e8')

package() {
    install -Dm755 "${srcdir}/etr-${pkgver}-linux-${CARCH}" "${pkgdir}/usr/bin/etr"
    install -Dm755 "${srcdir}/etrs-${pkgver}-linux-${CARCH}" "${pkgdir}/usr/bin/etrs"

    # Paths below are the tarball's layout verbatim -- it is packed with the FINAL installed
    # names, so this stays a copy and the naming convention lives in one place. Keep the two in
    # step: a name changed here and not in release.yml's `Pack etr-extras.tar.gz` step (or the
    # reverse) is a build failure on a user's machine.
    install -Dm644 "${srcdir}/man/etr.1"  "${pkgdir}/usr/share/man/man1/etr.1"
    install -Dm644 "${srcdir}/man/etrs.1" "${pkgdir}/usr/share/man/man1/etrs.1"

    install -Dm644 "${srcdir}/completions/bash/etr"       "${pkgdir}/usr/share/bash-completion/completions/etr"
    install -Dm644 "${srcdir}/completions/bash/etrs"      "${pkgdir}/usr/share/bash-completion/completions/etrs"
    install -Dm644 "${srcdir}/completions/zsh/_etr"       "${pkgdir}/usr/share/zsh/site-functions/_etr"
    install -Dm644 "${srcdir}/completions/zsh/_etrs"      "${pkgdir}/usr/share/zsh/site-functions/_etrs"
    install -Dm644 "${srcdir}/completions/fish/etr.fish"  "${pkgdir}/usr/share/fish/vendor_completions.d/etr.fish"
    install -Dm644 "${srcdir}/completions/fish/etrs.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/etrs.fish"
}
