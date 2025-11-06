# Maintainer: Christopher Cooper <christopher@cg505.com>
pkgname=cursor-cli
# extracted from https://cursor.com/install (managed by 'update-pkgver.sh')
_upstream_ver='2025.11.06-8fe8a63'
# Baseline pkgver; update using './update-pkgver.sh'
pkgver=2025.11.06.1.8fe8a63
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
b2sums_x86_64=('12e12730f805fc5c227e2b4e4e462c2d3a716d187233332e805dcac50db1d1a1cb9bb524a53baff7f658f83e93aebdadc59c5d16278001e525407965471c5670')
b2sums_aarch64=('7c80a9a842a47b1d82bbafc54ee645aaec38fc2bc4628f77fa06eef57325d32b3bd6ae57640cc460bd2ad23dab388d029bdf282f370d8c3f624e8e58eade0da3')

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
