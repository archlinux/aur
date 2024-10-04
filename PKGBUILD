# Maintainer: Victor Golovanenko <drygdryg2014 (at) yandex (d0t) com>

_pkgname=8188eu
_pkgver=5.3.9
pkgname=8188eu-aircrack-dkms-git
pkgver=5.3.9.r198.f969c54
pkgrel=1
pkgdesc="Realtek RTL8188EUS and RTL8188ETV Wi-Fi driver with monitor mode & frame injection support"
arch=('x86_64' 'i686' 'pentium4' 'aarch64')
url="https://github.com/aircrack-ng/rtl8188eus"
license=(GPL-2.0-only)
depends=('dkms')
makedepends=('git')
provides=('8188eu-dkms')
conflicts=('8188eu-dkms' '8188eu-dkms-git')
source=("${_pkgname}::git+${url}#branch=v${_pkgver}"
        'blacklist-r8188eu.conf')
md5sums=('SKIP'
         '8af5df9ed717b3bb48df59dac0c8a9c8')

pkgver() {
	cd "${_pkgname}"
	printf "${_pkgver}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	# Blacklist in-kernel r8188eu
	install -Dm644 blacklist-r8188eu.conf "${pkgdir}/etc/modprobe.d/r8188eu.conf"

	cd "${_pkgname}"
	local install_dir="${pkgdir}/usr/src/${_pkgname}-${pkgver}"
	install -Dm644 dkms.conf "${install_dir}/dkms.conf"
	for d in "core" "hal" "include" "os_dep" "platform"; do
		for f in $(find "$d" -type f); do
	    	install -Dm644 "$f" "${install_dir}/$f"
		done
	done

	install -m644 "Makefile" "${install_dir}/Makefile"
}
