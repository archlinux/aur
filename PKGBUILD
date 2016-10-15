# Maintainer: Timo Sarawinski <t.sarawinski@gmail.com>
pkgname=8723bs-git-dkms
_pkgname=${pkgname%-*}
_pkgbase=8723bs
pkgver=9ea0240
pkgrel=1
pkgdesc="RTL8723BS WIFI driver working on baytrail tablets DKMS version"
url="http://www.realtek.com.tw/"
arch=('any')
license=('GPL')
install=8723bs-git-dkms.install
depends=('dkms')
provides=('8723bs')
conflicts=('8723bs-git')
source=("git+https://github.com/muhviehstah/rtl8723bs"
	'dkms.conf'
	'blacklist-r8723bs.conf')
sha256sums=('SKIP'
	'5d64a8a038c12cdd055d07fcc0f7cf324a36a39d676ea2a49f3913328d8c3b6c'
	'7b269bda4c697037ff71647ada8591c887184d51c247f7a5d00cfacf787319d6')

prepare() {

	cd "${srcdir}/rtl8723bs"

}

package() {
	cd "${srcdir}"

	local install_dir="${pkgdir}/usr/src/${_pkgbase}-${pkgver}"

  	# Copy dkms.conf
  	install -Dm644 dkms.conf "${install_dir}/dkms.conf"

	#blacklist r8723bs 
	install -Dm644 blacklist-r8723bs.conf "${pkgdir}"/etc/modprobe.d/blacklist-r8723bs.conf

  	# Set name and version
  	sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      	-e "s/@PKGVER@/${pkgver}/" \
      	-i "${install_dir}/dkms.conf"

	cd "${srcdir}/rtl8723bs"	

	for d in $(find . -type d)
  	do
    	 install -dm755 "${install_dir}/$d"
  	done

  	for f in $(find . -type f)
  	do
    	 install -m644 "$f" "${install_dir}/$f"
  	done
}

