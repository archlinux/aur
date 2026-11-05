# Maintainer: Ken Tobias <https://github.com/l1a>
#
# This file is generated from packaging/aur/PKGBUILD.in in the etr repository
# by `just publish-aur` — do not edit it in the AUR repo directly.
#
# Note: the AUR packages `etr` and `etr-bin` are an unrelated tool (an ECMP
# traceroute) that also installs /usr/bin/etr, hence the name and conflicts.

pkgname=etr-terminal-bin
pkgver=0.10.19
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
sha256sums_x86_64=('257bc67b4e12e70413a83db1f6e75254bf6cb0352e6330313b108a2ba77b32bb'
                   '25a5243e289a11638116545375b61aed0825dc9f53e9bc16f0626139ade1df8a')
sha256sums_aarch64=('e9cd3fc3651be7452b9484b44fe018e4900ee949f626b684be2f85ff4920c084'
                    '0d781587f6d096f00c2311799ee852ea70c22b2b9941aa4e04522c75603904b9')

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
sha256sums=('9a48fe419d6cd1350519ca57687eb08ac66c83ab24ca6468b3971e6fc5aba4c4')

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
