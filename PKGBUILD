# Maintainer: Christopher Cooper <christopher@cg505.com>
pkgname=cursor-cli
# extracted from https://cursor.com/install (managed by 'update-pkgver.sh')
_upstream_ver='2026.05.24-dda726e'
# Baseline pkgver; update using './update-pkgver.sh'
pkgver=2026.05.24.1.dda726e
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
b2sums_x86_64=('1a386eb3b083226e53a13cfe89264db29b6225657bf1f0d3b8cc3ce3244688301edebb0e471fa5183bfb9a2626597a8b55fe8c9fa234ea35cb633679ed7e3596')
b2sums_aarch64=('5faaa1ee28170b664c7ba7a2872f4cbf6ac34cd442ec075c687d772670a7b627ce8f0c5af8343909e4ad3ccb1176c199cc66155053a2543d36773083ad1f4736')

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
