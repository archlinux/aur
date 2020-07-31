# Maintainer: Sam L. Yes <samlukeyes123@gmail.com>

_pkgbase=ipts
pkgname=ipts-uapi-dkms-git
_repo=intel-precise-touch
#_branch=feature/uapi
pkgver=r98.52a3a17
pkgrel=1
epoch=1
pkgdesc="The kernelspace part of IPTS (Intel Precise Touch & Stylus) for Linux. \
To make this module work, you might need a kernel patch from the source repo."
arch=('x86_64')
url="https://github.com/linux-surface/${_repo}"
license=('GPL2')
makedepends=('git')
depends=('dkms' 'iptsd')
optdepends=()
#conflicts=("${_pkgbase}")
#install=${pkgname}.install
provides=('ipts-uapi-dkms')
#source=("git+${url}.git#branch=${_branch}")
source=("git+${url}.git")
md5sums=(SKIP)

pkgver() {
    cd ${srcdir}/${_repo}
    #git log --pretty=format:%at -1
    ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    cd ${srcdir}/$_repo

    # Copy dkms.conf
    install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

    # Copy sources (including Makefile)
    cp -r * "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/

}