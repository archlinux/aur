# Maintainer: James Brink <brink.james@gmail.com>
# Maintainer: Jeffrey Dilley <jeff.dilley@gmail.com>

pkgname=mold-ai-bin
_pkgname=mold-ai
_binname=mold
pkgver=0.32.0
pkgrel=1
pkgdesc="AI image/video CLI for remote GPU hosts (prebuilt GPU-free client)"
arch=('x86_64')
url="https://github.com/utensils/mold"
license=('MIT')
install=mold-ai-bin.install

# GPU-free release: no NVIDIA driver or CUDA runtime required.
depends=('gcc-libs' 'glibc')

optdepends=(
  'ffmpeg: video output for LTX-Video / LTX-2 (mp4 mux fallback)'
  'bash-completion: Bash tab completion'
  'zsh-completions: Zsh tab completion (also auto-found via /usr/share/zsh/site-functions)'
  'fish: Fish tab completion'
)

# Tells pacman this satisfies `mold-ai`. `conflicts` covers:
#   - the other AUR variants (only one can be installed at a time)
#   - extra/mold (the rui314 linker), which also installs /usr/bin/mold — without
#     this entry pacman would still refuse the install with a file conflict, but
#     declaring it up front is clearer and skips makepkg's lint warning.
provides=("${_pkgname}=${pkgver}")
conflicts=('mold-ai' 'mold-ai-git' 'mold')

# Release tarball ships an already-stripped binary (see profile.release in
# Cargo.toml: strip = true). Re-stripping is a no-op.
options=(!strip)

# Local CUDA generation users should use mold-ai / mold-ai-git (source builds)
# or an architecture-specific CUDA release archive instead.
# Arch-agnostic source for the LICENSE file (release tarballs don't carry it).
source=("LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${url}/releases/download/v${pkgver}/${_binname}-x86_64-unknown-linux-gnu-cpu.tar.gz")

# Rewritten by scripts/aur/update-pkgbuild.sh on every release.
sha256sums=('cd904e73d29dc7d62178ebc6def9e500c6b176e8e4c40f58e4b0b5f008380311')
sha256sums_x86_64=('dbf94cc07df3bee8d339647052368f515eef5ec4c25a6363f6d0ca58923bea42')

package() {
  install -Dm755 "${srcdir}/${_binname}" "${pkgdir}/usr/bin/${_binname}"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # The release archive ships the shell completions beside the binary
  # (`completions/`), generated at release time from this exact binary and
  # invoked as `mold` so the scripts call back through the user's PATH.
  # Install release-generated completions without executing the payload.
  if [[ ! -d "${srcdir}/completions" ]]; then
    echo "error: release archive v${pkgver} carries no completions/ directory;" >&2
    echo "       this recipe requires a GPU-free CPU release archive with completions" >&2
    return 1
  fi
  install -Dm644 "${srcdir}/completions/${_binname}.bash" \
    "${pkgdir}/usr/share/bash-completion/completions/${_binname}"
  install -Dm644 "${srcdir}/completions/_${_binname}" \
    "${pkgdir}/usr/share/zsh/site-functions/_${_binname}"
  install -Dm644 "${srcdir}/completions/${_binname}.fish" \
    "${pkgdir}/usr/share/fish/vendor_completions.d/${_binname}.fish"
}
