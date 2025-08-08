# Maintainer: Christopher Cooper <christopher@cg505.com>
pkgname=cursor-cli
# extracted from https://cursor.com/install
_ver_hash=32c684dc5c8a0e364043db77d4e5b9a5dc1e2d3b
pkgver=20250808.0.32c684dc5c8a0e364043db77d4e5b9a5dc1e2d3b
pkgrel=1
pkgdesc="Cursor Agent CLI - AI-powered code assistant"
arch=('x86_64' 'aarch64')
url="https://cursor.com"
license=('LicenseRef-Cursor')
# note: there are no deps - they bundle node in the tarball
source=('LICENSE')
source_x86_64=("cursor-cli-${_ver_hash}-${CARCH}.tar.gz:https://downloads.cursor.com/lab/${_ver_hash}/linux/x64/agent-cli-package.tar.gz")
source_aarch64=("cursor-cli-${_ver_hash}-${CARCH}.tar.gz:https://downloads.cursor.com/lab/${_ver_hash}/linux/arm64/agent-cli-package.tar.gz")
b2sums=('7079c023e03ea4d78b067ed0f22b5cc1982c306721b2ea6be3c7f73bbbe0e8f05b148fd6571902b838464ee80a787ef7be73135c622f0a4fdb16c38429ced8d6')
b2sums_x86_64=('936c8a7dab8561c02b72abcc27c1e1b606a6b4b7e9771aa98bd55d580bc457300f8feda8526bee3d07863bdbd010d4cd551f74cb00ba5f075d37c39ff00d8929')
b2sums_aarch64=('936c8a7dab8561c02b72abcc27c1e1b606a6b4b7e9771aa98bd55d580bc457300f8feda8526bee3d07863bdbd010d4cd551f74cb00ba5f075d37c39ff00d8929')

pkgver() {
    local today prev_date prev_date_ver prev_hash new_date_ver
    today="$(date +%Y%m%d)"

    # Expect pkgver in the form: YYYYMMDD.DATE_VER.HASH
    IFS='.' read -r prev_date prev_date_ver prev_hash <<< "${pkgver}"

    # Strict validation – error out on malformed current pkgver
    [[ "${prev_date}" =~ ^[0-9]{8}$ ]] || { echo "pkgver(): invalid prev_date in pkgver='${pkgver}'" >&2; return 1; }
    [[ "${prev_date_ver}" =~ ^[0-9]+$ ]] || { echo "pkgver(): invalid prev_date_ver in pkgver='${pkgver}'" >&2; return 1; }
    [[ -n "${prev_hash}" ]] || { echo "pkgver(): missing prev_hash in pkgver='${pkgver}'" >&2; return 1; }

    if [[ "${today}" == "${prev_date}" ]]; then
        if [[ "${_ver_hash}" != "${prev_hash}" ]]; then
            if [[ "${prev_date_ver}" =~ ^[0-9]+$ ]]; then
                new_date_ver=$((prev_date_ver + 1))
            else
                new_date_ver=1
            fi
        else
            new_date_ver="${prev_date_ver}"
        fi
    else
        new_date_ver=0
    fi

    echo "${today}.${new_date_ver}.${_ver_hash}"
}

package() {
    # Create necessary directories
    install -dm755 "${pkgdir}/opt/cursor-agent"
    install -dm755 "${pkgdir}/usr/bin"

    # Copy all files from the extracted package
    cp -r "${srcdir}"/dist-package/* "${pkgdir}/opt/cursor-agent/"

    # Create symlink in /usr/bin
    ln -s "/opt/cursor-agent/cursor-agent" "${pkgdir}/usr/bin/cursor-agent"

	# Install license
	# This is downloaded from https://cursor.com/terms-of-service
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
