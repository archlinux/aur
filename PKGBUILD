# Maintainer: hashworks <mail@hashworks.net>

pkgname=dns-zone-blacklist-git
_pkgname="${pkgname%-git}"
pkgver=r412.73ebd31
pkgrel=1
pkgdesc="dnsmasq, bind and unbound zone files to be used in DNS based AD Blockers"
url="https://github.com/oznu/dns-zone-blacklist"
arch=("any")
license=("MIT")
conflicts=("${_pkgname}")
provides=("${_pkgname}")
optdepends=("unbound" "bind" "dnsmasq")
makedepends=("git")
source=("git+https://github.com/oznu/dns-zone-blacklist.git")
sha256sums=("SKIP")

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
	cd "${_pkgname}"
	while IFS= read -r -d '' cksum
	do
		# Checksum files are not properly formated, we need to fix them first
		echo -n " ${cksum//.checksum/}" >> "${cksum}"
		sha256sum -c "${cksum}"
	done < <(find . -type f -name "*.checksum" -print0)
}

package() {
	cd "${_pkgname}"
	find . -type f -name "*.checksum" -delete
	mkdir -p "${pkgdir}/etc/${_pkgname}"
	cp -r bind dnsmasq unbound "${pkgdir}/etc/${_pkgname}"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
