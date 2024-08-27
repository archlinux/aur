# Maintainer: boogiepop <boogiepop@gmx.com>
# Contributor: KafCoppelia <k740677208@gmail.com>

_pkgbase=8852be
pkgname=${_pkgbase}-dkms-git
pkgver=1.15.10.0.5.0.4
pkgrel=1
pkgdesc="Realtek RTL8852BE Wi-Fi driver for Radxa."
arch=('any')
url="https://github.com/radxa-pkg/${_pkgbase}-dkms"
license=('GPL')
depends=('dkms' 'bc' 'linux-headers')
makedepends=('git')
conflicts=(${_pkgbase})
source=(git+${url}.git)
sha256sums=('SKIP')

pkgver() {
	cd ${srcdir}/${_pkgbase}-dkms
	_version=$(git tag -l --sort -version:refname | head -n 1)
	printf ${_version//[-]/\.}
}

package() {
    cd ${srcdir}/${_pkgbase}-dkms

    mkdir -p ${pkgdir}/usr/src/${_pkgbase}-${pkgver}

    cp debian/dkms debian/dkms.conf
    mv debian/dkms.conf ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
    # install -Dm644 dkms.conf ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf

    # Set name and version
    sed -e "s/@_PKGBASE@/${_pkgbase}/" \
        -e "s/@PKGVER@/${pkgver}/" \
        -i ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf

    # Copy sources (including Makefile)
    cp -pr ./src/* ${pkgdir}/usr/src/${_pkgbase}-${pkgver}

    # Blacklists conflicting module
    # install -Dm644 ${pkgname}.conf "${srcdir}/usr/lib/modprobe.d/${pkgname}.conf"
}
