# Maintainer: Tomasz Zok <tomasz dot zok at gmail dot com>
# Inspired by PKGBUILD of ucsf-chimera
pkgname=chimerax
pkgver=1.5
pkgrel=2
pkgdesc="UCSF ChimeraX (or simply ChimeraX) is the next-generation molecular visualization program from the Resource for Biocomputing, Visualization, and Informatics (RBVI), following UCSF Chimera."
arch=(x86_64)
url="https://www.cgl.ucsf.edu/chimerax/"
license=(custom)
depends=(libffi6)
options=(!strip)
source=(LICENSE)
sha256sums=('4361604379b11e73ad942144ef84aaf479815f80265f98fed9879f3c82e3aa8d')

_source=https://www.cgl.ucsf.edu/chimerax/cgi-bin/secure/chimerax-get.py
_file=ChimeraX-${pkgver}.tar.gz
_filepath=${pkgver}/linux/ChimeraX-${pkgver}.tar.gz

prepare() {
	cd "${srcdir}"

	if [ -f "${_file}" ]; then
		tar xf "${_file}"
		return
	fi

	echo 'IMPORTANT: By downloading you accept the UCSF ChimeraX Non-Commercial Software License Agreement!'
	echo 'IMPORTANT: You can find the license agreement here: https://aur.archlinux.org/cgit/aur.git/plain/LICENSE?h=chimerax'
	echo 'IMPORTANT: If you do not agree, please press Ctrl-C now.'
	echo 'IMPORTANT: Downloading in 10 seconds...'

	sleep 10

	_ident="$(curl -s -F file="${_filepath}" -F choice=Accept "${_source}")"
	_ident="$(echo "$_ident" | grep 'a href' | awk -F'[?=&]' '{print $4}')"
	_ident="$(echo "$_ident" | sed 's@+@ @g;s@%@\\x@g' | xargs -0 printf "%b")"
	curl -L -F file="${_filepath}" -F ident="${_ident}" -F choice=Notified "${_source}" -o "${_file}"
	tar xf "${_file}"
}

package() {
	cd "${srcdir}"
	install -d "${pkgdir}/opt/chimerax" "${pkgdir}/usr/bin"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	cp -R "${pkgname}-${pkgver}"/{bin,include,lib,share} "${pkgdir}/opt/chimerax/"
	ln -s "/opt/chimerax/bin/ChimeraX" "${pkgdir}/usr/bin"
}
