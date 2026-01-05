# Maintainer: Christopher Cooper <christopher@cg505.com>
pkgname=cursor-cli
# extracted from https://cursor.com/install (managed by 'update-pkgver.sh')
_upstream_ver='2026.01.02-80e4d9b'
# Baseline pkgver; update using './update-pkgver.sh'
pkgver=2026.01.02.1.80e4d9b
pkgrel=1
epoch=1
pkgdesc="Cursor Agent CLI - AI-powered code assistant"
arch=('x86_64' 'aarch64')
url="https://cursor.com"
license=('LicenseRef-Cursor')
depends=('gcc-libs' 'bash' 'glibc' 'nodejs' 'ripgrep')
install=cursor-cli.install
source=('Cursor-TOS')
source_x86_64=("cursor-cli-${_upstream_ver}-x86_64.tar.gz::https://downloads.cursor.com/lab/${_upstream_ver}/linux/x64/agent-cli-package.tar.gz")
source_aarch64=("cursor-cli-${_upstream_ver}-aarch64.tar.gz::https://downloads.cursor.com/lab/${_upstream_ver}/linux/arm64/agent-cli-package.tar.gz")
b2sums=('7079c023e03ea4d78b067ed0f22b5cc1982c306721b2ea6be3c7f73bbbe0e8f05b148fd6571902b838464ee80a787ef7be73135c622f0a4fdb16c38429ced8d6')
b2sums_x86_64=('d33b00dbb289220bbc3263d0f00b5479e868f6e592992134d2fd23644a8688141b5f6b77a73c18ee5be18e0cbdeb2be6cfd6df7c23bc76cb078c0258debca681')
b2sums_aarch64=('7cf66db8b813033ea856ad24ec4e038b2874799f250677e5e3cfc3227c9d867b93277d60b778a5f808eb4796c745d06756344a9279ad195a5a6333091e16654e')

package() {
    # Create necessary directories
    install -dm755 "${pkgdir}/opt/cursor-agent"
    install -dm755 "${pkgdir}/usr/bin"

    # Copy all files from the extracted package
    cp -r "${srcdir}"/dist-package/* "${pkgdir}/opt/cursor-agent/"

	# Replace node and rg with system versions
	ln -sf "/usr/bin/node" "${pkgdir}/opt/cursor-agent/node"
	ln -sf "/usr/bin/rg" "${pkgdir}/opt/cursor-agent/rg"

    # Patch cursor-agent script to block auto-updates
    sed -i '/^NODE_BIN=/a\
    # Block cursor-agent auto-updates\
    mkdir -p "${XDG_DATA_HOME:-$HOME/.local/share}/cursor-agent/versions"\
    chmod -x "${XDG_DATA_HOME:-$HOME/.local/share}/cursor-agent/versions"' "${pkgdir}/opt/cursor-agent/cursor-agent"

    # Create symlink in /usr/bin
    ln -s "/opt/cursor-agent/cursor-agent" "${pkgdir}/usr/bin/cursor-agent"

	# Install license
	# This is downloaded from https://cursor.com/terms-of-service
	install -Dm644 Cursor-TOS "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
