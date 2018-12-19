pkgname=rtl8723bu-git-dkms
_pkgname=rtl8723bu
pkgver=230
pkgrel=11
pkgdesc="Driver for RTL8723BU DKMS version"
url="https://github.com/lwfinger/rtl8723bu"
provides=('rtl8723bu-git-dkms')
conflicts=('rtl8723bu')
arch=('any')
license=('GPL')
install=rtl8723bu-git-dkms.install
depends=('dkms')
source=("${_pkgname}::git+https://github.com/lwfinger/rtl8723bu"
	'blacklist-rtl8723bu.conf'
	'dkms.conf')
sha256sums=('SKIP'
            'dc6a9bfc6a796461da2219accc7a6ae755ea13253737630e1538f3d98aa7aff5'
            'f69382567fe8500990de9a0603fa2ab3a49bfd8f5603e905ebe1977f25fa7d81')

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "%s" "$(git rev-list --count HEAD)"
  )
}

prepare() {
    cd "${srcdir}/${_pkgname}"
}

package() {
    cd "${srcdir}"
    local install_dir="${pkgdir}/usr/src/${_pkgname}-${pkgver}"
    # Copy dkms.conf
    install -Dm644 dkms.conf "${install_dir}/dkms.conf"
    #blacklist rtl8723bu
    install -Dm644 blacklist-rtl8723bu.conf "${pkgdir}"/etc/modprobe.d/blacklist-rtl8723bu.conf
    # Set name and version
    sed -e "s/@_PKGBASE@/${_pkgname}/" \
        -e "s/@PKGVER@/${pkgver}/" \
        -i "${install_dir}/dkms.conf"
    cd "${srcdir}/${_pkgname}"
    for d in $(find . -type d); do
	install -dm755 "${install_dir}/$d"
    done
    for f in $(find . -type f); do
	install -m644 "$f" "${install_dir}/$f"
    done
    sed -i 's/EXTRA_CFLAGS += -DCONFIG_CONCURRENT_MODE/#EXTRA_CFLAGS += -DCONFIG_CONCURRENT_MODE/g' ${install_dir}/Makefile
}
