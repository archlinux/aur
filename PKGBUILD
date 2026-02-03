# Maintainer: pika02 <pikakolendo02 at gmail dot com>
# Contributer: Tomasz Zok <tomasz dot zok at gmail dot com>
# Inspired by PKGBUILD of ucsf-chimera
pkgname=chimerax
pkgver=1.11.1
pkgrel=1
pkgdesc="UCSF ChimeraX (or simply ChimeraX) is the next-generation molecular visualization program from the Resource for Biocomputing, Visualization, and Informatics (RBVI), following UCSF Chimera."
arch=(x86_64)
url="https://www.cgl.ucsf.edu/chimerax/"
license=(custom)
depends=(
# libffi6
# libxcrypt-compat
)
makedepends=(ostree)
options=(!strip)
source=(LICENSE chimerax.desktop)
sha256sums=('4361604379b11e73ad942144ef84aaf479815f80265f98fed9879f3c82e3aa8d'
            'caa99276e5afccf36af41892d223fd1698cdf87a190f1abf1a751b2cf114c4fb')

# _major=$(echo ${pkgver} | awk -F. '{ if (NF >= 2) { print $1 "." $2 } else print $1 }')
_source=https://www.rbvi.ucsf.edu/chimerax/cgi-bin/secure/chimerax-get.py
_file=ChimeraX-${pkgver}.flatpak
_filepath=${pkgver}/flatpak/${_file}

extract() {
	# extract flatpak bundle, ref: https://github.com/flatpak/flatpak/issues/126#issuecomment-227068860
	ostree init --repo=repo --mode=bare-user
	ostree static-delta apply-offline --repo=repo ${_file}
	if [ -d outdir ]; then rm -r outdir; fi
	ostree checkout --repo=repo -U $(basename $(echo repo/objects/*/*.commit | cut -d/ -f3- --output-delimiter= ) .commit) outdir
	mv "outdir/files" "${srcdir}/${pkgname}-${pkgver}"
}

prepare() {
	if [ -f ../"${_file}" ]; then
		echo "${_file}" found in local folder! Preparing...
		ln -s ../"${_file}" "${srcdir}/"
		extract
		return
	elif [ -f ${srcdir}/"${_file}" ]; then
		echo "${_file}" found in ${srcdir}! Preparing...
		extract
		return
	fi
	
	echo "${_file}" not found in local folder! Downloading...
	
	echo 'IMPORTANT: By downloading you accept the UCSF ChimeraX Non-Commercial Software License Agreement!'
	echo 'IMPORTANT: You can find the license agreement here: https://aur.archlinux.org/cgit/aur.git/plain/LICENSE?h=chimerax'
	echo 'IMPORTANT: If you do not agree, please press Ctrl-C now.'
	echo 'IMPORTANT: Downloading in 5 seconds...'

	sleep 5

	_ident="$(curl -s -F file="${_filepath}" -F choice=Accept "${_source}")"
	_ident="$(echo "$_ident" | grep 'a href' | awk -F'[?=&]' '{print $4}')"
	_ident="$(echo "$_ident" | sed 's@+@ @g;s@%@\\x@g' | xargs -0 printf "%b")"
	curl -L -F file="${_filepath}" -F ident="${_ident}" -F choice=Notified "${_source}" -o "${_file}"
	extract

}

package() {
	cd "${srcdir}"
	install -d "${pkgdir}/opt/chimerax" "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/share/ChimeraX-icon.svg" "${pkgdir}/usr/share/pixmaps/ChimeraX-icon.svg"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 chimerax.desktop "${pkgdir}/usr/share/applications/chimerax.desktop"
	cp -R "${pkgname}-${pkgver}"/{bin,include,lib,share} "${pkgdir}/opt/chimerax/"
	ln -s "/opt/chimerax/bin/ChimeraX" "${pkgdir}/usr/bin"
}
