# Maintainer: Christopher Cooper <christopher@cg505.com>
# Maintainer: Jérôme Poulin <jeromepoulin@gmail.com>
pkgname=claude-code
pkgver=2.1.117
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
sha256sums_x86_64=('b7246963d9e32ece439c3e1e7885f53773a4820e90a4d2433ef2a413a055a5fe')
sha256sums_aarch64=('302c9c189552dc261b1c4511d0d8c9147baeaa4bf7e50785873fa1699ee51f22')

package() {
	install -Dm755 "${srcdir}/claude-${pkgver}-${CARCH}" "${pkgdir}/opt/claude-code/bin/claude"

	# Create wrapper script to disable autoupdater
	install -dm755 "${pkgdir}/usr/bin"
	cat > "${pkgdir}/usr/bin/claude" << 'EOF'
#!/bin/sh
export DISABLE_AUTOUPDATER=1
exec /opt/claude-code/bin/claude "$@"
EOF
	chmod 755 "${pkgdir}/usr/bin/claude"

	install -Dm644 "${srcdir}/cc-legal" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
