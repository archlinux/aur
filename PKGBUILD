# Maintainer: Christopher Cooper <christopher@cg505.com>
# Maintainer: Jérôme Poulin <jeromepoulin@gmail.com>
pkgname=claude-code
pkgver=2.0.32
pkgrel=2
pkgdesc="An agentic coding tool that lives in your terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/anthropics/claude-code"
license=('LicenseRef-claude-code')
depends=('bash' 'glibc')
# Binary is a self-contained Bun executable with embedded JS/resources - stripping breaks it
options=('!strip')
optdepends=(
	'git: allow Claude to use git'
	'github-cli: interact with GitHub'
	'glab: interact with GitLab'
	'ripgrep: enhanced file search'
)

_gcs_bucket="https://storage.googleapis.com/claude-code-dist-86c565f3-f756-42ad-8dfa-d59b1c096819/claude-code-releases"
source=("LICENSE::https://raw.githubusercontent.com/anthropics/claude-code/refs/heads/main/LICENSE.md")
source_x86_64=("claude-${pkgver}-x86_64::${_gcs_bucket}/${pkgver}/linux-x64/claude")
source_aarch64=("claude-${pkgver}-aarch64::${_gcs_bucket}/${pkgver}/linux-arm64/claude")

sha256sums=('8b601297f77814bdd043daedb9a5ab89effad513a2ce5513c90cd12abac418a5')
sha256sums_x86_64=('3a9e90f7f6a820f158a2e83977e916ca6ce6082ad80ff038ba129cf8e519637a')
sha256sums_aarch64=('873edc4f4daf522b8830ab871f1842fdea31912ab3c1a450d88c619d80b0d3bb')

package() {
	install -Dm755 "${srcdir}/claude-${pkgver}-${CARCH}" "${pkgdir}/opt/claude-code/bin/claude"

	# Create wrapper script that sets NPM_CONFIG_PREFIX to avoid false npm detection
	install -dm755 "${pkgdir}/usr/bin"
	cat > "${pkgdir}/usr/bin/claude" << 'EOF'
#!/bin/sh
# Wrapper to prevent claude from detecting /usr/bin/claude as npm-global installation
export NPM_CONFIG_PREFIX="${NPM_CONFIG_PREFIX:-/nonexistent}"
exec /opt/claude-code/bin/claude "$@"
EOF
	chmod 755 "${pkgdir}/usr/bin/claude"

	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
