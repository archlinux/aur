# Maintainer : adytzu2007 <adybac at gmail {dot} com>
# Contributor: Samsagax <samsagax at gmail {dot} com>
# Contributor : abbradar <nikoamia at gmail {dot} com>

pkgname=bbswitch-dkms-git
pkgver=v0.8.r0.g0c38f97
pkgrel=1
pkgdesc="kernel module allowing to switch dedicated graphics card on Optimus laptops, dkms version"
arch=('i686' 'x86_64')
url=("http://github.com/Bumblebee-Project/bbswitch")
license=('GPL')
provides=('bbswitch')
conflicts=('bbswitch-git' 'bbswitch' 'dkms-bbswitch')
depends=('dkms' 'linux-headers')
imakedepends=('git')
install=bbswitch-dkms-git.install
_gitroot='git://github.com/Bumblebee-Project/bbswitch.git'
_gitname='bbswitch'
_gitbranch='develop'
source=("${_gitname}::${_gitroot}#branch=${_gitbranch}"
        "dkms.conf.in"
        "makefile_dkms.patch")
sha256sums=("SKIP"
            "6bcdd486de01b8cb4842d94be7b33baa52c9405782bf227102cfa32ed691b8cd"
            "a05fb9e528f8d67d9819054d548c74e05e799cc570eddcb4f81a886b6d4d3812")

pkgver() {
    cd "$srcdir/${_gitname}"
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_gitname}"

    # patch Makefile to consider KERNELRELEASE
    patch -p1 < "${srcdir}/makefile_dkms.patch"
}

build() {
    cd "${srcdir}/${_gitname}"

    # create dkms.conf
    sed -e "s/@PKGVER@/${pkgver}/" < "${srcdir}/dkms.conf.in" > dkms.conf
}

package() {
  cd "${srcdir}/${_gitname}"
  install -dm755 "${pkgdir}/usr/src/bbswitch-${pkgver}/"
  cp -r * "${pkgdir}/usr/src/bbswitch-${pkgver}/"
}
