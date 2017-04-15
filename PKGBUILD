# Maintainer: David Manouchehri <david.manouchehri@riseup.net>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

_gitname="ndpi"
_gitbranch="netfilter"
_gitauthor="vel21ripn"
_pkgbase="${_gitname}-${_gitbranch}"
_pkgname="${_pkgbase}-dkms"
pkgname="${_pkgname}-git"
install="${_pkgname}.install"
pkgver=r225.8c1ed91
pkgrel=1
pkgdesc="${_pkgbase} kernel module (${_gitauthor})"
arch=('i686' 'x86_64')
url="https://github.com/${_gitauthor}/${_gitname}"
license=("LGPLv3")
source=("git://github.com/${_gitauthor}/${_gitname}#branch=${_gitbranch}"
		"dkms.conf")
sha512sums=('SKIP'
			'1ea586776ea93cdb0d8aeab6a240ac7c1809b283993162dd2d327da3f10df8d4d8fec0fb02096a0d54e460fda8322b0a997b4e3248098db4b1401f2f57616945')
replaces=("${_pkgbase}" "${_pkgname}" "ipt_ndpi")
conflicts=("${_pkgbase}" "${_pkgname}" "ipt_ndpi" "ndpi")
provides=("${_pkgbase}" "${_pkgname}" "ipt_ndpi")
makedepends=('linux-lts-headers' 'git')
depends=('linux-lts' 'iptables' 'conntrack-tools' 'dkms')

pkgver() {
	cd "${srcdir}/${_gitname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "${srcdir}/${_gitname}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${_gitname}"
	make DESTDIR="${pkgdir}" install

	install -Dm644 ${srcdir}/dkms.conf ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf

	sed -e "s/@_PKGBASE@/${_pkgbase}/" \
		-e "s/@PKGVER@/${pkgver}/" \
		-i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

	cp -r ${_pkgbase}/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/

	# install -Dm644 "INSTALL" "${pkgdir}/usr/share/doc/${pkgname}/README"
	# install -Dm755 "libxt_ndpi.so" "${pkgdir}/usr/lib/iptables/libxt_ndpi.so"
}
