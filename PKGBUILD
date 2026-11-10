# Maintainer: agentjp <agent at fastmail dot jp>
# SPDX-License-Identifier: 0BSD (this PKGBUILD; the packaged software is LGPL-2.1-or-later)
#
# Template for the AUR `bdinfo-rs-bin` package. The `packages.yml` aur job seds
# 5.0.0 to the release version, then KSXGitHub/github-actions-deploy-aur runs
# `updpkgsums` (filling in the real per-arch sha256sums) and pushes it to the AUR.
# This repackages the prebuilt static-musl release tarballs — no compilation.
pkgname=bdinfo-rs-bin
_pkgname=bdinfo-rs
pkgver=5.0.0
pkgrel=1
pkgdesc='Memory-safe command-line Blu-ray disc analyzer — a drop-in replacement for BDInfo'
arch=('x86_64' 'aarch64')
url='https://github.com/agentjp/bdinfo-rs'
license=('LGPL-2.1-or-later')
provides=('bdinfo-rs')
conflicts=('bdinfo-rs')
# The release binary is prebuilt, static, and already stripped (cargo profile
# strip=true) — don't re-strip it, and don't emit an (empty) -debug package on
# hosts whose makepkg.conf enables the `debug` option.
options=('!strip' '!debug')
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('1533c1abdc88fc557b50a6cee6255d1769b7d5998581a64a2417f3f1a8a0c184')
sha256sums_aarch64=('9b33d80fdd2fe6b001b1f70f0c1ce32882c349ee922505987df43c48f9b55db1')

package() {
    # Each release tarball extracts to a `bdinfo-rs-<triple>/` directory; CARCH is
    # x86_64 or aarch64, matching the `<carch>-unknown-linux-musl` triple.
    local _dir="${srcdir}/${_pkgname}-${CARCH}-unknown-linux-musl"
    install -Dm755 "${_dir}/bdinfo-rs" "${pkgdir}/usr/bin/bdinfo-rs"
    install -Dm644 "${_dir}/bdinfo-rs.1" "${pkgdir}/usr/share/man/man1/bdinfo-rs.1"
    install -Dm644 "${_dir}/bdinfo-rs.bash" "${pkgdir}/usr/share/bash-completion/completions/bdinfo-rs"
    install -Dm644 "${_dir}/_bdinfo-rs" "${pkgdir}/usr/share/zsh/site-functions/_bdinfo-rs"
    install -Dm644 "${_dir}/bdinfo-rs.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/bdinfo-rs.fish"
    install -Dm644 "${_dir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
