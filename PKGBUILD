# Maintainer: Agustin Carrasco <asermax@gmail.com>
pkgname=claude-code-stable
pkgver=2.1.148
pkgrel=1
pkgdesc="An agentic coding tool that lives in your terminal (stable channel)"
arch=('x86_64' 'aarch64')
url="https://github.com/anthropics/claude-code"
license=('LicenseRef-claude-code')
depends=('bash')
provides=('claude-code')
conflicts=('claude-code')
# Binary is a self-contained Bun executable with embedded JS/resources - stripping breaks it
options=('!strip')
optdepends=(
	'git: allow Claude to use git'
	'github-cli: interact with GitHub'
	'glab: interact with GitLab'
	'ripgrep: enhanced file search'
)

# This bucket is used in the official install script at https://claude.ai/install.sh
# curl -fsSL https://claude.ai/install.sh | grep GCS_BUCKET
_gcs_bucket="https://storage.googleapis.com/claude-code-dist-86c565f3-f756-42ad-8dfa-d59b1c096819/claude-code-releases"
source=("LICENSE::https://raw.githubusercontent.com/anthropics/claude-code/refs/heads/main/LICENSE.md")
source_x86_64=("claude-${pkgver}-x86_64::${_gcs_bucket}/${pkgver}/linux-x64/claude")
source_aarch64=("claude-${pkgver}-aarch64::${_gcs_bucket}/${pkgver}/linux-arm64/claude")

sha256sums=('728158fd1037143fad6907e8fa34804177e598b7326519503fe83cafdef849e6')
sha256sums_x86_64=('3b38836a1801a6397f8431c6a62b127ce47e3e9d103c1a700fca7f9c8ab5f8ac')
sha256sums_aarch64=('b53c29b1fe003372636048c16d57a74f1ca2c57d8413dd5b14e2ca77710823ed')

package() {
	install -Dm755 "${srcdir}/claude-${pkgver}-${CARCH}" "${pkgdir}/opt/claude-code/bin/claude"

	# Create wrapper script that sets NPM_CONFIG_PREFIX to avoid false npm detection
	install -dm755 "${pkgdir}/usr/bin"
	cat > "${pkgdir}/usr/bin/claude" << 'EOF'
#!/bin/sh
# Wrapper to prevent claude from detecting /usr/bin/claude as npm-global installation
export NPM_CONFIG_PREFIX="${NPM_CONFIG_PREFIX:-/nonexistent}"
# Disable autoupdater
export DISABLE_AUTOUPDATER=1
exec /opt/claude-code/bin/claude "$@"
EOF
	chmod 755 "${pkgdir}/usr/bin/claude"

	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
