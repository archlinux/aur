# Maintainer: firstpick <you@example.com>
pkgname=usrgrp-manager-bin
pkgver=0.1.0
pkgrel=2
pkgdesc="Keyboard-driven TUI to view and manage UNIX users and groups (prebuilt binary)"
arch=('x86_64')
url="https://github.com/Firstp1ck/UsrGrp-Manager-TUI"
license=('MIT')
depends=('glibc' 'shadow')
provides=("usrgrp-manager=${pkgver}")
conflicts=('usrgrp-manager' 'usrgrp-manager-git')

_binname=usrgrp-manager
# Release assets expected as:
#   x86_64:  ${_binname}

# under tag v${pkgver}
source_x86_64=("${url}/releases/download/v${pkgver}/${_binname}")
sha256sums_x86_64=('02b7d7516a6dbe40bc1040b41dd3eba68bdd34b8d3042e65385d9acee6e60044')

prepare() {
	chmod +x "${srcdir}/${_binname}" 2>/dev/null || true
}

package() {
	install -d "${pkgdir}/usr/bin"

	local cand
	for cand in \
		"${srcdir}/${_binname}" \
		"${srcdir}/"*/"${_binname}" \
		"${srcdir}/${_binname}-${pkgver}-${CARCH}/${_binname}" \
	; do
		if [[ -f "$cand" ]]; then
			install -Dm755 "$cand" "${pkgdir}/usr/bin/${_binname}"
			return 0
		fi
	done

	echo "Could not find built binary '${_binname}' in extracted sources" >&2
	exit 1
}
