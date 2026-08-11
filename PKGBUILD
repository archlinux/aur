# Maintainer: Christopher Cooper <christopher@cg505.com>
# Maintainer: Jérôme Poulin <jeromepoulin@gmail.com>
# Maintainer: Fabio Fontana (fabifont) <me@fabifont.dev>
# Automation repository: https://github.com/fabifont/claude-code-aur

pkgname=claude-code
pkgver=2.1.227
pkgrel=1
pkgdesc="An agentic coding tool that lives in your terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/anthropics/claude-code"
license=('LicenseRef-claude-code')
depends=('bash')
# Binary is a self-contained Bun executable with embedded JS/resources - stripping breaks it
options=('!strip')

optdepends=(
	'git: allow Claude to use git'
	'github-cli: interact with GitHub'
	'glab: interact with GitLab'
	'ripgrep: enhanced file search'
	'tmux: agent team split panes'
	'bubblewrap: sandboxing'
	'socat: sandboxing'
)

source=("cc-legal::https://code.claude.com/docs/en/legal-and-compliance.md")
source_x86_64=("claude-${pkgver}-x86_64::https://downloads.claude.ai/claude-code-releases/${pkgver}/linux-x64/claude")
source_aarch64=("claude-${pkgver}-aarch64::https://downloads.claude.ai/claude-code-releases/${pkgver}/linux-arm64/claude")

sha256sums=('SKIP')
sha256sums_x86_64=('6832dc3f1797b890b71116e5f2dbbf9a83fd3d0498c235b4b0f9cd0e6e499ad6')
sha256sums_aarch64=('db47335532cbcab67a4b3ab16d8f3f77976bf85d53c7d79f8296538aa22bfce6')

package() {
	install -Dm755 "${srcdir}/claude-${pkgver}-${CARCH}" "${pkgdir}/opt/claude-code/bin/claude"

	# Create wrapper script to disable upstream update paths, and to suppress the
	# native-install health check. Claude Code expects the native installer layout
	# (~/.local/bin/claude); since we install to /opt + /usr/bin it would otherwise
	# warn on every startup: "claude command at ~/.local/bin/claude missing or broken".
	install -dm755 "${pkgdir}/usr/bin"
	cat > "${pkgdir}/usr/bin/claude" << 'EOF'
#!/bin/sh
export DISABLE_UPDATES=1
export DISABLE_INSTALLATION_CHECKS=1
exec /opt/claude-code/bin/claude "$@"
EOF
	chmod 755 "${pkgdir}/usr/bin/claude"

	install -Dm644 "${srcdir}/cc-legal" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
