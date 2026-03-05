# Maintainer: Christopher Cooper <christopher@cg505.com>
pkgname=cursor-cli
# extracted from https://cursor.com/install (managed by 'update-pkgver.sh')
_upstream_ver='2026.02.27-e7d2ef6'
# Baseline pkgver; update using './update-pkgver.sh'
pkgver=2026.02.27.1.e7d2ef6
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
b2sums_x86_64=('a677bdbe57cecfe9d74db62678ae63641f1424cf31e4d0e2bc4f714127ccba842af259cb90a02bcd488d3476b43603c28ad48ff8b98fd43add7012f830aaa03e')
b2sums_aarch64=('6f000e897bdb1d63d90ca3851cf08ad3f97e753389cd933cf1dde04f97f79078c1520e83bd4c437ea19dbda54c2ee62ee8ffac652ca4f47c5c08e85fdef42d8f')

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
