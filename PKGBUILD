# Maintainer : Cole Deck <cole at deck dot sh>
# Contributor : Davi da Silva Böger <dsboger at gmail dot com>
# Contributor : adytzu2007 <adybac at gmail {dot} com>
# Contributor : Samsagax <samsagax at gmail {dot} com>
# Contributor : abbradar <nikoamia at gmail {dot} com>

pkgname=bbswitch-g14-dkms-git
_pkgname='bbswitch'
pkgver=0.8.r5.gddbd243
pkgrel=2
pkgdesc="kernel module allowing to switch dedicated graphics card on the Zephyrus G14 and other similar laptops"
arch=('i686' 'x86_64')
url="https://github.com/Bumblebee-Project/bbswitch"
license=('GPL')
provides=('bbswitch')
conflicts=('bbswitch-git' 'bbswitch' 'bbswitch-dkms' 'dkms-bbswitch' 'bbswitch-dkms-git')
depends=('dkms' 'linux-headers')
makedepends=('git')
_gitroot='git://github.com/Bumblebee-Project/bbswitch.git'
_gitbranch='develop'
source=("${_gitroot}#branch=${_gitbranch}"
	"bbswitch-dkms-git-zephyrus14.patch")
sha256sums=("SKIP"
	    "5d9cc08ee9e1f614d9c25548c073809f6a1f8a2daf73c6a8ae16d70b91b26e92")


pkgver() {
    cd "$srcdir/${_pkgname}"
    git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  # Exceprt adapted from upstream Makefile.dkms
  sed -e "s/#MODULE_VERSION#/${pkgver}/" -i "dkms/dkms.conf"
}

package() {
  cd "${srcdir}/${_pkgname}"
  patch -p2 bbswitch.c ${srcdir}/bbswitch-dkms-git-zephyrus14.patch
  install -dm755 "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
  install -Dm644 Makefile bbswitch.c dkms/dkms.conf "${pkgdir}/usr/src/${_pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/share/doc/${_pkgname}/"
  install -Dm644 NEWS README.md "${pkgdir}/usr/share/doc/${_pkgname}/"
}
