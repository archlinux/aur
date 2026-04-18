# Maintainer: Fabio Fontana (fabifont) <me@fabifont.dev>

pkgname=claude-code-bin
pkgver=2.1.114
pkgrel=1
pkgdesc="An agentic coding tool that lives in your terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/anthropics/claude-code"
license=('LicenseRef-claude-code')

depends=('glibc' 'sh')
options=('!strip' '!debug')

provides=("claude-code=${pkgver}")
conflicts=('claude-code')

optdepends=(
  'git: allow Claude to use git'
  'github-cli: interact with GitHub'
  'glab: interact with GitLab'
  'ripgrep: enhanced file search'
  'tmux: agent team split panes'
  'bubblewrap: sandboxing'
  'socat: sandboxing'
)

_gcs_bucket="https://storage.googleapis.com/claude-code-dist-86c565f3-f756-42ad-8dfa-d59b1c096819/claude-code-releases"

source=("claude-code-LICENSE-${pkgver}.md::https://raw.githubusercontent.com/anthropics/claude-code/v${pkgver}/LICENSE.md")
source_x86_64=("claude-${pkgver}-linux-x64::${_gcs_bucket}/${pkgver}/linux-x64/claude")
source_aarch64=("claude-${pkgver}-linux-arm64::${_gcs_bucket}/${pkgver}/linux-arm64/claude")

sha256sums=('728158fd1037143fad6907e8fa34804177e598b7326519503fe83cafdef849e6')
sha256sums_x86_64=('12bd4b0916deb06be17ffc7b2f0485e140bf00b2db3dcb78469d66723d73c27f')
sha256sums_aarch64=('9556b74e2c912e7dcaef90c91fd0dd5095364f8a9d71398de3c5c669612b828a')

package() {
  local _source_arch
  case "${CARCH}" in
    x86_64)
      _source_arch="linux-x64"
      ;;
    aarch64)
      _source_arch="linux-arm64"
      ;;
    *)
      echo "Unsupported architecture: ${CARCH}" >&2
      return 1
      ;;
  esac

  install -Dm755 "${srcdir}/claude-${pkgver}-${_source_arch}" \
    "${pkgdir}/usr/lib/claude-code/claude"

  install -dm755 "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/claude" << 'EOF'
#!/bin/sh
export DISABLE_AUTOUPDATER=1
exec /usr/lib/claude-code/claude "$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/claude"

  install -Dm644 "${srcdir}/claude-code-LICENSE-${pkgver}.md" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
