# Maintainer: Victor Golovanenko <drygdryg2014 (at) yandex (d0t) com>

_pkgname=8188eu
_pkgver=5.3.9
pkgname=8188eu-aircrack-dkms-git
pkgver=5.3.9.r184.f8ead57
pkgrel=1
pkgdesc="Realtek RTL8188EUS and RTL8188ETV Wi-Fi driver with monitor mode & frame injection support"
arch=('x86_64' 'i686' 'pentium4' 'aarch64')
url="https://github.com/aircrack-ng/rtl8188eus"
license=('GPL')
depends=('dkms')
makedepends=('git')
provides=('8188eu-dkms')
conflicts=('8188eu-dkms' '8188eu-dkms-git')
source=("${_pkgname}::git+${url}#branch=v${_pkgver}"
        'blacklist-r8188eu.conf'
        'https://github.com/aircrack-ng/rtl8188eus/pull/225.patch')
md5sums=('SKIP'
         '8af5df9ed717b3bb48df59dac0c8a9c8'
         '40f478a41f8467ed6c0a5867e818637e')

pkgver() {
	cd "${_pkgname}"
	printf "${_pkgver}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
        patch -p1 -d $srcdir/8188eu/ < 225.patch
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
