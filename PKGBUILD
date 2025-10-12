# Maintainer: firstpick <you@example.com>
pkgname=usrgrp-manager-bin
pkgver=0.2.0
pkgrel=2
pkgdesc="Keyboard-driven TUI to view and manage UNIX users and groups (prebuilt binary)"
arch=('x86_64')
url="https://github.com/Firstp1ck/UsrGrp-Manager-TUI"
license=('MIT')
options=('!strip')
depends=('glibc' 'shadow')
provides=("usrgrp-manager=${pkgver}")
conflicts=('usrgrp-manager' 'usrgrp-manager-git')

_binname=usrgrp-manager
# Release assets expected as:
#   x86_64:  ${_binname}

# under tag v${pkgver}
source_x86_64=("${url}/releases/download/v${pkgver}/${_binname}")
sha256sums_x86_64=('055c5051fa61a45f48a5877c94ea2a2f5bb3c21c2ca8fdf1b7967044e6a704d4')

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
