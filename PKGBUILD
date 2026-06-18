# Maintainer: James Brink <dev.urandom.io@gmail.com>
# Contributor: <add yourself when you start helping out>

pkgname=claudex-bin
_pkgname=claudex
pkgver=0.11.0
pkgrel=1
pkgdesc="Query, search, and analyze Claude Code sessions from the command line (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/utensils/claudex"
license=('MIT')

# claudex links sqlite via rusqlite's `bundled` feature and uses
# no other C libs beyond glibc. Runtime depends list is empty —
# the binary is portable across modern Arch installs.
depends=()

# Shell-completion subcommand (`claudex completions <shell>`) emits
# completions for these shells; the package installs the bash, zsh,
# and fish files unconditionally, so the packages are listed as
# optdepends to help users discover the feature.
optdepends=(
  'bash-completion: Bash tab completion'
  'zsh-completions: Zsh tab completion (also auto-found via /usr/share/zsh/site-functions)'
  'fish: Fish tab completion'
)

# `claudex-bin`, the from-source `claudex`, and `claudex-git` are
# alternates: same binary at the same path. `provides=('claudex')`
# lets AUR helpers treat them as substitutable.
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" 'claudex-git')

# Release tarballs are already stripped (`strip --strip-all` in
# .github/workflows/release.yml). Re-stripping is a no-op; the
# `!strip` flag just skips a redundant makepkg phase.
options=(!strip)

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.tar.gz")

# Rewritten by scripts/aur/update-pkgbuild.sh on every release.
# 'SKIP' is a placeholder for hand-applied dev work — CI should
# never push a PKGBUILD with SKIP in these fields.
sha256sums_x86_64=('912f4eecf36284c86d5c10e74a98843e6ee9af02e13e7615d60134959d53d5ff')
sha256sums_aarch64=('ba7df7c8de66dc9d3de10e363641b665274a76c23b7a04b61bf2098d5a8111f0')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  # Shell completions. clap_complete's `unstable-dynamic` codegen
  # bakes argv[0] of the binary that generated it into the script
  # (the dynamic completer shells back out to `${bin} -- …`). If
  # we invoke the binary by absolute path, the literal `$pkgdir`
  # ends up embedded in the completion script and makepkg's
  # `lint_package` flags it. Putting `${pkgdir}/usr/bin` on PATH
  # and invoking as the bare `claudex` makes argv[0] == "claudex"
  # so the completion calls back via the user's PATH at runtime.
  install -d \
    "${pkgdir}/usr/share/bash-completion/completions" \
    "${pkgdir}/usr/share/zsh/site-functions" \
    "${pkgdir}/usr/share/fish/vendor_completions.d"
  PATH="${pkgdir}/usr/bin:${PATH}" ${_pkgname} completions bash \
    > "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  PATH="${pkgdir}/usr/bin:${PATH}" ${_pkgname} completions zsh \
    > "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
  PATH="${pkgdir}/usr/bin:${PATH}" ${_pkgname} completions fish \
    > "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
}
