# Maintainer: boogiepop <boogiepop@gmx.com>

_pkgbase=8852be
pkgname=$_pkgbase-dkms-git
pkgver=1.15.10.0.5.0.3
pkgrel=1
pkgdesc="Kernel modules for RealTek RTL8125be"
arch=('any')
url="https://github.com/radxa-pkg/${_pkgbase}-dkms.git"
license=('GPL')
provides=(${pkgname}=${pkgver} ${_pkgbase}-dkms=${pkgver})
source=(git+$url dkms.conf)
sha256sums=('SKIP'
            'cf94de86cb9e66fc1c60ec4d91895909d859caaa130c686e7376c0b5ef12bd78')
depends=('dkms' 'python' 'bc')

prepare() {
    cd ${srcdir}/$_pkgbase-dkms
	for patch in $(cat debian/patches/series)
	do
	patch -p1 -i debian/patches/$patch
	done
}

pkgver() {
	cd ${srcdir}/$_pkgbase-dkms
	_version=$(git tag -l --sort -version:refname | head -n 1)
	printf ${_version//[-]/\.}
}

package() {
    # Copy dkms.conf
    install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

    # Set name and version
    sed -e "s/@_PKGBASE@/${_pkgbase}/" \
        -e "s/@PKGVER@/${pkgver}/" \
        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Copy sources (including Makefile)
  cp -r ${_pkgbase}-dkms/src/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/

  # Blacklists conflicting module
  # install -Dm644 ${pkgname}.conf "${srcdir}/usr/lib/modprobe.d/${pkgname}.conf"
}
