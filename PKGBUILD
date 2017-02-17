# Maintainer:     VOID_133 <zhangjianqiu13(at)gmail.com>
# Maintainer:     Ken_Ookami_Horo <horo(at)yoitsu.moe>
# Contributor:    Sherlock Holo <sherlockya(at)gmail.com>
# Contributor:    FiveYellowMice <hkz85825915(at)gmail.com>


pkgname=dev-horo-git
_pkgname=dev.horo
pkgver=0.0.1
pkgrel=3
pkgdesc="Horo in your Linux"
arch=('i686' 'x86_64')
url="https://github.com/VOID001/dev.horo"
license=("GPL3")
depends=('dkms')
makedepends=('git' 'go')
source=("git+https://github.com/VOID001/${_pkgname}.git"
        "dkms.conf"
)
#install=$pkgname.install

_kernelname="$(uname -r)"
_kernver="/usr/lib/modules/$_kernelname/build"
_MODULE_NAME="horok.ko"
_HOROPROXY="horoproxy"

build() {
        cd "$srcdir/$_pkgname"
        #git checkout aur-build (now can use master)
        #make -C ${_kernver} M=`pwd`
        cd "$_HOROPROXY"
        go build
}

package() {
        cd "$srcdir/$_pkgname"
        install -Dm755 ${_HOROPROXY}/${_HOROPROXY} "$pkgdir/usr/local/bin/${_HOROPROXY}"
        #install -Dm644 ${_MODULE_NAME} "$pkgdir/usr/lib/modules/${_kernelname}/kernel/${_MODULE_NAME}"
        #gzip                           "$pkgdir/usr/lib/modules/${_kernelname}/kernel/${_MODULE_NAME}"
        cd $srcdir
        install -Dm644 dkms.conf "$pkgdir/usr/src/${pkgname}-${pkgver}/dkms.conf"

        sed -e "s/@PKGNAME@/${pkgname}/" \
            -e "s/@PKGVER@/${pkgver}/" \
            -i "${pkgdir}/usr/src/${pkgname}-${pkgver}/dkms.conf"

        sed -e "10s/^/#/g" -i "${srcdir}/${_pkgname}/Makefile"

        cp -r ${_pkgname}/* "${pkgdir}/usr/src/${pkgname}-${pkgver}/"
}


md5sums=('SKIP'
         '11526109d931b93e857df708b29e75ec')
